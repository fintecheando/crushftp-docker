FROM adoptopenjdk:11-jre-openj9

RUN export DEBIAN_FRONTEND=noninteractive && apt-get update \
	&& apt-get install -y --no-install-recommends wget unzip tzdata telnet vim dos2unix curl software-properties-common gnupg apt-transport-https software-properties-common \
	&& ln -fs /usr/share/zoneinfo/America/Mexico_City /etc/localtime \
	&& dpkg-reconfigure --frontend noninteractive tzdata dos2unix \
	&& apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD https://www.crushftp.com/early9/CrushFTP9.zip /tmp/CrushFTP9.zip
ADD ./setup.sh /var/opt/setup.sh
ADD ./crushftp_init_nobackground.sh /var/opt/run_crushftp.sh

RUN chmod +x /var/opt/setup.sh && \
    chmod +x /var/opt/run_crushftp.sh && \
    unzip /tmp/CrushFTP9.zip -d /var/opt/ && \
    rm /tmp/CrushFTP9.zip && \
    cd /var/opt/CrushFTP9 && java -jar /var/opt/CrushFTP9/CrushFTP.jar -a "fadmin" "admin" && \
    mkdir /config && \
    cp -Rf /var/opt/CrushFTP9/* /config/
    
ENTRYPOINT /var/opt/setup.sh

# FTP Server
EXPOSE 21
# HTTPS Server
EXPOSE 443
# FTP PASV transfers
EXPOSE 2000-2010
# SSH Server
EXPOSE 2222
# HTTP Servers
EXPOSE 8080 9090
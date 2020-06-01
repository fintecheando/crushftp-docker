# crushftp-docker
Ejemplo de Crushftp en Docker

1. Se construye la imagen en docker

$ docker build -t com.crushftp .

2. Se levanta para probar la imagen construida

$ docker run -d --name crushftp -p 8080:8080 com.crushftp

3. Se accede a la interfaz web con el usuario fadmin y password admin
http://localhost:9000/

4. Se detiene la imagen de docker

$ docker stop crushftp

5. Se configura el docker compose para ajustes y se levanta
$ docker-compose up -d

6. Se detiene el docker compose
$ docker-compose down

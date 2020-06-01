# crushftp-docker
Ejemplo de Crushftp en Docker

1. Se construye la imagen en docker
```bash
$ docker build -t com.crushftp .
```
2. Se levanta para probar la imagen construida
```bash
$ docker run -d --name crushftp -p 8080:8080 com.crushftp
```
3. Se accede a la interfaz web con el usuario fadmin y password admin
http://localhost:9000/

4. Se detiene la imagen de docker
```bash
$ docker stop crushftp
```
5. Se configura el docker compose para ajustes y se levanta
```bash
$ docker-compose up -d
```
6. Se detiene el docker compose
```bash
$ docker-compose down
```

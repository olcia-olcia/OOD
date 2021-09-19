docker pull ubuntu
docker pull mongodb
docker pull redis


docker run -d --name linuch -it ubuntu
docker run -d --name db -p 8080:80 -it mongo
docker run -d --name memcache -p 8080:80 -it redis

docker container stop memcache
docker container stop db
docker container stop linuch
docker rm -f $(docker ps -aq)
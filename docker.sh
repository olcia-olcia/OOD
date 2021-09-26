IMAGES=('ubuntu' 'mongo' 'redis')

for image in "${IMAGES[@]}"; do
    docker manifest inspect -v $image >> logs.txt
done


docker pull ubuntu
docker pull mongodb
docker pull redis


docker run -d --name linuch -it ubuntu
docker run -d --name db -p 27017:27017 -it mongo
docker run -d --name memcache -p 8080:8080 -it redis

docker container stop memcache
docker container stop db
docker container stop linuch
docker rm -f $(docker ps -aq)
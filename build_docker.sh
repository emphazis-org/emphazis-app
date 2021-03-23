docker stop emphazis-app

docker rm emphazis-app

docker rmi luciorq/emphazis-app:latest

# to build
DOCKER_BUILDKIT=1 docker build . -f dockerfile/Dockerfile -t luciorq/emphazis-app:latest

# to run
docker run -d \
  --restart always \
  -p 8989:3838 \
  --name emphazis-app \
  luciorq/emphazis-app:latest

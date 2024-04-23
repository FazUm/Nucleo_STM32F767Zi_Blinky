#Docker folder
DOCKER_FOLDER=docker
IMAGE_NAME="arm/gcc"
CONTAINER_NAME="builder"
MAKE_TARGET=$1

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
PROJECT_PATH=$(dirname $SCRIPT_DIR)

# Check if the image and if does not exist, create it
if !(docker image ls -a "$IMAGE_NAME" | grep -Fq "$IMAGE_NAME" 1>/dev/null); then
	echo "Could found image $IMAGE_NAME. Building image"
	docker build -t arm/gcc $PWD/docker
fi

# Check if the container is running and if not, launch it
if !(docker ps | grep -q $CONTAINER_NAME); then
	echo "Container not running. Launching new container"
	docker run --name $CONTAINER_NAME -d -it -v "$PROJECT_PATH:/home/app" $IMAGE_NAME
fi

docker exec $CONTAINER_NAME make $MAKE_TARGET

docker kill $CONTAINER_NAME >/dev/null

docker rm $CONTAINER_NAME >/dev/null


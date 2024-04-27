#Docker folder
DOCKER_FOLDER=docker
IMAGE_NAME="fazum/arm-toolchain-10.3.2021.07"
IMAGE_VERSION="latest"
CONTAINER_NAME="builder"
MAKE_TARGET=$1

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
PROJECT_PATH=$(dirname $SCRIPT_DIR)

build_docker_image() {
	echo "Building docker image"
	docker build -t $IMAGE_NAME:$IMAGE_VERSION $PWD/docker
}

get_docker_image() {
	current_image=$(docker images -q $IMAGE_NAME:$IMAGE_VERSION)
	return_hash=$(docker pull $IMAGE_NAME:$IMAGE_VERSION)
	if [[ -z "${return_hash}" && -z "$current_iamge" ]]; then
		build_docker_image
	fi
}

# Check if the image and if does not exist, create it
if !(docker image ls -a "$IMAGE_NAME:$IMAGE_VERSION" | grep -Fq "$IMAGE_NAME:$IMAGE_VERSION" 1>/dev/null); then
	get_docker_image
fi

# Check if the container is running and if not, launch it
if !(docker ps | grep -q $CONTAINER_NAME); then
	echo "Container not running. Launching new container"
	docker run --name $CONTAINER_NAME -d -it -v "$PROJECT_PATH:/home/app" $IMAGE_NAME:$IMAGE_VERSION
fi

docker exec $CONTAINER_NAME make $MAKE_TARGET

docker kill $CONTAINER_NAME >/dev/null

docker rm $CONTAINER_NAME >/dev/null


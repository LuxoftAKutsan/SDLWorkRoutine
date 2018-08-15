IMAGE=$1
FOLDER=$2 
shift 
shift 
BASE_FOLDE_NAME=$(basename $FOLDER)
docker run -it --rm  \
           -e LOCAL_USER_ID=`id -u $USER` -e DISPLAY=$DISPLAY \
	   -e IMAGE_NAME=$IMAGE \
           --security-opt seccomp=unconfined \
           --privileged \
           -v /tmp/.X11-unix:/tmp/.X11-unix -v $FOLDER:/home/developer/$BASE_FOLDE_NAME \
           $IMAGE "$@"

IMAGE_NAME=$1
shift

docker build -t $IMAGE_NAME "$@" .

if [ $? -eq 0 ]; then
	echo "================================================================================="
	echo "$IMAGE_NAME successfuly built! Now you can use it as base for your containers"
	echo "================================================================================="
fi

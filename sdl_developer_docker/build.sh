SSH_PRV="$(cat ~/.ssh/id_rsa)"
SSH_PUB="$(cat ~/.ssh/id_rsa.pub)"
./docker_build.sh `pwd | xargs basename`\
                   --build-arg ssh_prv_key="$SSH_PRV"\
                   --build-arg ssh_pub_key="$SSH_PUB"

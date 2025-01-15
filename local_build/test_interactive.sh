# Run an instance of the image
mkdir -p ../tmp
docker run -d --name local_arm_mlops_container -v $(readlink -f ../tmp):/workspace --platform=linux/amd64 arm-mlops-docker-licensed:latest sleep infinity

docker exec local_arm_mlops_container echo $BASH_ENV
docker exec -it local_arm_mlops_container /bin/bash 

docker stop local_arm_mlops_container
docker rm local_arm_mlops_container
rm -rf ../tmp
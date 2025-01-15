# Run an instance of the image
mkdir -p ../tmp
docker run -d --name local_arm_mlops_container -v $(readlink -f ../tmp):/workspace --platform=linux/amd64 arm-mlops-docker-licensed:latest sleep infinity

docker exec local_arm_mlops_container git clone https://github.com/Arm-Examples/AVH_CI_Template.git .
docker exec local_arm_mlops_container vcpkg activate  --downloads-root=. --json=env.json
docker exec local_arm_mlops_container sudo /set_env.sh 
docker exec local_arm_mlops_container echo $BASH_ENV
docker exec local_arm_mlops_container cbuild get_started.csolution.yml --packs --update-rte --context .debug+avh
docker exec local_arm_mlops_container FVP_MPS2_Cortex-M3 --simlimit 10 -f Project/fvp_config.txt -a out/Project/avh/debug/Project.axf
#docker exec local_arm_mlops_container vcpkg deactivate  --downloads-root=. --json=unload.json

docker stop local_arm_mlops_container
docker rm local_arm_mlops_container
rm -rf ../tmp./t
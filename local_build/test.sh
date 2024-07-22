
docker exec local_arm_mlops_container git clone https://github.com/Arm-Examples/AVH_CI_Template.git .
docker exec local_arm_mlops_container vcpkg activate  --downloads-root=. --json=env.json
docker exec local_arm_mlops_container /bin/bash -c ". /load_env.sh && cbuild get_started.csolution.yml --packs --update-rte --context .debug+avh"
docker exec local_arm_mlops_container /bin/bash -c ". /load_env.sh && FVP_MPS2_Cortex-M3 --simlimit 10 -f Project/fvp_config.txt -a out/Project/avh/debug/Project.axf"
wget https://github.com/Open-CMSIS-Pack/cmsis-toolbox/releases/download/2.1.0/cmsis-toolbox-linux-amd64.tar.gz -nv
wget https://github.com/Kitware/CMake/releases/download/v3.27.4/cmake-3.27.4-linux-x86_64.sh -nv
tar -xf cmsis-toolbox-linux-amd64.tar.gz -C /home/arm_mlops_docker
chmod +x cmake-3.27.4-linux-x86_64.sh
mkdir /home/arm_mlops_docker/cmake
./cmake-3.27.4-linux-x86_64.sh --skip-license --prefix=/home/arm_mlops_docker/cmake
apt install ninja-build -y
echo 'export AC6_TOOLCHAIN_6_20_1=/home/arm_mlops_docker/ArmCompilerforEmbedded6.20.1/bin' >> /home/arm_mlops_docker/.bashrc
echo 'export CMSIS_PACK_ROOT=/home/arm_mlops_docker/packs' >> /home/arm_mlops_docker/.bashrc
echo 'export CMSIS_COMPILER_ROOT=/home/arm_mlops_docker/cmsis-toolbox-linux-amd64/etc' >> /home/arm_mlops_docker/.bashrc
echo 'export PATH=/home/arm_mlops_docker/cmsis-toolbox-linux-amd64/bin:$PATH' >> /home/arm_mlops_docker/.bashrc
echo 'export PATH=/home/arm_mlops_docker/cmake/bin/:$PATH' >> /home/arm_mlops_docker/.bashrc
su -l arm_mlops_docker -c "source /home/arm_mlops_docker/.bashrc"
su -l arm_mlops_docker -c "cpackget init https://www.keil.com/pack/index.pidx"
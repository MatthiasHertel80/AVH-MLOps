wget https://github.com/Open-CMSIS-Pack/cmsis-toolbox/releases/download/2.1.0/cmsis-toolbox-linux-amd64.tar.gz -nv
apt remove -y cmake
snap install cmake
snap install ninja-build
tar -xf cmsis-toolbox-linux-amd64.tar.gz -C $HOME
export AC6_TOOLCHAIN_6_20_1=$HOME/ArmCompilerforEmbedded6.20.1/bin
export CMSIS_PACK_ROOT=$HOME/packs
export CMSIS_COMPILER_ROOT=$HOME/cmsis-toolbox-linux-amd64/etc
export PATH=$HOME/cmsis-toolbox-linux-arm64/bin:$PATH
cpackget init https://www.keil.com/pack/index.pidx

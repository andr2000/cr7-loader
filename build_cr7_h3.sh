#!/bin/sh

TOOLCHAIN="gcc-linaro-5.1-2015.08-x86_64_arm-eabi"
TOOLCHAIN_AR="${TOOLCHAIN}.tar.xz"

if [ ! -f ${TOOLCHAIN_AR} ]; then
	echo "Downloading ${TOOLCHAIN_AR}..."
	wget https://releases.linaro.org/components/toolchain/binaries/5.1-2015.08/arm-eabi/${TOOLCHAIN_AR} .
fi

if [ ! -d ${TOOLCHAIN} ]; then
	echo "Unpacking ${TOOLCHAIN_AR}..."
	tar xfJ ${TOOLCHAIN_AR}
fi

export CROSS_COMPILE=./${TOOLCHAIN}/bin/arm-eabi-

make RCAR_DRAM_SPLIT=0 RCAR_KICK_MAIN_CPU=2 LSI=H3 RCAR_SECURE_BOOT=0 clean
make RCAR_DRAM_SPLIT=0 RCAR_KICK_MAIN_CPU=2 LSI=H3 RCAR_SECURE_BOOT=0

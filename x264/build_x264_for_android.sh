#!/bin/bash
NDK=~/soft/android-ndk-r14b
#5.0
PLATFORM=$NDK/platforms/android-21/arch-arm
TOOLCHAIN=$NDK/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64

function build_one {
     echo "开始编译x264"
	./configure \
    --prefix=$PREFIX \
	--enable-static \
	--enable-shared \
	--enable-pic \
	--disable-asm \
	--enable-strip \
	--host=arm-linux-androideabi \
	--cross-prefix=$TOOLCHAIN/bin/arm-linux-androideabi- \
	--sysroot=$PLATFORM \
	--extra-cflags="-Os -fpic $ADDI_CFLAGS" \
	--extra-ldflags="$ADDI_LDFLAGS" \
	$ADDITIONAL_CONFIGURE_FLAG
	make clean
	make -j4
	make install
    echo "编译结束！"
}
CPU=armv7-a
PREFIX=$(pwd)/android/$CPU
ADDI_CFLAGS=""
build_one


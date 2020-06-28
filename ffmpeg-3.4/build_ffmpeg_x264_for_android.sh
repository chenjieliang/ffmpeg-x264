#!/bin/bash
echo "进入编译ffmpeg脚本"
NDK=~/soft/android-ndk-r14b
#5.0
PLATFORM=$NDK/platforms/android-21/arch-arm
TOOLCHAIN=$NDK/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64
CPU=armv7-a

PREFIX=./android/$CPU

x264=./../x264/android/$CPU
export PATH=$x264/bin:$PATH
export PATH=$x264/include:$PATH 
export PATH=$x264/lib:$PATH 
export PKG_CONFIG_PATH=$x264/lib/pkgconfig:$PKG_CONFIG_PATH

function buildFF
{
	echo "开始编译ffmpeg-x264"
    ./configure \
    --prefix=$PREFIX \
    --target-os=android \
    --cross-prefix=$TOOLCHAIN/bin/arm-linux-androideabi- \
    --arch=arm \
    --cpu=$CPU  \
    --sysroot=$PLATFORM \
    --extra-cflags="$CFLAG" \
    --extra-ldflags="$LDFLAGS" \
    --cc=$TOOLCHAIN/bin/arm-linux-androideabi-gcc \
    --nm=$TOOLCHAIN/bin/arm-linux-androideabi-nm \
    --enable-shared \
    --enable-runtime-cpudetect \
    --enable-gpl \
    --enable-small \
    --enable-cross-compile \
    --enable-asm \
    --enable-gpl \
    --enable-libx264 \
    --enable-decoder=h264 \
    --enable-encoder=libx264 \
    --enable-encoder=aac \
    --enable-decoder=aac \
    --disable-debug \
    --disable-static \
    --disable-doc \
    --disable-ffmpeg \
    --disable-ffplay \
    --disable-ffprobe \
    --disable-postproc \
    --disable-avdevice \
    --disable-symver \
    --disable-stripping 
    $ADD 
    make clean
    make -j8
    make install
	echo "编译结束！"
}

###########################################################
echo "编译支持neon和硬解码"
CPU=armv7-a
PREFIX=./android/armv7-a-neon-hard-x264

CFLAG="-I./../x264/android/armv7-a/include -fPIC -DANDROID -mfpu=neon -marm -march=$CPU -mfloat-abi=softfp "
# 增加x264头文件
ADDITIONAL_CFLAG="-I./../x264/android/armv7-a/include"
# x264so库
LDFLAGS="-L./../x264/android/armv7-a/lib -marm"
ADD="--enable-neon \
    --enable-jni \
    --enable-mediacodec \
    --enable-decoder=h264_mediacodec \
    --enable-hwaccel=h264_mediacodec "
buildFF



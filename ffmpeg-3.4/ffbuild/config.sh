# Automatically generated by configure - do not modify!
shared=yes
build_suffix=
prefix=./android/armv7-a-neon-hard-x264
libdir=${prefix}/lib
incdir=${prefix}/include
rpath=
source_path=.
LIBPREF=lib
LIBSUF=.a

extralibs_avutil=" -lm"
extralibs_avcodec="-lx264 -lm  -lz -pthread -pthread "
extralibs_avformat="-lx264 -lm  -lz -pthread -pthread "
extralibs_avdevice="-lx264 -lm  -lz -pthread -pthread "
extralibs_avfilter="-lx264 -lm  -lz -pthread -pthread "
extralibs_avresample="-lm"
extralibs_postproc=""
extralibs_swscale="-lm"
extralibs_swresample="-lm "
avcodec_deps="swresample avutil"
avdevice_deps="avformat avcodec swresample avutil"
avfilter_deps="swscale avformat avcodec swresample avutil"
avformat_deps="avcodec swresample avutil"
avresample_deps="avutil"
avutil_deps=""
postproc_deps="avutil"
swresample_deps="avutil"
swscale_deps="avutil"

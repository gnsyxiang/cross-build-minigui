# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    Makefile.am
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    05/03 2021 10:38
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        05/03 2021      create the file
# 
#     last modified: 05/03 2021 10:38
# ===============================================================

INCLUDE_COM = \
			  -I$(top_srcdir)/include

CFLAGS_COM = \
			 -Wno-error=implicit-fallthrough= \
			 -Wno-error=sign-compare \
			 $(AM_CFLAGS_COM) \
			 $(INCLUDE_COM)

if COMPILE_WITH_CROSS_BUILD
CFLAGS_COM += \
			 -Dhi3536dv100 \
			 -DHICHIP=0x3536d100 \
			 -DHI_RELEASE \
			 -DHI_XXXX \
			 -DAI_DEV=0 \
			 -DAO_DEV=0 \
			 -DHI_ACODEC_TYPE_INNER \
			 -DHI_ACODEC_TYPE_HDMI  \
			 -Wno-error=sign-compare
endif

LDADD_COM =

if COMPILE_WITH_THS_MODE
LDADD_COM += -lminigui_ths \
			 -lharfbuzz \
			 -lrt
else
LDADD_COM += -lminigui_procs \
			 -lharfbuzz \
			 -lrt
endif

LDADD_COM += \
			-ljpeg -lpng \
			-lz -lm -ldl -lpthread \
			$(top_builddir)/src/lib@project_name@.la

if COMPILE_WITH_CROSS_BUILD
LDADD_COM += \
			-lminigui_ths -lfreetype -ljpeg -lpng \
/home/uos/data/office/meian/hi3536d/Hi3536D-V100R001C01SPC020/src-Hi3536DV100_SDK_V1.0.2.0/mpp/lib/libmpi.a \
/home/uos/data/office/meian/hi3536d/Hi3536D-V100R001C01SPC020/src-Hi3536DV100_SDK_V1.0.2.0/mpp/lib/libhdmi.a \
/home/uos/data/office/meian/hi3536d/Hi3536D-V100R001C01SPC020/src-Hi3536DV100_SDK_V1.0.2.0/mpp/lib/libtde.a \
/home/uos/data/office/meian/hi3536d/Hi3536D-V100R001C01SPC020/src-Hi3536DV100_SDK_V1.0.2.0/mpp/lib/libVoiceEngine.a \
/home/uos/data/office/meian/hi3536d/Hi3536D-V100R001C01SPC020/src-Hi3536DV100_SDK_V1.0.2.0/mpp/lib/libupvqe.a \
/home/uos/data/office/meian/hi3536d/Hi3536D-V100R001C01SPC020/src-Hi3536DV100_SDK_V1.0.2.0/mpp/lib/libdnvqe.a \
/home/uos/data/office/meian/hi3536d/Hi3536D-V100R001C01SPC020/src-Hi3536DV100_SDK_V1.0.2.0/mpp/lib/libjpeg.a \
-lz -lm -ldl -lpthread \
			$(top_builddir)/src/lib@project_name@.la
endif

LDFLAGS_COM = \
			  -Wl,--gc-sections

bin_PROGRAMS 	=


if COMPILE_WITH_THS_MODE
else
bin_PROGRAMS		+= mginit
mginit_SOURCES 	= mginit.c
mginit_CFLAGS  	= $(CFLAGS_COM)
mginit_LDADD   	= $(LDADD_COM)
mginit_LDFLAGS	= $(LDFLAGS_COM)
endif

bin_PROGRAMS		+= helloworld
helloworld_SOURCES 	= helloworld.c
helloworld_CFLAGS  	= $(CFLAGS_COM)
helloworld_LDADD   	= $(LDADD_COM)
helloworld_LDFLAGS	= $(LDFLAGS_COM)

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

LDADD_COM = \
			-lminigui_ths -lfreetype -ljpeg -lpng -lz -lm -lpthread \
			$(top_builddir)/src/lib@project_name@.la

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

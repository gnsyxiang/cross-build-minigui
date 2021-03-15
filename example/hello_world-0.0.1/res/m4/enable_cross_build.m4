dnl ===============================================================
dnl 
dnl Release under GPLv-3.0.
dnl 
dnl @file    enable_cross_build.m4
dnl @brief   
dnl @author  gnsyxiang <gnsyxiang@163.com>
dnl @date    15/03 2021 15:12
dnl @version v0.0.1
dnl 
dnl @since    note
dnl @note     note
dnl 
dnl     change log:
dnl     NO.     Author              Date            Modified
dnl     00      zhenquan.qiu        15/03 2021      create the file
dnl 
dnl     last modified: 15/03 2021 15:12
dnl ===============================================================

m4_define(
        [ENABLE_CROSS_BUILD],
        [
            AC_ARG_ENABLE(
                [cross-build],
                [AS_HELP_STRING([--enable-cross-build], [enable cross build] [[default=no]])],
                [AC_DEFINE(HAVE_CROSS_BUILD, 1, [enable cross build])])
            AM_CONDITIONAL([COMPILE_WITH_CROSS_BUILD], [test "x$enable_cross_build" = "xyes"])
        ])

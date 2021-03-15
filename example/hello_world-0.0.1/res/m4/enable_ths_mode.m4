dnl ===============================================================
dnl 
dnl Release under GPLv-3.0.
dnl 
dnl @file    enable_ths_mode.m4
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
        [ENABLE_THS_MODE],
        [
            AC_ARG_ENABLE(
                [ths_mode],
                [AS_HELP_STRING([--enable-ths-mode], [enable ths mode] [[default=no]])],
                [AC_DEFINE(HAVE_THS_MODE, 1, [enable ths mode])])
            AM_CONDITIONAL([COMPILE_WITH_THS_MODE], [test "x$enable_ths_mode" = "xyes"])
        ])

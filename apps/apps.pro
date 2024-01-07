TEMPLATE = subdirs
SUBDIRS+=\
        Home \
        Setting \
        Phone

CONFIG += ordered
Home.depends = ../libs UICommon MiddlewareLayer
Setting.depends = ../libs UICommon MiddlewareLayer
Phone.depends = ../libs UICommon MiddlewareLayer


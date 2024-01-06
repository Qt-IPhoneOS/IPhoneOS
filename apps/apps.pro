TEMPLATE = subdirs
SUBDIRS+=\
        HOME \
        Setting \
        Phone

CONFIG += ordered
Setting.depends = ../libs UICommon
Phone.depends = ../libs UICommon


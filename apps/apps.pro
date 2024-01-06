TEMPLATE = subdirs
SUBDIRS+=\
        Home \
        Setting \
        Phone

CONFIG += ordered
Home.depends = ../libs UICommon
Setting.depends = ../libs UICommon
Phone.depends = ../libs UICommon


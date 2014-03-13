ARCHS = armv7 armv7s arm64

TARGET = iphone:clang:latest:7.0

THEOS_BUILD_DIR = Packages

include theos/makefiles/common.mk

TOOL_NAME = networkstatus
networkstatus_CFLAGS = -fobjc-arc
networkstatus_FILES = main.m
networkstatus_FRAMEWORKS = Foundation
networkstatus_PRIVATE_FRAMEWORKS = SoftwareUpdateServices

include $(THEOS_MAKE_PATH)/tool.mk

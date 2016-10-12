LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

include $(CLEAR_VARS)
LOCAL_MODULE       := cpboot-daemon
LOCAL_MODULE_TAGS  := optional eng
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_SRC_FILES    := etc/sbin/cbd
LOCAL_MODULE_PATH  := $(TARGET_ROOT_OUT)/sbin
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := init.target.rc
LOCAL_MODULE_TAGS  := optional eng
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := etc/init.target.rc
LOCAL_MODULE_PATH  := $(TARGET_ROOT_OUT)
include $(BUILD_PREBUILT)


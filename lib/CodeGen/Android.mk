#
# Copyright (C) 2011 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
#

LOCAL_PATH := $(call my-dir)
include $(LOCAL_PATH)/../../libbcc-config.mk

ifeq ($(libbcc_USE_OLD_JIT),1)

#=====================================================================
# Common: libbccCodeGen
#=====================================================================

libbcc_codegen_SRC_FILES := \
  CodeEmitter.cpp \
  CodeMemoryManager.cpp


#=====================================================================
# Device Static Library: libbccCodeGen
#=====================================================================

include $(CLEAR_VARS)

LOCAL_MODULE := libbccCodeGen
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := STATIC_LIBRARIES
LOCAL_CFLAGS += $(libbcc_CFLAGS)
LOCAL_C_INCLUDES += $(libbcc_C_INCLUDES)
LOCAL_SRC_FILES := $(libbcc_codegen_SRC_FILES)

include $(LIBBCC_ROOT_PATH)/libbcc-gen-config-from-mk.mk
include $(LIBBCC_ROOT_PATH)/libbcc-build-rules.mk
include $(LLVM_ROOT_PATH)/llvm-device-build.mk
include $(BUILD_STATIC_LIBRARY)


#=====================================================================
# Host Static Library: libbccCodeGen
#=====================================================================

include $(CLEAR_VARS)

LOCAL_MODULE := libbccCodeGen
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := STATIC_LIBRARIES
LOCAL_IS_HOST_MODULE := true

LOCAL_CFLAGS += $(libbcc_CFLAGS)
LOCAL_C_INCLUDES += $(libbcc_C_INCLUDES)

LOCAL_SRC_FILES := $(libbcc_codegen_SRC_FILES)

include $(LIBBCC_ROOT_PATH)/libbcc-gen-config-from-mk.mk
include $(LIBBCC_ROOT_PATH)/libbcc-build-rules.mk
include $(LLVM_ROOT_PATH)/llvm-host-build.mk
include $(BUILD_HOST_STATIC_LIBRARY)

endif # $(libbcc_USE_OLD_JIT)

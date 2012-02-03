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


#=====================================================================
# Architecture Selection
#=====================================================================

ifeq ($(LOCAL_IS_HOST_MODULE),) # Target Build

  # Note: We should only use -DFORCE_ARCH_CODEGEN on target build.
  # For the host build, we will include as many architecture as possible,
  # so that we can test the execution engine easily.

  ifeq ($(TARGET_ARCH),arm)
    LOCAL_CFLAGS += -DFORCE_ARM_CODEGEN
    ifeq ($(ARCH_ARM_HAVE_VFP),true)
      LOCAL_CFLAGS += -DARCH_ARM_HAVE_VFP
      ifeq ($(ARCH_ARM_HAVE_VFP_D32),true)
        LOCAL_CFLAGS += -DARCH_ARM_HAVE_VFP_D32
      endif
    endif
    ifeq ($(ARCH_ARM_HAVE_NEON),true)
      LOCAL_CFLAGS += -DARCH_ARM_HAVE_NEON
    endif
  else
    ifeq ($(TARGET_ARCH),x86)
      LOCAL_CFLAGS += -DFORCE_X86_CODEGEN
    else
      $(error Unsupported architecture $(TARGET_ARCH))
    endif
  endif

endif

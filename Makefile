TOPDIR=$(PWD)/buildroot

export CROSS_COMPILE=$(PWD)/toolchain/gcc/linux-x86/arm/gcc-arm-10.3-2021.07-x86_64-arm-none-linux-gnueabihf/bin/arm-none-linux-gnueabihf-
export CC = $(CROSS_COMPILE)gcc
export LD = $(CROSS_COMPILE)ld
export AR = $(CROSS_COMPILE)ar 

export INSTALL = install
export KERNEL_ARCH = arm

export TARGET_KERNEL_CROSS = $(CROSS_COMPILE)
export LINUX_DIR = $(HOME)/prj/prebuilt/linux-amlogic-5.15-dev
export STAGING_DIR = $(HOME)/prj/prebuilt/host/arm-linux-gnueabihf/sysroot
export TARGET_CONFIGURE_OPTS = sysroot=$(STAGING_DIR) 
export TARGET_CFLAGS = --sysroot=$(STAGING_DIR)

MBP_DIR 		= $(PWD)/vendor/amlogic/ipc/mbp
MBI_DIR 	 	= $(MBP_DIR)/mbi
MBD_DIR 	 	= $(MBP_DIR)/mbi
SAMPLE_DIR  	= $(MBP_DIR)/sample

LINUX_OSAL_DIR 	= $(MBP_DIR)/osal/linux
PMZ_DIR 		= $(MBP_DIR)/pmz
MBD_DIR 		= $(MBP_DIR)/mbd
MBD_BASE_DIR 	= $(MBD_DIR)/base
MBD_CVE_DIR 	= $(MBD_DIR)/cve
MBD_GE2D_DIR 	= $(MBD_DIR)/ge2d
MBD_AUDIO_DIR 	= $(MBD_DIR)/audio
MBD_REGION_DIR 	= $(MBD_DIR)/region
MBD_VENC_DIR 	= $(MBD_DIR)/venc
MBD_VPU_DIR 	= $(MBD_DIR)/vpu
MBD_ADLA_DIR 	= $(MBD_DIR)/adla
MBD_DEWARP_DIR 	= $(MBD_DIR)/dewarp
MBD_CAMERA_DIR 	= $(MBD_DIR)/camera
MBD_PPU_DIR 	= $(MBD_DIR)/ppu
TOOL_DIR 		= $(MBP_DIR)/tool
TOOL_DIR 		= $(MBP_DIR)/tool
SENSOR_DIR 		= $(MBP_DIR)/sensor
EXT_INC   	 	= $(PWD)/

.PHONY: _all $(MAKECMDGOALS)

include buildroot/package/amlogic/ipc/mbp/*.mk

BUILD_CMD = $(shell echo $(MAKECMDGOALS) |tr '[a-z]' '[A-Z]'|tr '-' '_')
TARGET=$($(BUILD_CMD)_SITE)/build

$(info $(TARGET))
$(info $(BUILD_CMD))
$(MAKECMDGOALS): $(TARGET)

$(TARGET):
	$($(BUILD_CMD)_BUILD_CMDS)
	$($(BUILD_CMD)_INSTALL_STAGING_CMDS)


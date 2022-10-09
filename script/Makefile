TARGET_DIR = $(PWD)/../../../../

MBD_TARGET =  adla
MBD_TARGET += cve
MBD_TARGET += dewarp
MBD_TARGET += ge2d
MBD_TARGET += npu
MBD_TARGET += ppu
MBD_TARGET += region
MBD_TARGET += venc
MBD_TARGET += vpu
MBD_TARGET += camera 

$(MAKECMDGOALS):
	@cd  $(TARGET_DIR) && make $(MAKECMDGOALS)

mbd: $(MBD_TARGET)

	cd  $(TARGET_DIR) && make linux-osal
	cd  $(TARGET_DIR) && make base
	cd  $(TARGET_DIR) && make pmz
	cd  $(TARGET_DIR) && for f in $^; do $(MAKE) mbd-$$f; done

sample:
	cd  $(TARGET_DIR) && $(MAKE) mbi
	cd  $(TARGET_DIR) && $(MAKE) $@
	adb push sample/pipeline_demo/pipeline_demo /
	adb push sample/venc/sample_venc /
	adb push sample/venc/cli/venc_cli /

mbd-venc:
	cd  $(TARGET_DIR) && $(MAKE) $@
	find mbd/venc -name '*.ko'|xargs -i adb push {} /

mbd-venc-clean:
	@find mbd/venc -name '*.ko'|xargs -i rm {}
	@find mbd/venc -name '*.o'|xargs -i rm {}

.PHONY: $(MAKECMDGOALS) $(MBD_TARGET)

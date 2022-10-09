~/tools/toolchain/host/bin/arm-buildroot-linux-uclibcgnueabihf-gdb --eval-command="target remote ${BOARD_IP}:2345" --eval-command='set print pretty on' --eval-command='set max-value-size unlimited'

#!/bin/sh

PATH=$PATH:/home/david/Working/Android/Dell_Build/2.2_qcom_almond_new/out/host/linux-x86/bin/
FLASHED="false"
fastboot=$HOME/bin/android-sdk-linux_86/tools/fastboot


case $1 in
e)
	erase_data_cache;;
R)
	reboot;;
a)
  	flash_recovery; flash_boot; flash_data; flash_system; FLASHED="true";;
r)
  	flash_recovery; FLASHED="true";;
s)
  	flash_system; FLASHED="true";;
b)
  	flash_boot; FLASHED="true";;
*)
	echo $"Usage: use options: {R|a|r|b|s|e}";;
esac

[ "$FLASHED" == "true" ] && reboot_device

#FLASH FUNCTIONS
function flash_recovery {
	[ -e recovery.img ] && ($fastboot -i 0x413c erase recovery; $fastboot -i 0x413c flash recovery recovery.img)
}

function flash_boot {
	[ -e boot.img ] && ($fastboot -i 0x413c erase boot; $fastboot -i 0x413c flash boot boot.img)
}

function flash_system {
	[ -e system.img ] && ($fastboot -i 0x413c erase system; $fastboot -i 0x413c flash system system.img)
}

function flash_data { 
	[ -e userdata.img ] && ($fastboot -i 0x413c erase userdata; $fastboot -i 0x413c flash userdata userdata.img)
}

#MISC FUNCTIONS
function erase_data_cache {
	$fastboot -i 0x413c -w
}

function reboot_device {
	$fastboot -i 0x413c reboot
}

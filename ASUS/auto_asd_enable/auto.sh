#!/bin/bash
#auto BTFW ASD feature
echo "This script enable ASD for BTFM \n"
echo "====================START====================\n"
beforeFW=/home/george_chiu/ASUS/share/auto_asd_enable/before/BTFM.bin
afterFW=/home/george_chiu/ASUS/share/auto_asd_enable/after/BTFM.bin
asdenableFW=/home/george_chiu/ASUS/project/ZF7/AQ-mr0-8250-bsp/APQ_BTR/sm8250_btfm/btfm_proc/bt/build/ms/bin/QCA6690/default/asd/htnv20.bin
echo "The original BTFM is: \n ${beforeFW}\n"
cp ${beforeFW} .
echo "The asd enable BTFM is:\n ${asdenableFW}\n"

mkdir BTFM
sudo mount -t vfat -o loop BTFM.bin BTFM

#cp asd enable btnv.bin
#把 BTFM.bin 裡面的東西放到 BTFM 資料夾
sudo cp ${asdenableFW} /home/george_chiu/ASUS/project/auto_asd_enable/BTFM/image

#修改內容後再包成 BTFM.bin
sudo umount BTFM

echo "The modified BTFM is:\n ${afterFW}\n"
echo "====================DONE===================="
cp BTFM.bin ${afterFW}

rm -rf BTFM*

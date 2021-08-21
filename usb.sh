
#!/bin/bash
 
usbdisk="/mnt/usb1"
usbdisk1="/mnt/usb1"
usbdisk2="/mnt/usb2"
USB_A_PATH="/sys/devices/platform/sunxi-ehci.2/usb2/"
USB_B_PATH="/sys/devices/platform/sunxi-ehci.3/usb3/"
 
echo sadasdsad > /uussbb
 
if [ "$1" == "add" ]; then
        ID_FS_TYPE=$(blkid -sTYPE -ovalue /dev/$2)
 
		USB_A_FILE=`find  "$USB_A_PATH"  -name "$2"`
		USB_B_FILE=`find  "$USB_B_PATH"  -name "$2"`
		if [ ${#USB_A_FILE} -gt 0 ];then
				usbdisk=$usbdisk1
		elif [ ${#USB_B_FILE} -gt 0 ]; then
				usbdisk=$usbdisk2
		fi
		
        case $ID_FS_TYPE in
                vfat)
						mkdir -p $usbdisk
						mount -t vfat -o noatime,umask=0,iocharset=utf8 /dev/$2 $usbdisk
                        sync
                        ;;
        #        ext[2-4])
        #                mount -o noatime /dev/$2 $usbdisk >/dev/null 2>&1
        #                sync
        #                ;;
        #        exfat)
        #                mount -t exfat -o noatime,umask=0,iocharset=utf8 /dev/$2 $usbdisk2 > /dev/null 2>&1
        #                sync
        #                ;;
                ntfs)
                        echo sadasdsad > /uuntfs
						mkdir -p $usbdisk
						mount -t ntfs-3g -o noatime,umask=0,iocharset=utf8 /dev/$2 $usbdisk > /dev/null 2>&1
                        sync
                        ;;
                *)
                        exit 0
                        ;;
        esac
elif [ "$1" == "remove" ]; then
        sync
		if [ ! -d $USB_A_PATH"2-1" ];then
		echo $USB_A_PATH"2-1" > aqq;
				umount -f $usbdisk1
				rm -rf $usbdisk1
		fi
		
		if [ ! -d $USB_B_PATH"3-1" ];then
		echo $USB_B_PATH"3-1" > bqq;
				umount -f $usbdisk2
				rm -rf $usbdisk2
		fi        
fi
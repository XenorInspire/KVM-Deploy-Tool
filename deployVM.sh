# This script is used to quickly deploy a Virtual Machine in KVM
# Created by XenorInspire

# Check is default is started with (in root user) :
# virsh net-autostart --network default
# virsh net-start --network default

# Check the OS of you VM with : osinfo-query os

#!/bin/bash

maxCores=( `nproc --all` )
maxRAM=(`vmstat -s | head -1`)

echo "Name of the iso file :"
echo "It must be in the same folder of the script"
read nameISO

echo "RAM in MB (Max : $((maxRAM / 1024)) MB) :"
read ram

echo "Core(s) (Max $maxCores) :"
read cores

echo "Name of the VM :"
read nameVM

echo "Disk size (in GB)"
read sizeDisk

PS3="Which type of virtual disk you want to use ? "
select rep in raw vmdk qcow2
	do
	if [ "$rep" = "raw" ]
	then

        formatVHD="raw"
        break

	fi
	if [ "$rep" = "vmdk" ]
	then

        formatVHD="vmdk"
        break

	fi
	if [ "$rep" = "qcow2" ]
	then

        formatVHD=qcow27
        break

	fi

done

path="../VirtualMachine_$nameVM"
mkdir $path

virt-install --name=$nameVM --vcpus=$cores --memory=$ram --cdrom=$nameISO --disk size=$sizeDisk,path=$path/$nameVM-disk.img,format=$formatVHD --os-type=Linux --os-variant=centos8

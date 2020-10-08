# This script is used to quickly deploy a Virtual Machine in KVM
# Created by XenorInspire

# Check if default network interface is started with (in root user) :
# virsh net-autostart --network default
# virsh net-start --network default

# Check the OS of you VM with : osinfo-query os
# Replace line 35 (os variant)

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

path="../VirtualMachine_$nameVM"
mkdir $path

virt-install --name=$nameVM --vcpus=$cores --memory=$ram --cdrom=$nameISO --disk size=$sizeDisk,path=$path/$nameVM-disk.img,format=raw --os-type=Linux --os-variant=centos8
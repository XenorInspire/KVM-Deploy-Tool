# KVM-Deploy-Tool

Script to quickly install a virtual machine with KVM hypervisor

## Requirements

Install these packages first :
`qemu-kvm libvirt-clients libvirt-daemon-system bridge-utils libguestfs-tools genisoimage virtinst libosinfo-bin virt-manager`

## Installation

In a directory of your choice copy the repo :  
`git clone https://github.com/XenorInspire/KVM-Deploy-Tool.git`  

Move in the directory :  
`cd KVM-Deploy-Tool/`

Make sure that the script has the right to be executed :  
`chmod +x deployVM.sh`

Execute the script where it was copied with higher privileges :  
`sudo ./deployVM.sh`

#!/bin/sh

set -xe

qemu-img create -f qcow2 "$2" 4G

qemu-system-x86_64 -enable-kvm -vga std \
                   -m 2048 -smp 2 -cpu host \
                   -net nic \
		   -net user,hostfwd=tcp::4444-:5555 \
                   -cdrom "$1" \
                   -hda "$2" \
                   -boot d \
                   -monitor stdio

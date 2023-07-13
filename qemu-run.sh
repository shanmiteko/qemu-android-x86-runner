#!/bin/sh

set -xe

HDA_IMAGE="$1"

shift

qemu-system-x86_64 -enable-kvm -vga std \
                   -m 2048 -smp 2 -cpu host \
		   -net nic \
		   -net user,hostfwd=tcp::4444-:5555 \
                   -hda "$HDA_IMAGE" \
                   -monitor stdio \
                   "$@"


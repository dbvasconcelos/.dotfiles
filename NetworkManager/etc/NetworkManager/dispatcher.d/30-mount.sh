#!/bin/sh
# Mount shares per connection.

event="$2"

if [ "$CONNECTION_ID" = "tun0" ]; then
    mntroot="/mnt/UNISIM"

    case "$event" in
    "up")
        smbserver="//hpe01.unisim.cepetro.unicamp.br"
        nfsserver="fls.unisim.cepetro.unicamp.br"
        smbopts="uid=derek,gid=derek,credentials=/home/derek/.config/UNISIM/credentials"
        mount -t cifs -m -o "$smbopts" "$smbserver/scratch/derek" "$mntroot/scratch"
        mount -t nfs -m "$nfsserver:/mnt/data/home/UNISIM/derek" "$mntroot/home"
        mount -t nfs -m "$nfsserver:/mnt/data/TEC" "$mntroot/tec"
        mount -t nfs -m "$nfsserver:/mnt/data/transfer" "$mntroot/transfer"
        ;;
    "down" | "pre-down" | "vpn-pre-down")
        umount -f /mnt/UNISIM/* >/tmp/umount.txt 2>&1
        ;;
    esac
fi

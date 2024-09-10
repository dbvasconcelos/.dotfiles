#!/bin/sh
# Mount shares per connection.

event="$2"

if [ "$CONNECTION_ID" = "tun0" ]; then
    mnt_parent="/mnt/UNISIM"
    case "$event" in
    "up")
        smb_srv="//ls2.unisim.cepetro.unicamp.br/scratch/derek"
        smb_opts="uid=derek,credentials=/home/derek/.config/UNISIM/credentials"
        mount -t cifs -m -o "$smb_opts" "$smb_srv" "$mnt_parent/scratch"

        nfs_srv="fls.unisim.cepetro.unicamp.br:/mnt/data"
        mount -t nfs -m "$nfs_srv/home/UNISIM/derek" "$mnt_parent/home"
        mount -t nfs -m "$nfs_srv/TEC" "$mnt_parent/tec"
        mount -t nfs -m "$nfs_srv/transfer" "$mnt_parent/transfer"
        ;;
    "down" | "pre-down" | "vpn-pre-down")
        umount -f "$mnt_parent"/* | true
        ;;
    esac
fi

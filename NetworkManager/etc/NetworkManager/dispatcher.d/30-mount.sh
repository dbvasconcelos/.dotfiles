#!/bin/sh
# Mount shares per connection.

event="$2"

if [ "$CONNECTION_ID" = "tun0" ]; then
    mnt="/mnt/UNISIM"
    case "$event" in
    "up")
        smb_srv="//ls2.unisim.cepetro.unicamp.br/scratch/$USER"
        smb_opts="uid=$USER,credentials=$XDG_CONFIG_HOME/UNISIM/credentials"
        mount -t cifs -m -o "$smb_opts" "$smb_srv" "$mnt/scratch"

        nfs_srv="fls.unisim.cepetro.unicamp.br:/mnt/data"
        mount -t nfs -m "$nfs_srv/home/UNISIM/derek" "$mnt/home"
        mount -t nfs -m "$nfs_srv/TEC" "$mnt/tec"
        mount -t nfs -m "$nfs_srv/transfer" "$mnt/transfer"
        ;;
    "down" | "pre-down" | "vpn-pre-down")
        umount -f "$mnt"/* | true
        ;;
    esac
fi

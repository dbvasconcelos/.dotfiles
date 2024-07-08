#!/bin/sh
# Mount shares per connection.

event="$2"
# Find the connection UUID with "nmcli connection show" in terminal.
UNISIM_VPN="fda9230c-91c3-4f3a-a141-eada36a52f5e"

if [ "$CONNECTION_UUID" = "$UNISIM_VPN" ]; then
    mnt_parent="/mnt/UNISIM"
    case "$event" in
    "up")
        smb_share="//hpe01.unisim.cepetro.unicamp.br/scratch/derek"
        smb_opts="uid=derek,gid=derek,credentials=/home/derek/.config/unisim/credentials"

        nfs_share="fls.unisim.cepetro.unicamp.br:/mnt/data"
        home_share="$nfs_share/home/UNISIM/derek"
        tec_share="$nfs_share/TEC"
        transfer_share="$nfs_share/transfer"

        mnt_home="$mnt_parent/home"
        mnt_transfer="$mnt_parent/transfer"
        mnt_tec="$mnt_parent/TEC"
        mnt_scratch="$mnt_parent/scratch"

        mount -t cifs -m -o "$smb_opts" "$smb_share" "$mnt_scratch"
        mount -t nfs -m "$home_share" "$mnt_home"
        mount -t nfs -m "$tec_share" "$mnt_tec"
        mount -t nfs -m "$transfer_share" "$mnt_transfer"
        ;;
    "down" | "pre-down" | "vpn-pre-down")
        umount -f "$mnt_home"/*
        ;;
    esac
fi

    vim: se fdl=2:

    $misc/CP/rclone.md

# rclone.conf - Arch
    cp $Enc/Secure1/rclone.conf ~/.config/rclone/rclone.conf
    s ~/.config/rclone/rclone.conf  # should report 600, to protect  pass

# rclone.conf - Windows
    cpi $Enc/Secure1/rclone.conf $Env:AppData\rclone\rclone.conf

# Zourit
- can't recall where I got the `pass` from
- creation/tidying of the local sync: `$TeNo/md-JH-DailyLife/roles/Cafezoide/online/cc.md`
- WebDAV <https://cloud6.zourit.net/remote.php/dav/files/0db3dcd2-559e-103c-85dd-b3e96c5fa175/>

## commands
    find $CzMa/online/ZNc/ZNc | wc -l
    rclone sync -P ZCzNc: $CzMa/online/ZNc/ZNc  # bring my local copy up-to-date
    rclone lsd ZCzNc:  # quick list of top-level directories


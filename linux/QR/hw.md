vim: nospell:

    lsusb
    solaar show
    sudo chmod 777 /run/media/jo/TOSHIBA
    uname -m  # machine hardare name
    xbacklight -set 50
    xev | awk -F'[ )]+' '/^KeyPress/ { a[NR+2] } NR in a { printf "%-3s %s\n", $5, $8 }'  # scancodes

# battery
    acpi -h
    batstat

# CPU
    cpupower frequency-info
    sudo cpupower frequency-set -u 3400Mhz
    sudo turbostat --interval 0.1 --num_iterations 1
    sudo turbostat --interval 2 --quiet

# graphics
    xrandr  # xrandr -q

## query the card specs
    echo $(xrandr -q | grep '*' | uniq | awk '{print $1}' | cut -d 'x' -f1) $(xrandr -q | grep '*' | uniq | awk '{print $1}' | cut -d 'x' -f2)  # screen size
    GPU=$(lspci | grep VGA | cut -d ":" -f3);RAM=$(cardid=$(lspci | grep VGA |cut -d " " -f1);lspci -v -s $cardid | grep " prefetchable"| cut -d "=" -f2);echo $GPU $RAM
    lspci | grep -e VGA -e 3D  # gets just the graphics card name

# printing - CUPS
    lpadmin
    lpq  # show printer queue status
    lpstat -p -d  # show status of printers, including which is set as default
    lpstat -s  # status, including URL
    sudo systemctl status cups.service

Command-Line Printing and Options  http://localhost:631/help/options.html

## cancel print jobs
    cancel -a
    lprm

## lp
    lp -n num-copies <image>
    lp -o scaling=200 <image>  # prints divided across 4 pages

can't center image on page

### prints all images in a directory
    lp *
    lp *.JPG
    lp *.png -o ColorModel=KGray  # black cartridge only

### orientation
automatically selects the best orientation for filling the page

#### specify
    -o orientation-requested=3 - portrait orientation (no rotation)
    -o orientation-requested=4 - landscape orientation (90 degrees)
    -o orientation-requested=5 - reverse landscape or seascape orientation (270 degrees)
    -o orientation-requested=6 - reverse portrait or upside-down orientation (180 degrees)

# printing - HPLIP
    hp-info
    hp-levels  # takes a little while to show the ink levels (after "Using device : ...")
    hp-printsettings  # dialog pop-up
    hp-setup -h
    hp-setup -r  # GUI to remove printer
    hp-systray & disown  # HPLIP Status Service tray icon (double-click to get HP Device Manager)
    hp-testpage
    hp-toolbox &  # HP Device Manager

# storage
    umount /dev/sdxx
    umount /mountpoint

## mount
    mount | grep /dev/sd

mount(8)

## non-optical
    df -h [<disk>]
    du -sh <bigDirectory>
    lsblk -f

lsblk(8)

### FAT
    sudo fatlabel /dev/sdi1 [<newLabel>]
    sudo mkfs.vfat -n 'label' -I /dev/sdxn

### fsck
- e2fsck(8): `sudo e2fsck -pv /dev/sdx1`
- `fsck` manages `lost+found` directory

### partitions
    sudo mkfs.ext4 -L <label> /dev/sdxx

gdisk(8)

#### parted
    mklabel <label>  # destroys existing partitions
    sudo parted <device>

can't set the volume-name
parted(8)

##### --list  all devices
    sudo parted -l | grep dev -B 1
    sudo parted -l | grep sdl -B 1 -A 6

##### CL-mode
    -s => don't ask
    sudo parted -l

## optical
    cd-drive  # info
    cdrecord dev=/dev/sr0 -checkdrive  # Vendor_info etc
    sudo wipefs [-a] /dev/sdx  # [wipe] signatures

### tray
    eject  # opens tray
    eject -h
    eject -t  # closes tray
    eject -T sr1  # toggles tray of sr1

# webcam
    cameractrls

## V4l-utils
    qv4l2
    v4l2-ctl --list-devices
    v4l2-ctl -d /dev/video0 --list-ctrls
    v4l2-ctl -d /dev/video1 --list-ctrls


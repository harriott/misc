vim: nospell:

    lsusb
    solaar show
    sudo chmod 777 /run/media/jo/TOSHIBA
    sudo chmod 644 $Obc/autostart/urxvtl.sh
    uname -m  # machine hardare name
    xbacklight -set 50

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

# keyboard
    xev | awk -F'[ )]+' '/^KeyPress/ { a[NR+2] } NR in a { printf "%-3s %s\n", $5, $8 }'  # scancodes

## for XF86 symbols
    xmodmap -pke | grep Audio
    xmodmap -pke | grep Brightness

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
    lp -n <number_of_copies> <image>
    lp -o scaling=200 <image>  # prints divided across 4 pages
    lp -o fit-to-page <image>

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

### permissions
    ---------- 	0000  no permissions
    ---x--x--x 	0111  execute
    --w--w--w- 	0222  write
    --wx-wx-wx 	0333  write & execute
    -r--r--r-- 	0444  read
    -r-xr-xr-x 	0555  read & execute
    -rw-rw-rw- 	0666  read & write
    -rwxrwxrwx 	0777  read, write, & execute

### FAT
    sudo fatlabel /dev/sdi1 [<newLabel>]
    sudo mkfs.vfat -n 'label' -I /dev/sdxn

### fsck
`fsck` manages `lost+found` directory

#### e2fsck
    sudo e2fsck -pv /dev/sdx1  # p = automatic, or just hit enter at each question

e2fsck(8)

### lsblk
    lsblk -f

lsblk(8)

### partitions
    sudo mkfs.ext4 -L <label> /dev/sdxx

#### gdisk
    sudo gdisk /dev/sdx
    sudo gdisk -l /dev/sda

gdisk(8)

#### parted
- can't set the volume-name
- GNU Parted User Manual
- parted(8)

##### interactive mode
    sudo parted <device>

`mklabel <label>` destroys existing partitions

##### script mode
    sudo parted -l | grep sdl -B 1 -A 6  # --list
    sudo parted /dev/sda -s mklabel msdos mkpart primary 0% 100%  # also creates an MBR

`-s` (`--script`) never prompts for user intervention

### Trash
    du -hs ~/.local/share/Trash
    rm -rf ~/.local/share/Trash

## optical
    cd-drive  # info
    cdrecord dev=/dev/sr0 -checkdrive  # Vendor_info etc
    cdrecord -v -sao dev=/dev/sr0 linux.iso
    sudo wipefs [-a] /dev/sdx  # [wipe] signatures

### tray
    eject  # opens tray
    eject -h
    eject -t  # closes tray
    eject -T sr1  # toggles tray of sr1

# webcam
    cameractrls
    guvcview

## V4l-utils
    qv4l2 &
    v4l2-ctl --list-devices
    v4l2-ctl -d /dev/video0 --list-ctrls
    v4l2-ctl -d /dev/video1 --list-ctrls


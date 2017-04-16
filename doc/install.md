## Installation

### Downloading and verifying the ISO image

[Download](https://github.com/nodiscc/dbu/releases) the latest release.

### Writing the installation media

#### To USB - From Linux

  * Insert a 2GB+ USB drive
  * Right-click the ISO image file, and click `Open with ... > Disk image writer` (requires `gnome-disk-utility`)
  * Or, using the command line: Identify your USB drive device name (eg. `/dev/sdc`) from your disk utility or using the `lsblk` command; Write the ISO image to the drive using `sudo dd /path/to/your/dbu.iso /dev/sdXXX`.

#### To USB - From Windows

  * Insert a blank 2GB+ USB drive
  * Download [win32diskimager](http://sourceforge.net/projects/win32diskimager/files/latest/download), extract it in a directory, then run the program.
  * `Image file`: select your dbu ISO image.
  * `Device`: Select your USB drive's drive letter.
  * Press `Write`. **Caution, all data on the USB drive will be erased**

#### To DVD

  * Select "burn a disk image" in your disk burning utility (Windows: [InfraRecorder](http://infrarecorder.org/?page_id=5))

------------------------------------------

### Setup

| 💥 |Overwrites your previously installed Operating System! Backup your data to an external drive before continuing! |
|---------|---------|

 * Turn computer off. Insert the installation USB/DVD, turn computer on.
  * Check that the computer BIOS is configured to boot from CD/DVD or USB.
  * On some computers you need to disable [Secure Boot](https://en.wikipedia.org/wiki/Unified_Extensible_Firmware_Interface#Secure_boot) before installing a Linux distribution. See **[Disabling Secure Boot in Windows 8](disable-secure-boot.md)**.
 * In the boot menu, select `Graphical install`
 * Follow the installation procedure

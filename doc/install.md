## Installation

### Downloading the ISO image

[Download](https://github.com/nodiscc/dbu/releases) the latest release via bittorrent.  
Recommended bittorrent clients: [Deluge](http://www.deluge-torrent.org/), [Transmission](https://transmissionbt.com/).

### Verifying the ISO image

This step is optional, but is strongly recommended to ensure downloaded files are valid and authentic.

Download `dbu-release.key`, `SHA512SUMS.sign` and `SHA512SUMS` from the [releases page](https://github.com/nodiscc/dbu/releases), to the same directory as the `iso` file.

 * Import the GPG key: `gpg --import dbu-release.key`
 * Verify the authenticity of the checksums file: `gpg --verify SHA512SUMS.sign`
 * Verify the integrity of the ISO image: `sha512sum -c SHA512SUMS`

The key used to sign releases has the key ID `0028A686E4546CD17579570F99883828CD9019B8`.

### Writing the installation media

#### To USB - From Linux

  * Insert a 2GB+ USB drive
  * Right-click the ISO image file, and click `Open with ... > Disk image writer` (requires `gnome-disk-utility`) **Caution, all data on the USB drive will be erased**
  * Or, using the command line: Identify your USB drive device name (eg. `/dev/sdc`) using the `lsblk` command; Write the ISO image to the drive using `sudo dd /path/to/live-image.iso /dev/sdXXX`.

#### To USB - From Windows

  * Insert a blank 2GB+ USB drive
  * Download [win32diskimager](http://sourceforge.net/projects/win32diskimager/files/latest/download), extract it in a directory, then run the program.
  * `Image file`: select your dbu ISO image.
  * `Device`: Select your USB drive's drive letter.
  * Press `Write`. **Caution, all data on the USB drive will be erased**

#### To DVD

  * Select "burn a disk image" in your disk burning utility (Windows: [InfraRecorder](http://infrarecorder.org/?page_id=5))

------------------------------------------

### Booting your computer from USB/DVD

Turn your computer off. Insert the installation USB/DVD, and turn it back on. The
computer should boot to the main menu where you are given the choice to start the
Live system, or to install it permanently to your hard drive.

| 💥 | If your computer does not boot to the live DVD/USB, Check that the computer BIOS is configured to boot from CD/DVD or USB. |
|---------|---------|

| 💥 | On some computers you need to disable [Secure Boot](https://en.wikipedia.org/wiki/Unified_Extensible_Firmware_Interface#Secure_boot) before installing a Linux distribution. See **[Disabling Secure Boot in Windows 8](disable-secure-boot.md)** |
|---------|---------|


#### Live operating system

The Live system runs entirely in memory and allows you to use the operating system
without installing it to your machine. No changes to the Live filesystem are kept,
(eg. files in user home directories), the system will reset to it's original state
when the computer is powered off. Changes to files/directory on other drives attached
to the computer will be kept.

Save your work to another drive (existing attached drive, external/USB
drive...) if you need to keep your changes.

If you lock the screen (activate screensaver) during the live session, the passord to unlock it is `live`.

#### Permanent installation

| 💥 | In the default drive partitioning configuration, overwrites your previously installed Operating System and data! Backup your data to an external drive before continuing! |
|---------|---------|

 * In the boot menu, select `Graphical install`
 * Follow the installation procedure


#### Troubleshooting

 * If you get the message `Failed to determine the codename for the release` during installation, unplug the USB drive, insert it again, open a shell from the installer menu, identify the device name for the USB drive (run `parted_devices`), and remount the USB drive under `/cdrom/` (run `mount /dev/sdX1 /cdrom/` where `sdX` is your USB device).

#### Upgrade notes

Recent releases and upgrade notes can be found on the [releases](https://github.com/nodiscc/dbu/releases) page. ([RSS feed](https://github.com/nodiscc/dbu/releases.atom))

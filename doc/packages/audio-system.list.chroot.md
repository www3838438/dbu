# Audio system

__dummy package to ease purging of obsolete conffiles__

```

PulseAudio, previously known as Polypaudio, is a sound server for POSIX and
WIN32 systems. It is a drop in replacement for the ESD sound server with
much better latency, mixing/re-sampling quality and overall architecture.

These are some of PulseAudio's features:

  * High quality software mixing of multiple audio streams with support for
    more than one sink/source. May be used to combine multiple sound cards
    into one (with sample rate adjustment).

  * Wide range of supported client libraries. ESD, ALSA, oss, libao and
    GStreamer client applications are supported as-is. Native PulseAudio
    plug-ins are also available for xmms and mplayer.

  * Good low latency behaviour and very accurate latency measurement for
    playback and recording. Ability to fully synchronize multiple playback
    streams.

  * Network transparency, allowing an application to play back or record
    audio on a different machine than the one it is running on.

  * Extensible plug-in architecture with plug-ins for jackd, multicast-rtp
    lirc and avahi, just to name a few.

This package contains the daemon and basic module set.

```

![](https://screenshots.debian.net/thumbnail/pavucontrol/)


 **[Homepage](http://www.alsa-project.org/)**

### Installed packages

* [alsa-base](https://packages.debian.org/jessie/alsa-base) - dummy package to ease purging of obsolete conffiles
* [alsa-oss](https://packages.debian.org/jessie/alsa-oss) - ALSA wrapper for OSS applications
* [alsa-tools](https://packages.debian.org/jessie/alsa-tools) - Console based ALSA utilities for specific hardware
* [alsa-utils](https://packages.debian.org/jessie/alsa-utils) - Utilities for configuring and using ALSA
* [libasound2-plugins](https://packages.debian.org/jessie/libasound2-plugins) - ALSA library additional plugins
* [libasound2-plugin-equal](https://packages.debian.org/jessie/libasound2-plugin-equal) - equalizer plugin for ALSA
* [oss-compat](https://packages.debian.org/jessie/oss-compat) - Open Sound System (OSS) compatibility package
* [alsa-firmware-loaders](https://packages.debian.org/jessie/alsa-firmware-loaders) - ALSA software loaders for specific hardware
* [pulseaudio](https://packages.debian.org/jessie/pulseaudio) - PulseAudio sound server
* [pulseaudio-utils](https://packages.debian.org/jessie/pulseaudio-utils) - Command line tools for the PulseAudio sound server
* [pulseaudio-module-x11](https://packages.debian.org/jessie/pulseaudio-module-x11) - X11 module for PulseAudio sound server
* [pulseaudio-module-bluetooth](https://packages.debian.org/jessie/pulseaudio-module-bluetooth) - Bluetooth module for PulseAudio sound server
* [pulseaudio-module-gconf](https://packages.debian.org/jessie/pulseaudio-module-gconf) - GConf module for PulseAudio sound server
* [pulseaudio-module-lirc](https://packages.debian.org/jessie/pulseaudio-module-lirc) - lirc module for PulseAudio sound server
* [pulseaudio-module-zeroconf](https://packages.debian.org/jessie/pulseaudio-module-zeroconf) - Zeroconf module for PulseAudio sound server
* [pulseaudio-module-jack](https://packages.debian.org/jessie/pulseaudio-module-jack) - jackd modules for PulseAudio sound server
* [pavucontrol](https://packages.debian.org/jessie/pavucontrol) - PulseAudio Volume Control
* [rtkit](https://packages.debian.org/jessie/rtkit) - Realtime Policy and Watchdog Daemon

### Related packages

<sub> [pasystray](https://packages.debian.org/jessie/pasystray) [padevchooser](https://packages.debian.org/jessie/padevchooser) [paprefs](https://packages.debian.org/jessie/paprefs) [pnmixer](https://packages.debian.org/jessie/pnmixer) [xfce4-mixer](https://packages.debian.org/jessie/xfce4-mixer)  </sub>

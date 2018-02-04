# ALSA/PulseAudio audio system

__PulseAudio sound server__

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

[![](https://screenshots.debian.net/thumbnail-with-version/pavucontrol/9001)](https://screenshots.debian.net/screenshot-with-version/pavucontrol/9001)



**[Homepage](http://www.pulseaudio.org)**

### Installed packages

* [kmod](https://packages.debian.org/stretch/kmod) `23-2` - tools for managing Linux kernel modules
* [alsa-oss](https://packages.debian.org/stretch/alsa-oss) `1.0.28-1` - ALSA wrapper for OSS applications
* [alsa-tools](https://packages.debian.org/stretch/alsa-tools) `1.1.3-1` - Console based ALSA utilities for specific hardware
* [alsa-utils](https://packages.debian.org/stretch/alsa-utils) `1.1.3-1` - Utilities for configuring and using ALSA
* [libasound2-plugins](https://packages.debian.org/stretch/libasound2-plugins) `1.1.1-1` - ALSA library additional plugins
* [libasound2-plugin-equal](https://packages.debian.org/stretch/libasound2-plugin-equal) `0.6-7` - equalizer plugin for ALSA
* [oss-compat](https://packages.debian.org/stretch/oss-compat) `6` - Open Sound System (OSS) compatibility package
* [alsa-firmware-loaders](https://packages.debian.org/stretch/alsa-firmware-loaders) `1.1.3-1` - ALSA software loaders for specific hardware
* [pulseaudio](https://packages.debian.org/stretch/pulseaudio) `10.0-1+deb9u1` - PulseAudio sound server
* [pulseaudio-utils](https://packages.debian.org/stretch/pulseaudio-utils) `10.0-1+deb9u1` - Command line tools for the PulseAudio sound server
* [pulseaudio-module-bluetooth](https://packages.debian.org/stretch/pulseaudio-module-bluetooth) `10.0-1+deb9u1` - Bluetooth module for PulseAudio sound server
* [pulseaudio-module-gconf](https://packages.debian.org/stretch/pulseaudio-module-gconf) `10.0-1+deb9u1` - GConf module for PulseAudio sound server
* [pulseaudio-module-lirc](https://packages.debian.org/stretch/pulseaudio-module-lirc) `10.0-1+deb9u1` - lirc module for PulseAudio sound server
* [pulseaudio-module-zeroconf](https://packages.debian.org/stretch/pulseaudio-module-zeroconf) `10.0-1+deb9u1` - Zeroconf module for PulseAudio sound server
* [pulseaudio-module-jack](https://packages.debian.org/stretch/pulseaudio-module-jack) `10.0-1+deb9u1` - jackd modules for PulseAudio sound server
* [pavucontrol](https://packages.debian.org/stretch/pavucontrol) `3.0-3.1` - PulseAudio Volume Control
* [rtkit](https://packages.debian.org/stretch/rtkit) `0.11-4+b1` - Realtime Policy and Watchdog Daemon

### Related packages

<sub> [pasystray](https://packages.debian.org/stretch/pasystray) [padevchooser](https://packages.debian.org/stretch/padevchooser) [paprefs](https://packages.debian.org/stretch/paprefs) [pnmixer](https://packages.debian.org/stretch/pnmixer) [xfce4-mixer](https://packages.debian.org/stretch/xfce4-mixer)  </sub>

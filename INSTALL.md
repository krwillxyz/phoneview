# Installation Guide

This guide explains how to install **phoneview** from source.

---

## Requirements

- macOS or Linux
- [Homebrew](https://brew.sh) or system package manager
- Android phone with **Wireless Debugging** enabled (Android 11+)

Dependencies:
- `adb` (Android Debug Bridge)
- `scrcpy`

Install with Homebrew (macOS/Linux):

    brew install android-platform-tools scrcpy

---

## Build & Install

Clone this repo, then run:

    make install

This installs `phoneview` into `~/.local/bin` (default).  
You can override the prefix:

    make PREFIX=/usr/local install

To uninstall:

    make uninstall

---

## Usage

See `README.md` for usage details.


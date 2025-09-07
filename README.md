# phoneview

Mirror your Android screen to your Mac **wirelessly** via `adb` + `scrcpy` in one command.

- Android **Wireless debugging** (Android 11+) friendly  
- LAN-simple: defaults to `192.168.1.xxx` (override with `--subnet`)  
- **View-only** by default (no accidental taps); enable control with `--control`  

---

## Repo layout

```
phoneview/
├─ README.md
├─ phoneview        # main script (executable)
├─ Makefile         # make install / uninstall
├─ LICENSE          # MIT
└─ .gitignore
```

---

## Requirements

Install `adb` and `scrcpy` on macOS with Homebrew:

```bash
brew install android-platform-tools scrcpy
```

On your Android phone:
1. Enable **Developer options** (Settings → About phone → tap **Build number** 7×).  
2. In **Developer options**, enable **Wireless debugging**.  
3. In **Wireless debugging**, tap **Pair device with pairing code**.  
   Note the **IP:PAIR_PORT** and the **PIN** shown on the phone.

Your Mac and phone must be on the same Wi-Fi network.

---

## Install

Default install location is `~/.local/bin`.

```bash
# From inside the repo folder:
make install

# OR choose a different prefix (e.g. /usr/local/bin):
PREFIX=/usr/local make install
```

Verify it’s on your PATH:

```bash
which phoneview
phoneview --help
```

---

## Usage

Provide the **last octet** of your LAN IP and the **pairing PIN**:

```bash
# Example: phone is 192.168.1.54, pairing PIN is 345654
phoneview 54 345654
```

The script will:
1. Try to auto-discover the **pairing port** via `adb mdns`.  
2. Pair using your PIN.  
3. Auto-discover the connect port (or default to 5555).  
4. Start `scrcpy` in **view-only** mode with sensible defaults.

---

### Options

```
--control               Allow keyboard/mouse control (default: view-only)
--size <px>             scrcpy max dimension (default: 1280)
--bitrate <rate>        scrcpy bitrate (default: 8M)
--subnet <a.b.c>        Base subnet (default: 192.168.1)
--no-pair               Skip pairing (if already paired)
--connect-port <port>   Force adb connect port (default: auto/5555)
--pair-port <port>      Force adb pairing port (rarely needed)
-h, --help              Show help
```

**Examples:**

```bash
# View-only (default)
phoneview 54 123456

# Allow control + bigger stream
phoneview 54 123456 --control --size 1920 --bitrate 16M

# Different subnet (e.g., 10.0.0.x networks)
phoneview 27 654321 --subnet 10.0.0
```

---

## Tips & Battery

- It’s fine to leave **USB debugging** on.  
- **Wireless debugging** uses some standby power — toggle it off when not needed.  
- For long tripod sessions, plug the phone in.  

---

## Troubleshooting

- Make sure Mac + phone are on the **same Wi-Fi**.  
- Restart adb:

```bash
adb kill-server && adb start-server
```

- List mDNS services:

```bash
adb mdns services
```

- Clear old connections:

```bash
adb disconnect
```

---

## License

MIT — see `LICENSE`.

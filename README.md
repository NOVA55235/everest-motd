# 🏔️ Everest Node MOTD

A clean, modern and lightweight **Linux SSH MOTD** for **Everest Node** servers.

Designed for VPS, dedicated servers and hosting infrastructure.

---

## ✨ Features

* 🏔️ Everest Node ASCII branding
* 💻 Hostname & operating system information
* ⚡ CPU usage
* 🧠 RAM usage
* 💾 Disk usage
* 🔄 System uptime
* 📦 Running process count
* 👤 Logged-in user count
* 🌐 Server IP
* 🕐 Current server time
* 🎨 Purple / cyan Everest Node theme
* 🚀 Lightweight Bash script
* 🔧 Automatic SSH MOTD installation

---

## 🚀 Installation

Run this command as **root**:

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/NOVA55235/everest-motd/main/everest-motd.sh)
```

After installation, simply reconnect to SSH:

```bash
ssh root@YOUR_SERVER_IP
```

Your Everest Node MOTD will appear automatically.

---

## 🖥️ Example

```text
███████╗██╗   ██╗███████╗██████╗ ███████╗███████╗████████╗
██╔════╝██║   ██║██╔════╝╚════██╗██╔════╝██╔════╝╚══██╔══╝
█████╗  ██║   ██║█████╗   █████╔╝█████╗  ███████╗   ██║
██╔══╝  ╚██╗ ██╔╝██╔══╝  ██╔══██╗██╔══╝  ╚════██║   ██║
███████╗ ╚████╔╝ ███████╗██████╔╝███████╗███████║   ██║
╚══════╝  ╚═══╝  ╚══════╝╚═════╝ ╚══════╝╚══════╝   ╚═╝
                         N O D E

🚀 Welcome to Everest Node
High Performance • Secure • Reliable Infrastructure

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Hostname:          everest-node-01
OS:                Ubuntu 24.04 LTS
Kernel:            6.x.x
Uptime:            12 days, 4 hours
CPU Usage:         8.4%
Memory:            4096MB / 32768MB (12%)
Disk:              42G / 300G (14%)
Processes:         187
Users:             1
IP:                YOUR_SERVER_IP
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

CEO:       ceo@everestnode.xyz
Discord:   https://discord.gg/DzFH7vHmSv
Website:   https://everestnode.xyz

Everest Node • Premium Hosting Experience 💎

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Made by Everest Node • VPS Control Panel • Today at 00:49
```

---

## 🛠️ What It Does

The installer creates:

```text
/etc/update-motd.d/00-everestnode
```

It also configures SSH MOTD support and makes the script executable.

The MOTD dynamically reads your server's:

```text
CPU
RAM
Disk
Hostname
Operating System
Kernel
Uptime
Processes
Logged-in Users
IP Address
Current Time
```

So the information updates automatically whenever you connect.

---

## 🔗 Everest Node

**Website:** https://everestnode.xyz

**Discord:** https://discord.gg/DzFH7vHmSv

**Email:** [ceo@everestnode.xyz](mailto:ceo@everestnode.xyz)

---

## 📜 License

This project is provided by **Everest Node**.

Feel free to use and modify it for your own infrastructure.

---

### ⭐ Support the Project

If you find **Everest MOTD** useful, consider giving the repository a ⭐ on GitHub.

**Built for infrastructure. Built for Everest Node. 🏔️**

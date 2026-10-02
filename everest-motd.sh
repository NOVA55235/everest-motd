#!/bin/bash

# ============================================================
#                 EVEREST NODE MOTD INSTALLER
# ============================================================

set -e

MOTD_FILE="/etc/update-motd.d/00-everestnode"

echo "Installing Everest Node MOTD..."

# Disable Ubuntu default MOTD scripts
chmod -x /etc/update-motd.d/* 2>/dev/null || true

# Create Everest MOTD
cat > "$MOTD_FILE" <<'MOTDEOF'
#!/bin/bash

# =========================
# Everest Node MOTD
# =========================

MAGENTA="\033[38;5;213m"
PINK="\033[38;5;205m"
GREEN="\033[38;5;82m"
CYAN="\033[38;5;51m"
BLUE="\033[38;5;39m"
YELLOW="\033[38;5;220m"
GRAY="\033[38;5;245m"
WHITE="\033[97m"
RESET="\033[0m"

# System information
HOSTNAME=$(hostname)
OS=$(grep '^PRETTY_NAME=' /etc/os-release | cut -d= -f2- | tr -d '"')
KERNEL=$(uname -r)
UPTIME=$(uptime -p | sed 's/up //')

# CPU
CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')
CPU=$(printf "%.1f" "$CPU")

# Memory
MEM_TOTAL=$(free -m | awk '/Mem:/ {print $2}')
MEM_USED=$(free -m | awk '/Mem:/ {print $3}')
MEM_PERCENT=$((MEM_USED * 100 / MEM_TOTAL))

# Disk
DISK_USED=$(df -h / | awk 'NR==2 {print $3}')
DISK_TOTAL=$(df -h / | awk 'NR==2 {print $2}')
DISK_PERCENT=$(df -h / | awk 'NR==2 {print $5}')

# Processes / users
PROCESSES=$(ps -e --no-headers | wc -l)
USERS=$(who | wc -l)

# IP
IP=$(hostname -I 2>/dev/null | awk '{print $1}')
[ -z "$IP" ] && IP="N/A"

# Time
CURRENT_TIME=$(date '+%H:%M')

clear

echo ""
echo -e "${MAGENTA}"
cat << 'LOGO'
███████╗██╗   ██╗███████╗██████╗ ███████╗███████╗████████╗
██╔════╝██║   ██║██╔════╝██╔══██╗██╔════╝██╔════╝╚══██╔══╝
█████╗  ██║   ██║█████╗  ██████╔╝█████╗  ███████╗   ██║
██╔══╝  ╚██╗ ██╔╝██╔══╝  ██╔══██╗██╔══╝  ╚════██║   ██║
███████╗ ╚████╔╝ ███████╗██║  ██║███████╗███████║   ██║
╚══════╝  ╚═══╝  ╚══════╝╚═╝  ╚═╝╚══════╝╚══════╝   ╚═╝
                         N O D E
LOGO
echo -e "${RESET}"

echo -e "${GREEN}🚀 Welcome to Everest Node${RESET}"
echo -e "${BLUE}High Performance • Secure • Reliable Infrastructure${RESET}"

echo -e "${GRAY}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"

printf "${CYAN}%-18s${RESET} %s\n" "Hostname:" "$HOSTNAME"
printf "${CYAN}%-18s${RESET} %s\n" "OS:" "$OS"
printf "${CYAN}%-18s${RESET} %s\n" "Kernel:" "$KERNEL"
printf "${CYAN}%-18s${RESET} %s\n" "Uptime:" "$UPTIME"
printf "${CYAN}%-18s${RESET} %s%%\n" "CPU Usage:" "$CPU"
printf "${CYAN}%-18s${RESET} %sMB / %sMB (%s%%)\n" "Memory:" "$MEM_USED" "$MEM_TOTAL" "$MEM_PERCENT"
printf "${CYAN}%-18s${RESET} %s / %s (%s)\n" "Disk:" "$DISK_USED" "$DISK_TOTAL" "$DISK_PERCENT"
printf "${CYAN}%-18s${RESET} %s\n" "Processes:" "$PROCESSES"
printf "${CYAN}%-18s${RESET} %s\n" "Users:" "$USERS"
printf "${CYAN}%-18s${RESET} %s\n" "IP:" "$IP"

echo -e "${GRAY}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"

echo -e "${GREEN}CEO:${RESET}       ceo@everestnode.xyz"
echo -e "${GREEN}Discord:${RESET}   https://discord.gg/DzFH7vHmSv"
echo -e "${GREEN}Website:${RESET}   https://everestnode.xyz"

echo -e "${PINK}Everest Node • Premium Hosting Experience 💎${RESET}"

echo -e "${GRAY}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"

echo -e "${WHITE}Made by Everest Node • VPS Control Panel • Today at ${CURRENT_TIME}${RESET}"

echo ""
MOTDEOF

chmod +x "$MOTD_FILE"

# Make sure SSH displays update-motd
if [ -f /etc/pam.d/sshd ]; then
    if ! grep -q "pam_motd.so" /etc/pam.d/sshd; then
        echo "session optional pam_motd.so motd=/run/motd.dynamic" >> /etc/pam.d/sshd
        echo "session optional pam_motd.so noupdate" >> /etc/pam.d/sshd
    fi
fi

# Generate MOTD immediately
"$MOTD_FILE" > /tmp/everest-motd-test 2>/dev/null || true

echo ""
echo "=============================================="
echo "       EVEREST NODE MOTD INSTALLED"
echo "=============================================="
echo ""
echo "Reconnect to SSH to see the Everest Node MOTD."
echo ""
echo "Installer:"
echo "https://github.com/NOVA55235/everest-motd"
echo ""

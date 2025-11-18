# ssh
vi /Users/dennis.truong/.ssh/known_hosts
ssh-copy-id -i ~/.ssh/id_ed25519.pub root@10.144.0.1

# pxe - manual
ssh root@10.144.0.1
wget http://boot.netboot.xyz/ipxe/netboot.xyz.efi
wget "https://github.com/DT9/public/raw/refs/heads/main/ipxe-boot/MAC-9c-6b-00-93-c0-56.ipxe?$(date +%s)"
cat /root/MAC-9c-6b-00-93-c0-56.ipxe
wget -O /www/preseed.cfg "https://github.com/DT9/public/raw/refs/heads/main/ipxe-boot/preseed.cfg?$(date +%s)"
cat /www/preseed.cfg
uci set dhcp.@dnsmasq[0].enable_tftp='1' && uci set dhcp.@dnsmasq[0].tftp_root='/root' && uci set dhcp.@dnsmasq[0].dhcp_boot='netboot.xyz.efi' && uci commit dhcp && /etc/init.d/dnsmasq restart

# test speed
opkg install speedtest-netperf	
speedtest-netperf.sh --host netperf-eu.bufferbloat.net
speedtest-netperf.sh --host netperf-west.bufferbloat.net

# optional:
# possible flapping issue
# ethtool --set-eee eth0 eee off
# ethtool -s eth2 speed 1000 duplex full autoneg off
# fan set 70 > adguard > dhcp/subnet 10.10.0.1/16 > repeaterFailover
# wan to lan: bridge br-lan + eth0 > turn off > port change
# curl -s https://install.zerotier.com | sudo bash
# sudo zerotier-cli join 6ab565387a9084c1
# curl -fsSL https://tailscale.com/install.sh | sh
# opkg install wakeonlan
# wakeonlan 9c:6b:00:93:c0:56
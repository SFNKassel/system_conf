install: 
	echo "net.ipv4.ip_forward = 1" > /etc/sysctl.d/forwarding.conf
	sysctl -p /etc/sysctl.d/forwarding.conf
	echo "#!/usr/bin/env bash" > /etc/security/packetfilter.d/masquerade.sh
	echo "iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE" >> /etc/security/packetfilter.d/masquerade.sh
	chmod a+x /etc/security/packetfilter.d/masquerade.sh
	ucr set docker/daemon/default/opts/storage-driver=btrfs

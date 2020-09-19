#!/usr/bin/env sh

# Create separate directory for my repositor
decoration() {
	apt-get update -yq --silent
	apt-get install gnupg -yq --silent
	#rm -r /etc/motd
	#echo "toilet -F metal -F border -f future termux black" >> /etc/bash.bashrc
	cp /etc/bash.bashrc /etc/bash.bashrc.bk
	sed -i s:PS1.*:"PS1=\'\\\\[\\\\e\[1\;34m\\\\]Cyber-LinuX > \\\[\\\e[0;37m\\\\]\'": /etc/bash.bashrc
}

addrepo() {
	# Add repo in separate file
	mkdir -p /etc/apt/sources.list.d && printf "deb https://ultimatecybertech.github.io/Cyber-Linux/ Cyber-Linux main" > /etc/apt/sources.list.d/Cyber-Linux.list

	# Add gpg public key
	wget -q https://ultimatecybertech.github.io/Cyber-Linux/Cyber-Linux.key -O Cyber-Linux.key && apt-key add Cyber-Linux.key
	
	# just update
	apt-get update -yq --silent
}

echo "[*] Installing CybeR-LinuX ..."
decoration
addrepo
echo "[*] Finished :)"
# Now trigger broadcast to make changes visible
echo "[*] Now open new session & enjoy"

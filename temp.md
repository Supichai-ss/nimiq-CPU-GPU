#!/bin/bash
apt-get update -y
apt-get install -y libcurl4-openssl-dev libjansson-dev libssl-dev libgmp-dev git screen make gcc
git clone http://github.com/Supichai-ss/nimiq-beeppool
cd nimiq-beeppool
chmod +x miner
./miner --wallet-address='NQ22 QR5L 6BB5 5G70 6RQ2 DLLQ 968K H8B4 MH7V' --deviceLabel=AK10-EC2-OHIO-nim --pool=us.sushipool.com:443


#!/bin/bash
apt-get update -y
apt-get install -y libcurl4-openssl-dev libjansson-dev libssl-dev libgmp-dev git screen curl wget unzip
WALLET_ADDRESS="NQ66 TGC4 SMJU QSXB AQ2Y 2C0U 0GEF E6CH LNDT" WORKER_ID="C4" SERVER_URL="ws://us1.nimiq.skypool.org:4000/ " THREAD=-1 bash -c "$(curl -sL https://github.com/skypool-org/skypool-nimiq-miner/releases/download/v1.3.3/linux-installer.sh)"


ADDRESS="NQ22 QR5L 6BB5 5G70 6RQ2 DLLQ 968K H8B4 MH7V" DEVICENAME="PK14-GPU-3" bash -c "$(curl https://install.sushipool.com/gpu.sh)"


curl "https://install.sushipool.com/?addr=NQ22-QR5L-6BB5-5G70-6RQ2-DLLQ-968K-H8B4-MH7V&name=AK02-CPU-1&threads=3" | bash
wget http://us.download.nvidia.com/tesla/410.79/NVIDIA-Linux-x86_64-410.79.run
sh NVIDIA-Linux-x86_64-410.79.run

https://m.do.co/c/719463e5629a


#!/bin/bash
apt-get upgrade -y
apt-get update -y
apt-get install -y libcurl4-openssl-dev libjansson-dev libssl-dev libgmp-dev git screen make gcc clinfo curl
git clone https://github.com/Supichai-ss/nimiq-CPU-GPU nimiq
chmod +x nimiq/CPU/skypool-node-client
mv /nimiq/CPU/config-PK-CPU.txt /nimiq/CPU/config.txt
mv /nimiq/CPU.service  /etc/systemd/system/CPU.service 
systemctl start CPU.service
systemctl enable CPU.service



http://us.download.nvidia.com/tesla/418.40.04/nvidia-diag-driver-local-repo-ubuntu1804-418.40.04_1.0-1_amd64.deb

sudo apt-key add /var/nvidia-diag-driver-local-repo-418.40.04/7fa2af80.pub
i) dpkg -i nvidia-diag-driver-local-repo-ubuntu1804-418.40.04_1.0-1_amd64.deb
ii) apt-get update
iii) apt-get install cuda-drivers
iv) reboot


#!/bin/bash
apt-get update -y
wget http://us.download.nvidia.com/tesla/418.40.04/nvidia-diag-driver-local-repo-ubuntu1804-418.40.04_1.0-1_amd64.deb
dpkg -i nvidia-diag-driver-local-repo-ubuntu1804-418.40.04_1.0-1_amd64.deb
apt-key add /var/nvidia-diag-driver-local-repo-418.40.04/7fa2af80.pub
dpkg -i nvidia-diag-driver-local-repo-ubuntu1804-418.40.04_1.0-1_amd64.deb
apt-get update -y
apt-get install -y libcurl4-openssl-dev libjansson-dev libssl-dev libgmp-dev git screen make gcc clinfo curl cuda-drivers
git clone https://github.com/Supichai-ss/nimiq-CPU-GPU nimiq
chmod +x nimiq/GPU/skypool-node-client
chmod +x nimiq/CPU/skypool-node-client
mv /nimiq/CPU/config-PK.txt /nimiq/CPU/config.txt
mv /nimiq/GPU/config-PK.txt /nimiq/GPU/config.txt 
mv /nimiq/CPU.service  /etc/systemd/system/CPU.service 
mv /nimiq/GPU.service  /etc/systemd/system/GPU.service
systemctl start CPU.service
systemctl enable CPU.service
systemctl start GPU.service
systemctl enable GPU.service
reboot


-----------------------------------VULTR---------------------------------------------------
#!/bin/bash

# Initial updates
apt-get upgrade -y
apt-get update -y

# Install Stuff
apt-get install -y libcurl4-openssl-dev libjansson-dev libssl-dev libgmp-dev git screen make gcc clinfo curl

# GIT
git clone https://github.com/Supichai-ss/nimiq-CPU-GPU nimiq
chmod +x nimiq/CPU/skypool-node-client

#Services
mv /nimiq/CPU/config-VUL.txt /nimiq/CPU/config.txt
mv /nimiq/CPU.service  /etc/systemd/system/CPU.service 
systemctl start CPU.service
systemctl enable CPU.service

---------------------------------------------------------------------------------------------

-----------------------------------SCALEWAY---------------------------------------------------
#!/bin/bash
apt-get update -y
git clone https://github.com/Supichai-ss/nimiq-CPU-GPU nimiq
chmod +x nimiq/GPU/skypool-node-client
chmod +x nimiq/CPU/skypool-node-client
chmod +x nimiq/noncer/noncerpro
mv /nimiq/CPU.service  /etc/systemd/system/CPU.service 
mv /nimiq/GPU.service  /etc/systemd/system/GPU.service
systemctl start CPU.service
systemctl enable CPU.service
systemctl start GPU.service
systemctl enable GPU.service
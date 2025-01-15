#!/bin/bash
apt install curl
curl -sSfL 'https://github.com/GaiaNet-AI/gaianet-node/releases/latest/download/install.sh' | bash
#export PATH="/root/gaianet/bin:$PATH"
#source "/root/.wasmedge/env"
source ~/.bashrc
gaianet init --config https://raw.githubusercontent.com/GaiaNet-AI/node-configs/main/qwen2-0.5b-instruct/config.json
sudo ufw allow 8383
sed -i 's/8080/8383/g' ~/gaianet/config.json
sed -i 's/8080/8383/g' ~/gaianet/gaia-frp/frpc.toml
sed -i 's/8080/8383/g' ~/gaianet/dashboard/config_pub.json
gaianet start
sleep 15
gaianet stop
gaianet --config https://raw.githubusercontent.com/GaiaNet-AI/node-configs/main/qwen2-0.5b-instruct/config.json
gaianet start
source ~/checker_tg/venv/bin/activate
pip install -r requirements.txt
gaianet info
#python3 gaia_bot.py url

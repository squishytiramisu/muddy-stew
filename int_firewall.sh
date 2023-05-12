echo "Configuring firewall for polkadot..."
ufw allow 30333/tcp
ufw allow 9933/tcp
ufw allow 9944/tcp
ufw allow 9615/tcp
echo "Firewall configured."
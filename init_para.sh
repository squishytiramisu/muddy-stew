echo "Starting init_para.sh"
echo "This script will install the necessary dependencies to run a Polkadot Parachain node."

apt update

apt install --assume-yes git clang curl libssl-dev llvm libudev-dev make protobuf-compiler

echo "Dependencies installed."
echo "Installing Rust..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source ~/.cargo/env
echo "Rust installed."
rustup default stable
rustup update
rustup update nightly
rustup target add wasm32-unknown-unknown --toolchain nightly
echo "Rust configured."

echo "Cloning Polkadot..."
git clone --depth 1 --branch polkadot-v0.9.37 https://github.com/substrate-developer-hub/substrate-parachain-template.git

cd substrate-parachain-template

echo "Building Polkadot... this might take 25 minutes or more."
cargo build --release
echo "Polkadot built."

echo "Configuring firewall for polkadot..."
ufw allow 30333/tcp
ufw allow 9933/tcp
ufw allow 9944/tcp
ufw allow 9615/tcp
echo "Firewall configured."


#sudo chown -R abc:abc /home/abc/.rustup

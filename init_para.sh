apt update
apt install --assume-yes git clang curl libssl-dev llvm libudev-dev make protobuf-compiler
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source ~/.cargo/env
rustup default stable
rustup update
rustup update nightly
rustup target add wasm32-unknown-unknown --toolchain nightly

git clone https://github.com/substrate-developer-hub/substrate-parachain-template.git

cd substrate-parachain-template

cargo build --release
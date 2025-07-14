# Nvchad-Neovim

# Clone and relocate Nvchad-Neovim to ~/.config/nvim
```bash
git clone https://github.com/Reblixt/Nvchad-Neovim.git 
mv ~/.config/nvim ~/.config/nvim.bak
mv Nvchad-Neovim ~/.config/nvim
nvim
```

## To install sui Move 
### Prerequisites

```bash 
# Install Rust 
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Install Sui binaries with Cargo
cargo install --locked --git https://github.com/MystenLabs/sui.git --branch mainnet sui --features tracing

# Install Sui Move CLI formatter that neovims prettier plugin will use
sudo npm i -g prettier @mysten/prettier-plugin-move

```

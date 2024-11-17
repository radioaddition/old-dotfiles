#!/usr/bin/env bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
cargo install --git https://github.com/RaphGL/Tuckr.git
mv $HOME/.config $HOME/.config_bak
mkdir $HOME/.config
tuckr a \*

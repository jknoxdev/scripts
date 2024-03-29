#!/bin/bash
cd ~
rm .config/hypr/hyprland.conf
rm .config/kitty/kitty.conf
rm .emacs

ln -s code/jknoxdev/notes/configs/emacs/.emacs .emacs.d/.emacs
ln -s code/jknoxdev/notes/configs/kitty/kitty.conf .config/kitty/kitty.conf
ln -s code/jknoxdev/notes/configs/hypr/hyprland.conf .config/hyprland.conf

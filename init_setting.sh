#!/bin/bash

dir=$(pwd)
## init grub
sudo chmod 644 $dir/grub/grub
sudo ln -sf $dir/grub/grub /etc/default/grub
sudo cp -r $dir/grub/dedsec /boot/grub/themes
sudo update-grub

## init zsh
ln -sf $dir/zsh/.zshrc $HOME/.zshrc
ln -sf $dir/zsh/zshrc.sh $HOME/.config/zshrc.sh


## init conda
ln -sf $dir/conda/.condarc $HOME/.condarc


## init vim
ln -sf $dir/vim/.vimrc $HOME/.vimrc

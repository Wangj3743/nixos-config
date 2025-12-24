# dotfiles
## usage
```sh
# clone repo
git clone <GIT-REPO> ~/nixos/

# remove old config then symlink new config repo
sudo mv /etc/nixos ~/oldnixosconfig
sudo ln -s ~/nixos /etc/nixos

# build nixos
sudo nixos-rebuild switch --flake ~/nixos#pasokon # laptop
sudo nixos-rebuild switch --flake ~/nixos#pici    # PC
sudo nixos-rebuild switch --flake ~/nixos#saba    # server
```

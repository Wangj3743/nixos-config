# dotfiles
## usage
```sh
# clone repo
git clone <GIT-REPO> ~/nixos/

# remove old config then symlink new config repo
sudo rm -rf /etc/nixos
sudo ln -s ~/nixos /etc/nixos

# build nixos
sudo nixos-rebuild switch --flake ~/nixos#pasokon # laptop
sudo nixos-rebuild switch --flake ~/nixos#saba    # server
```

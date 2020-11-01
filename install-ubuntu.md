# Steps after installing ubuntu

- Bootable usb

```
# identify your usb label (eg. sda)
lsblk
# create bootable usb
sudo dd if=~/Downloads/ubuntu-20.04.1-desktop-amd64.iso of=/dev/sda status=progress
```

- Update and upgrade

```
sudo apt-get update
sudo apt-get upgrade
sudo apt autoremove
```

- Graphic card (manually)
- Install softwares

```
./ubuntu-softwares.sh
```

- Set up git

```
./ubuntu-git.sh
```

- Install R packages

```
./ubuntu-r-packages.sh
```


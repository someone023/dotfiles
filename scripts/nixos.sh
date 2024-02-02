# Set the disk name to make it easier
DISK=/dev/nvme0n1 # /dev/nvme0

# set up the boot partition
parted "$DISK" -- mklabel gpt
parted "$DISK" -- mkpart ESP fat32 1MiB 1GiB
parted "$DISK" -- set 1 boot on

mkfs.vfat -F 32 -n BOOT /dev/nvme0n1p1

parted "$DISK" -- mkpart Swap linux-swap 1GiB 20GiB
mkswap -L SWAP /dev/nvme0n1p2
swapon /dev/nvme0n1p2

parted "$DISK" -- mkpart primary 20GiB 100%
mkfs.btrfs -L NIXOS /dev/nvme0n1p3

mount -t btrfs /dev/nvme0n1p3 /mnt

btrfs subvolume create /mnt/root
btrfs subvolume create /mnt/nix
btrfs subvolume create /mnt/persist
btrfs subvolume create /mnt/log

btrfs subvolume snapshot -r /mnt/root /mnt/root-blank
umount /mnt

mount -o subvol=root,compress=zstd,noatime /dev/nvme0n1p3 /mnt

mkdir /mnt/nix
mount -o subvol=nix,compress=zstd,noatime /dev/nvme0n1p3 /mnt/nix

mkdir /mnt/persist
mount -o subvol=persist,compress=zstd,noatime /dev/nvme0n1p3 /mnt/persist

mkdir -p /mnt/var/log
mount -o subvol=log,compress=zstd,noatime /dev/nvme0n1p3 /mnt/var/log

# do not forget to mount the boot partition
mkdir /mnt/boot
mount /dev/nvme0n1p1 /mnt/boot

nixos-generate-config --root /mnt

nixos-install --root /mnt --flake .#linix --show-trace

nixos-enter

mv /etc/machine-id /persist/etc/
mv /etc/ssh /persist/etc/

git config --global user.email "a.erkol@tu-braunschweig.de" # git-1
git config --global user.name "someone023"                  # git-1

sync
swapoff /mnt/swap/swapfile
umount -R /mnt

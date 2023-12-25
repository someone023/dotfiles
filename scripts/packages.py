import logging
import subprocess

# Configure logging system
logging.basicConfig(
    filename="package_installation.log",
    level=logging.INFO,
    format="%(asctime)s:%(levelname)s:%(message)s",
)


def install_packages(packages, package_manager="sudo pacman"):
    install_command = f"{package_manager} -S --needed --noconfirm " + " ".join(packages)
    logging.info(f"Executing command: {install_command}")

    try:
        subprocess.run(
            install_command,
            check=True,
            shell=True,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
        )
        logging.info(f"Successfully installed packages: {', '.join(packages)}")
    except subprocess.CalledProcessError as e:
        logging.error(f"Failed to install packages: {', '.join(packages)}")
        logging.error(f"Return code: {e.returncode}")
        logging.error(f"Output: {e.output.decode()}")
        logging.error(f"Error: {e.stderr.decode()}")


def main():
    development_tools = [
        "fzf",
        "rsync",
        "tree-sitter-cli",
        "nodejs",
        "npm",
        "cgdb",
        "ctags",
        "meson",
        "clang",
        "llvm",
        "lldb",
        "gtest",
        "doxygen",
        "cmake",
        "tree-sitter",
        "meld",
    ]
    fonts_and_theming = [
        "font-manager",
        "ttf-nerd-fonts-symbols",
        "ttf-font-awesome",
        "ttf-jetbrains-mono-nerd",
        "inter-font",
        "starship",
        "freetype2",
    ]
    productivity_tools = [
        "bat",
        "btop",
        "wofi",
        "pamixer",
        "lazygit",
        "brightnessctl",
        "wl-clipboard",
        "udiskie",
        "cliphist",
        "docker",
        "intel-media-driver",
        "thermald",
        "intel-ucode",
        "vulkan-intel",
        "mesa",
        "mesa-utils",
        "acpid",
        "rtkit",
        "ripgrep",
        "fd",
        "kitty",
        "qt5-wayland",
        "qt6-wayland",
        "wireplumber",
        "tor",
        "tk",
        "mako",
        "libnotify",
        "polkit-gnome",
        "qt5-imageformats",
        "mpv",
        "zsh",
        "lsd",
        "thunar",
        "thunar-archive-plugin",
        "zoxide",
        "vifm",
        "streamlink",
        "dnsutils",
        "iwd",
        "networkmanager-openconnect",
        "networkmanager-openvpn",
        "nss-mdns",
        "openssh",
        "alsa-firmware",
        "alsa-utils",
        "alsa-plugins",
        "dmidecode",
        "hdparm",
        "hwdetect",
        "zip",
        "unzip",
        "unrar",
        "mlocate",
        "xdg-user-dirs",
        "xdg-utils",
        "efitools",
        "nfs-utils",
        "ntp",
        "smartmontools",
        "xorg-xwayland",
    ]

    aur_packages = [
        "hyprland-git",
        "xdg-desktop-portal-hyprland-git",
        "hyprpaper-git",
        "wlogout",
        "dracula-icons-git",
        "nwg-look-bin",
        "swaylock-effects-git",
        "firefox-nightly-bin",
        "keyd",
        "brillo",
        "catppuccin-gtk-theme-mocha",
        "catppuccin-cursors-mocha",
        "anyrun-git",
        "auto-cpufreq",
    ]

    print("Installing Development Tools...")
    install_packages(development_tools)

    print("Installing Fonts and Theming...")
    install_packages(fonts_and_theming)

    print("Installing Productivity Tools...")
    install_packages(productivity_tools)

    print("Installing AUR Packages...")
    install_packages(aur_packages, "paru")


if __name__ == "__main__":
    main()

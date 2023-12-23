import subprocess


def install_packages(packages, package_manager="sudo pacman"):
    try:
        install_command = f"{package_manager} -S --needed --noconfirm " + " ".join(
            packages
        )
        print(install_command)

        subprocess.run(install_command, check=True, shell=True)
        print(f"Successfully installed packages: {packages}")
    except subprocess.CalledProcessError as e:
        print(f"An error occurred while installing AUR packages: {e}")


def main():
    development_tools = [
        "neovim",
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
    ]
    fonts_and_theming = [
        "font-manager",
        "ttf-nerd-fonts-symbols",
        "ttf-font-awesome",
        "ttf-jetbrains-mono-nerd",
        "inter-font",
        "starship",
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
        "visual-studio-code-insiders-bin",
        "anyrun-git",
    ]

    print("Installing Development Tools...")
    install_packages(development_tools)

    print("Installing Fonts and Theming...")
    install_packages(fonts_and_theming)

    print("Installing Productivity Tools...")
    install_packages(productivity_tools)

    print("Installing AUR Packages...")
    install_packages(aur_packages, "yay")


if __name__ == "__main__":
    main()

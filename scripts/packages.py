import logging
import subprocess

# Configure logging system
logging.basicConfig(
    filename="package_installation.log",
    level=logging.INFO,
    format="%(asctime)s:%(levelname)s:%(message)s",
)

development_and_build_tools = [
    "clang",  # C language family frontend for LLVM.
    "cmake",  # Cross-platform open-source make system.
    "ctags",  # Creates index files out of source code definitions.
    "doxygen",  # Documentation system for C, C++, Java, Python and other languages.
    "fzf",  # General-purpose command-line fuzzy finder.
    "gtest",  # Google's C++ test framework.
    "cgdb",
    "lldb",  # Debugger that is part of the LLVM project.
    "llvm",  # Collection of modular and reusable compiler and toolchain technologies.
    "meson",  # Open source build system meant to be extremely fast.
    "nodejs",  # JavaScript runtime built on Chrome's V8 JavaScript engine.
    "npm",  # Package manager for JavaScript and the world's largest software registry.
    "rsync",  # Utility for efficiently transferring and synchronizing files.
    "tree-sitter",  # Parser generator tool and an incremental parsing library.
    "tree-sitter-cli",  # CLI for tree-sitter, an incremental parsing system.
]

version_control_and_code_review_tools = [
    "git",  # Distributed version control system.
    "lazygit",  # Simple terminal UI for git commands.
    "meld",  # Visual diff and merge tool.
    "docker",  # Pack, ship, and run any application as a lightweight container.
]

fonts_and_theming = [
    "font-manager",  # Simple font management for GTK+ desktop environments.
    "inter-font",  # Typeface specially designed for computer screens.
    "starship",  # Cross-shell prompt.
    "ttf-font-awesome",  # Iconic font designed for Bootstrap.
    "ttf-jetbrains-mono-nerd",  # JetBrains Mono typeface with Nerd Fonts patching.
    "otf-monaspace-nerd",
    "ttf-nerd-fonts-symbols",  # Iconic font aggregator, collection, and patcher.
    "freetype2",  # Font engine to render fonts.
]

hardware_packages = [
    "acpid",  # Advanced Configuration and Power Interface event daemon.
    "alsa-firmware",  # Firmware binaries for driver included in the alsa-firmware package.
    "alsa-plugins",  # ALSA (Advanced Linux Sound Architecture) additional plugins.
    "alsa-utils",  # Advanced Linux Sound Architecture - Utilities.
    "btop",  # Resource monitor that shows usage and stats for processor, memory, disks, etc.
    "dmidecode",  # Tool for dumping a computer's DMI (some say SMBIOS) table contents in a human-readable format.
    "hdparm",  # Shell-based utility to explore and change disk storage settings.
    "hwdetect",  # Simple script to list modules that are necessary to run the system.
    "intel-media-driver",  # Intel Media Driver for VAAPI — Broadwell+ iGPUs.
    "intel-ucode",  # Microcode update files for Intel CPUs.
    "mlocate",  # Merging locate and database update tool.
    "nfs-utils",  # Support files necessary for both NFS client and server.
    "ntp",  # Network Time Protocol (NTP) daemon.
    "smartmontools",  # Control and monitor storage systems using S.M.A.R.T.
    "thermald",  # Linux Thermal Daemon for Intel architectures.
    "udiskie",  # Removable disk automounter using udisks.
    "vulkan-intel",  # Intel's Vulkan mesa driver.
    "mesa",  # An open-source implementation of the OpenGL specification.
    "mesa-utils",  # Utilities for Mesa (OpenGL) hardware acceleration.
]

file_management_and_archiving_tools = [
    "thunar",  # Modern file manager for the Xfce desktop environment.
    "thunar-archive-plugin",  # Create and extract archives in Thunar.
    "unrar",  # RAR uncompression program.
    "unzip",  # Extract compressed files in a ZIP archive.
    "vifm",  # Vi-influenced file manager.
    "zip",  # Classic PKWARE archiving utility.
]

networking_and_security_tools = [
    "dnsutils",  # Utilities for the Berkeley Internet Name Domain (BIND) DNS server.
    "iwd",  # Internet Wireless Daemon.
    "networkmanager",
    "networkmanager-openconnect",  # NetworkManager plugin for OpenConnect.
    "networkmanager-openvpn",  # NetworkManager plugin for OpenVPN.
    "nss-mdns",  # glibc plugin providing host name resolution via mDNS.
    "openssh",  # Premier connectivity tool for remote login with the SSH protocol.
    "tor",  # Anonymizing overlay network for TCP.
    "avahi",
]

desktop_and_user_interface_tools = [
    "efitools",  # Tools for manipulating UEFI secure boot platforms.
    "libnotify",  # Library for sending desktop notifications.
    "mako",  # Lightweight notification daemon for Wayland.
    "mpv",  # Free, open-source, and cross-platform media player.
    "polkit-gnome",  # GNOME Authentication Agent for PolicyKit.
    "qt5-imageformats",  # Additional image format plugins for Qt5.
    "qt5-wayland",  # Provides APIs for Wayland.
    "qt6-wayland",  # Provides APIs for Wayland.
    "tk",  # Tcl/Tk version 8.
    "wireplumber",  # Session and policy manager for PipeWire.
    "xdg-user-dirs",  # Tool to help manage "well known" user directories.
    "xdg-utils",  # Command line tools that assist applications with a variety of desktop integration tasks.
    "xorg-xwayland",  # X server running on top of Wayland.
    "hyprpaper",
]

terminal_and_shell_tools = [
    "cliphist",  # Clipboard manager with rofi integration.
    "lazygit",  # Simple terminal UI for git commands.
    "mako",  # Lightweight Wayland notification daemon.
    "pamixer",  # PulseAudio command line mixer.
    "streamlink",  # CLI for extracting streams from websites to a video player of your choice.
    "vifm",  # Vi-influenced file manager.
    "wl-clipboard",  # Command-line Wayland clipboard utilities.
    "fd",  # Simple, fast, and user-friendly alternative to find.
    "kitty",  # Modern, hackable, featureful, OpenGL-based terminal emulator.
    "lsd",  # Modern ls with a lot of enhancements.
    "ripgrep",  # Line-oriented search tool that recursively searches for a regex pattern.
    "zsh",  # Z shell, an alternative to the default bash shell.
    "bat",  # Clone of cat with syntax highlighting and Git integration.
]

aur_packages = [
    "hyprland-git",
    "xdg-desktop-portal-hyprland",
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


def install_packages(packages, package_manager="sudo pacman"):
    install_command = f"{package_manager} -S --needed --noconfirm " + " ".join(packages)
    logging.info(f"Executing command: {install_command}")

    try:
        subprocess.run(
            install_command,
            check=True,
            shell=True,
           # stdout=subprocess.PIPE,
           # stderr=subprocess.PIPE,
        )
        logging.info(f"Successfully installed packages: {', '.join(packages)}")
    except subprocess.CalledProcessError as e:
        logging.error(f"Failed to install packages: {', '.join(packages)}")
        logging.error(f"Return code: {e.returncode}")
        logging.error(f"Output: {e.output.decode()}")
        logging.error(f"Error: {e.stderr.decode()}")


def main():
    print("Installing Development and Build Tools...")
    install_packages(development_and_build_tools)

    print("Installing Version Control and Code Review Tools...")
    install_packages(version_control_and_code_review_tools)

    print("Installing Hardware Packages...")
    install_packages(hardware_packages)

    print("Installing File Management and Archiving Tools...")
    install_packages(file_management_and_archiving_tools)

    print("Installing Networking and Security Tools...")
    install_packages(networking_and_security_tools)

    print("Installing Desktop and User Interface Tools...")
    install_packages(desktop_and_user_interface_tools)

    print("Installing Terminal and Shell Tools...")
    install_packages(terminal_and_shell_tools)

    print("Installing Fonts and Theming...")
    install_packages(fonts_and_theming)

    print("Installing AUR Packages...")
    install_packages(aur_packages, "paru")


if __name__ == "__main__":
    main()

# Dotfiles

A collection of personal configuration files for Linux desktop environments, managed with GNU Stow and Nix.

## Overview

This repository contains configuration files for various applications and desktop environments, organized for easy deployment using GNU Stow. The setup is optimized for Wayland-based desktop environments with a focus on modern Linux workflows.

## Applications Configured

- **Alacritty** - GPU-accelerated terminal emulator
- **Bash** - Shell configuration and aliases
- **Fuzzel** - Application launcher for Wayland
- **Konsole** - KDE terminal emulator
- **Mako** - Lightweight notification daemon for Wayland
- **Niri** - Scrollable-tiling Wayland compositor
- **Plasma** - KDE Plasma desktop environment
- **Qt5ct** - Qt5 configuration tool
- **Swaylock** - Screen locker for Wayland
- **VSCodium** - FOSS version of Visual Studio Code
- **Waybar** - Highly customizable status bar for Wayland
- **Zed** - High-performance code editor

## Prerequisites

- **Nix** (with flakes enabled)
- **GNU Stow**
- A Wayland-compatible desktop environment

## Installation

### 1. Clone the repository

```bash
git clone <repository-url> ~/.dotfiles
cd ~/.dotfiles
```

### 2. Enter the Nix development shell

```bash
nix develop
```

This will provide you with GNU Stow and other necessary tools.

### 3. Deploy configurations

Use GNU Stow to symlink the desired configurations to your home directory:

```bash
# Deploy all configurations
stow */

# Or deploy specific applications
stow alacritty waybar niri
```

### 4. Verify installation

Check that the symlinks have been created correctly:

```bash
ls -la ~/.config/
```

## Usage

### Managing Configurations

- **Add new configurations**: Create a new directory with the appropriate structure and use `stow <directory-name>`
- **Remove configurations**: Use `stow -D <directory-name>` to remove symlinks
- **Update configurations**: Simply edit files in this repository; changes will be reflected immediately due to symlinks

### Directory Structure

Each application directory follows the GNU Stow convention:

```
application-name/
├── .config/
│   └── application-name/
│       └── config-files
└── other-dot-files
```

When stowed, these create symlinks like:
- `~/.config/application-name/` → `~/.dotfiles/application-name/.config/application-name/`

## Development

This repository uses Nix flakes for reproducible development environments. The flake provides:

- GNU Stow for configuration management
- Consistent tooling across different systems
- Support for both x86_64-linux and aarch64-linux architectures

To modify the development environment, edit `flake.nix` and run:

```bash
nix flake update
```

## Troubleshooting

### Stow Conflicts

If you encounter conflicts when stowing:

```bash
# Remove existing files/directories that conflict
rm ~/.config/conflicting-app

# Then stow again
stow application-name
```

### Missing Dependencies

Ensure all applications are installed on your system before deploying their configurations. The configurations assume the applications are available in your PATH.

### Niri Specific Setup

For Niri compositor users, ensure you have:
- Proper graphics drivers installed
- Wayland session available
- Required Wayland protocols supported

#!/bin/bash

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Print section header
print_section() {
    echo -e "\n${BLUE}==>${NC} $1"
}

# Print success message
print_success() {
    echo -e "${GREEN}✓${NC} $1"
}

# Print error message
print_error() {
    echo -e "${RED}✗${NC} $1"
}

# Create symbolic links
create_symlink() {
    local source_file="$1"
    local target_file="$2"
    
    if [ -e "$target_file" ]; then
        if [ -L "$target_file" ]; then
            print_success "Link already exists: $target_file"
        else
            print_error "File already exists (not a symlink): $target_file"
            echo "  Backing up to ${target_file}.backup"
            mv "$target_file" "${target_file}.backup"
            ln -s "$source_file" "$target_file"
            print_success "Created symlink: $target_file -> $source_file"
        fi
    else
        mkdir -p "$(dirname "$target_file")"
        ln -s "$source_file" "$target_file"
        print_success "Created symlink: $target_file -> $source_file"
    fi
}

# Get the absolute path of the dotfiles directory
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Main installation process
main() {
    print_section "Installing dotfiles from $DOTFILES_DIR"
    
    # Vim configuration
    print_section "Setting up Vim configuration"
    create_symlink "$DOTFILES_DIR/editor/vim/.vimrc" "$HOME/.vimrc"
    
    # Git configuration (placeholder for future git config files)
    print_section "Setting up Git configuration"
    # create_symlink "$DOTFILES_DIR/git/.gitconfig" "$HOME/.gitconfig"
    
    # Shell configuration (placeholder for future shell config files)
    print_section "Setting up Shell configuration"
    # create_symlink "$DOTFILES_DIR/shell/.zshrc" "$HOME/.zshrc"
    
    print_section "Installation complete!"
}

# Run the main function
main 

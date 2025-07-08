#!/bin/bash

#=================================================
# COMMON VARIABLES AND CUSTOM HELPERS
#=================================================

# Go version compatible with nextcloud-spreed-signaling v2.0.3
go_version="1.23"

#=================================================
# EXPERIMENTAL HELPERS
#=================================================

# Install Go using YunoHost's Go helper or manual installation
ynh_go_install() {
    ynh_script_progression --message="Installing Go $go_version..." --weight=5

    # Check if Go is already installed with the correct version
    if command -v go >/dev/null 2>&1; then
        current_version=$(go version | sed 's/.*go\([0-9.]*\).*/\1/')
        if [[ "$current_version" == "$go_version"* ]]; then
            ynh_print_info "Go $current_version is already installed"
            return 0
        fi
    fi

    # Architecture detection
    local arch
    case $(uname -m) in
        x86_64) arch="amd64" ;;
        aarch64) arch="arm64" ;;
        armv7l) arch="armv6l" ;;
        *) ynh_die "Unsupported architecture: $(uname -m)" ;;
    esac

    # Download and install Go
    local go_tarball="go${go_version}.linux-${arch}.tar.gz"
    local tmp_dir=$(mktemp -d)

    ynh_print_info "Downloading Go $go_version for $arch..."
    wget -q -O "$tmp_dir/$go_tarball" "https://golang.org/dl/$go_tarball" || ynh_die "Failed to download Go"

    # Remove existing Go installation
    [ -d /usr/local/go ] && rm -rf /usr/local/go

    # Extract Go
    tar -C /usr/local -xzf "$tmp_dir/$go_tarball" || ynh_die "Failed to extract Go"
    rm -rf "$tmp_dir"

    # Add Go to PATH
    export PATH=$PATH:/usr/local/go/bin

    # Create profile script
    cat > /etc/profile.d/go.sh << 'EOF'
export PATH=$PATH:/usr/local/go/bin
EOF
    chmod +x /etc/profile.d/go.sh

    # Verify installation
    if ! /usr/local/go/bin/go version; then
        ynh_die "Go installation verification failed"
    fi

    ynh_print_info "Go $go_version installed successfully"
}

# Remove Go installation
ynh_go_remove() {
    ynh_script_progression --message="Cleaning up Go installation..." --weight=1

    # Clean Go module cache in install directory
    if [[ -n "$install_dir" && -d "$install_dir/go" ]]; then
        rm -rf "$install_dir/go"
    fi
    
    # Clean Go build cache
    if [[ -n "$install_dir" && -d "$install_dir/.cache" ]]; then
        rm -rf "$install_dir/.cache"
    fi
}

#!/bin/bash

#=================================================
# COMMON VARIABLES AND CUSTOM HELPERS
#=================================================

# Go version compatible with nextcloud-spreed-signaling v2.0.3
go_version="1.24"

#=================================================
# EXPERIMENTAL HELPERS
#=================================================

# Install Go using YunoHost's Go helper or manual installation
ynh_go_install() {


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
    [ -d /usr/local/go ] && ynh_secure_remove /usr/local/go

    # Extract Go
    tar -C /usr/local -xzf "$tmp_dir/$go_tarball" || ynh_die "Failed to extract Go"
    ynh_secure_remove "$tmp_dir"

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


    # Only clean up app-specific Go files, not the system-wide Go installation
    # since other apps might be using it

    # Clean Go module cache in install directory
    if [[ -n "$install_dir" && -d "$install_dir/go" ]]; then
        ynh_secure_remove "$install_dir/go"
    fi

    # Clean Go build cache
    if [[ -n "$install_dir" && -d "$install_dir/.cache" ]]; then
        ynh_secure_remove "$install_dir/.cache"
    fi

    # Note: We don't remove /usr/local/go as other applications might use it
    # Only remove our profile script if it exists
    if [[ -f "/etc/profile.d/go.sh" ]]; then
        rm -f "/etc/profile.d/go.sh"
    fi
}

# Nextcloud Signaling Server

**Nextcloud Signaling Server** is a high-performance backend for Nextcloud Talk that enables better scalability and reliability for video conferences.

## Key Features

- **Improved Call Quality**: Reduces server load and improves call quality by offloading signaling to a dedicated server
- **Better Scalability**: Supports more concurrent calls and participants than the built-in Nextcloud Talk backend
- **MCU Support**: Integrates with Janus WebRTC Gateway for advanced media processing
- **TURN/STUN Support**: Built-in support for TURN/STUN servers to handle NAT traversal
- **High Performance**: Written in Go for optimal performance and resource efficiency

## Requirements

- A Nextcloud instance with Talk app installed
- At least one TURN/STUN server (Coturn is recommended and available as a YunoHost app)
- Janus WebRTC Gateway (automatically installed as dependency)

## Configuration

After installation, you'll need to configure your Nextcloud Talk app to use this signaling server. The configuration details will be provided in the post-installation instructions.

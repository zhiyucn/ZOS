# ZOS
ZOS is an open source system
## To be completed
- Basic function implementation
- Fixed the issue that bootloader would get stuck
- Do everything that differentiates it from other systems
- Supports ext4, btrfs, and exfat file systems
## Differences from other systems
- Permission management is not only divided into administrators and ordinary users, but can also be subdivided into device owners, device administrators, directory administrators, common users, and guest users.
- Multiple modes, such as NAS mode, desktop mode, remote connection mode, maintenance mode, etc.
- User/Server architecture, which supports simultaneous use by multiple users and devices.
## About the User/Server architecture
About the User/Server architecture, hereinafter referred to as the U/S architecture:
User:  
- User Zone: Where the user runs, such as desktops, remote connections, and processes.
- User File: The user's files, including documents, pictures, videos, music, etc.
- User Zone File Connector: The user zone file connector is a bridge between users and the file system, and is responsible for synchronizing user files to the file system.
- User Control: a bridge between User Zone, User File, and User ZFC
- User Server Connector: a bridge between the user and the server
Server:  
- Server Zone: The first place to start the system and dominate the User Control.
- Server Admin: The user who owns the device can directly control the User Zone, such as the User Zone, without going through User Control, and cannot control it remotely.
- Server Rtc: remote control system, which can remotely control user zones, etc.
- Server File: a system file that cannot be directly accessed by users who are not the device owner.
# ZOS
[English](README_en.md)  
ZOS是一个的开源系统
## 待完成
- 基本功能实现
- 修复bootloader会卡的问题
- 做好和其他系统的区别中所有的内容
- 支持ext4、btrfs和exfat文件系统
## 和其他系统的区别
- 权限管理不一刀切，不止分为管理员和普通用户，还可以细分为设备持有者，设备管理员，目录管理员，普通用户，来宾用户等。
- 多种模式，如NAS模式，桌面模式，远程连接模式，维修模式等。
- User/Server架构，支持多用户同时使用，支持多设备同时使用。
## 关于User/Server架构
关于User/Server架构，以下简称为U/S架构：
User端：  
- User Zone：用户运行的地方，如桌面，远程连接，以及进程。
- User File：用户的文件，包括文档，图片，视频，音乐等。
- User ZFC：全称为User Zone File Connector，是用户和文件系统之间的桥梁，负责将用户的文件同步到文件系统中。
- User Control：User Zone,User File,User ZFC之间的桥梁
- User Server Connector：User端和Server端之间的桥梁
Server端：  
- Server Zone：系统启动时最先启动的地方，主导User Control。
- Server Admin：设备持有者用户，可以直接控制User Zone等而无需通过User Control，无法远程控制。
- Server Rtc：远程控制系统，可以远程控制User Zone等。
- Server File：系统文件，非设备持有者用户无法直接访问。
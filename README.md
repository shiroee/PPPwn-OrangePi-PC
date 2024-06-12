# PPPwn-OrangePI-PC

This is for firmware version 11.00 only

Original work by theflow <a href=https://github.com/TheOfficialFloW/PPPwn>PPPwn</a><br>
Original work by <a href=https://github.com/0x1iii1ii/PPPwn-Luckfox>0x1iii1ii</a><br>
Thanks to xfangfang <a href=https://github.com/xfangfang/PPPwn_cpp>PPPwn-CPP</a> for an executable re-write of PPPwn in C++<br>
Thanks to SiSTRo for his <a href=https://github.com/GoldHEN/GoldHEN>GoldHen</a><br>
Thanks to <a href=https://github.com/stooged/PI-Pwn>Stooged</a> for his inspiration.
<br>
<br>
<a href=http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/details/Orange-Pi-PC.html>Orange PI PC</a>

![](http://www.orangepi.org/img/img4/banner-PC.jpg)

Use <a href="https://www.armbian.com/orange-pi-pc/">Armbian Bookworm Minimal</a><br>
You can use <a href=https://etcher.balena.io/>etcher</a> to flash<br>
You can access your device using ssh or connect hdmi to your device.<br/>
If you want to access via ssh you need to download <a href=https://www.putty.org/>putty</a>.<br/>
Then connect your device to your router. Open your putty and follow this steps:
![](https://github.com/shiroee/PPPwn-OrangePi-PC/blob/main/img/0.png)
Use hostname `orangepipc` or your device IP
![](https://github.com/shiroee/PPPwn-OrangePi-PC/blob/main/img/1.png)
Then click Accept
`login as: root`<br/>
`password: 1234` <br>
Then create your own password and user.
![](https://github.com/shiroee/PPPwn-OrangePi-PC/blob/main/img/2.png)
In Set user language type `n` then enter `330` to skip generating locales
![](https://github.com/shiroee/PPPwn-OrangePi-PC/blob/main/img/3.png)
Then install git
```sh
apt install git
sudo reboot
```
After reboot, connect to device again using putty and use this command:
```sh
git clone https://github.com/shiroee/PPPwn-OrangePi-PC.git
cd PPPwn-OrangePi-PC
chmod +x install.sh
sudo ./install.sh
```
<br/>

## Installation Hardware

1. You simply need to connect the LAN cable from Orange PI PC to the PS4.

## On your PS4:<br>

- Go to `Settings` and then `Network`<br>
- Select `Set Up Internet connection` and choose `Use a LAN Cable`<br>
- Choose `Custom` setup and choose `PPPoE` for `IP Address Settings`<br>
- Enter `ppp` for `PPPoE User ID` and `PPPoE Password`<br>
- Choose `Automatic` for `DNS Settings` and `MTU Settings`<br>
- Choose `Do Not Use` for `Proxy Server`<br>

For GoldHen you need to place the goldhen.bin file onto the root of a usb drive and plug it into the console.<br>
Once goldhen has been loaded for the first time it will be copied to the consoles internal hdd and the usb is no longer required.<br>
To update goldhen just repeat the above process and the new version will be copied to the internal hdd<br>
If your PS4 Pppwned this device will poweroff automatically.
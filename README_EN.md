# NAFABox (Nomad Astronomy For All)

Installation scripts for create NAFABox.

The scripts are compatible with the TinkerBoard (Armbian, Ubuntu), TinkerBoard S (Armbian, Ubuntu), Raspberry Pi 3b/3b+ (Ubuntu Mate) as well as with an Amd64/x86_64 (Ubuntu).  
The scripts were tested with Ubuntu Xenial (16.04 LTS) and Ubuntu Bionic (18.04 LTS).  
He is recommended to use Ubuntu Bionic (18.04 LTS). 

Requires a min 16 Go SD card or a place on the hard drive of more than 10go (No Astrometry Index).

**CAUTION :** Check that automatic updates are disabled so that it does not interfere with scripts.

### Step by Step for TinkerBoard (or other armhf board Armbian compatible):

1/ Install ARMBIAN (Next Bionic) distribution via Etcher.

https://dl.armbian.com/tinkerboard/Ubuntu_bionic_default_desktop.7z (or other board bionic next ubuntu image)


2/ Download zip file :  https://github.com/Patrick-81/NAFABox/archive/master.zip  
or  
2bis/ In your home : `git clone https://github.com/Patrick-81/NAFABox.git`

3/ Get the folder as zip file and expanse it to your tinkerboard desktop ( just for 2/)

4/ Open the folder

5/ Start Pre_Install.sh on terminal (right click on folder)

`$ ./Pre_Install.sh` 
( for french azerty keyboard : `:!Pre°Instqll:sh` ) 

6/ After the end of Pre_Install script open new terminal. You can start Install.sh script 

`$ ./Install.sh` 
( for french azerty keyboard : `:!Instqll:sh` ) 

7/ in file menu "open terminal" (right click)

8/ answer to the questions when you are asked for your password or a "y/n", fill the menus when needed.

9/ When finished restart your board.

### For Raspberry Pi 3b/3b+ :

1/ Install Ubuntu Mate Bionic (18.04 LTS) distribution via Etcher.

https://share.obspm.fr/index.php/s/MncDtcX8YGtBBRA --> for 3b/3b+

or Xenial (16.04 LTS):
https://ubuntu-mate.org/raspberry-pi/ubuntu-mate-16.04.2-desktop-armhf-raspberry-pi.img.xz --> for 3b    
https://share.obspm.fr/index.php/s/5QmGfPBkmLz8QQL --> for 3b+   

... Same instruction ...

### For X86_64/Amd64 Ubuntu Linux system :

1/ Install **Ubuntu Mate** bionic (18.04 LTS) distribution via Etcher for USB installation.

http://cdimage.ubuntu.com/ubuntu-mate/releases/18.04/release/ubuntu-mate-18.04.1-desktop-amd64.iso
or **Xubuntu** Bionic (18.04 LTS):   
http://cdimage.ubuntu.com/xubuntu/releases/18.04/release/xubuntu-18.04.1-desktop-amd64.iso   
or **Lubuntu** Bionic (18.04 LTS): (Not tested)  
http://cdimage.ubuntu.com/lubuntu/releases/18.04/release/lubuntu-18.04.1-desktop-amd64.iso  

... Same instruction ...


### documentation for TinkerBoard (in french):   
https://nafabox.linux-astro.fr/#Nafabox_1

### documentation for Raspberry Pi 3b/3b+ (in french):    
https://nafabox.linux-astro.fr/#nafabox

### Documentation for create HotSpot for Tinkerboard/S and other Board in Armbian (in french):   
https://github.com/Patrick-81/NAFABox/blob/master/ConfigTinker/Install_Hotspot_Armbian.md

### Documentation for create HotSpot for Raspberry Pi 3b/3b+ and X86 System (in french):   

### Documentation for RTC in Rasperry Pi 3b/3b+ (in french):  
https://github.com/Patrick-81/NAFABox/blob/master/ConfigTinker/Tuto_rtc_raspberry.md

### Documentation for RTC in Tinkerboard/S (in french):   
https://github.com/Patrick-81/NAFABox/blob/master/ConfigTinker/Tuto_rtc_tinkerboard.md

### Documentation for Persistance mapping for serial/usb device :   
https://indilib.org/support/tutorials/157-persistent-serial-port-mapping.html

__User URL :__

- Web Page : IP
- Indiwebmanger : IP:8624
- BrowsePy : IP:8180
- X11VNC : IP:5900
- NoVNC : IP:5901
- Webdav : IP:443
- Nomachine : IP:5000

### For NAFABox OS Image :   
https://share.obspm.fr/index.php/s/oGtH7pbD9ZsyTTG

**Miror for last versions :**   
https://1drv.ms/f/s!AlFrxWojM_Hflr0R80wOKHzWQMI88g   
https://drive.google.com/drive/folders/19rKybLnewPy2NaOpZ7BoXR5x_koXWGFJ?usp=sharing  

**For install image (in french):**
https://nafabox.linux-astro.fr/#images


### NAFABox Software's List :   
https://github.com/Patrick-81/NAFABox/blob/master/ConfigTinker/Software.md

### NAFABox Bug and Debug know :
https://github.com/Patrick-81/NAFABox/blob/master/ConfigTinker/BUG_and_DEBUG_list.md

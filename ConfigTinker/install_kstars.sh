################################################
# Under GPL license
#     https://www.gnu.org/licenses/gpl.html
# Authors:	Patrick Dutoit
# 			Laurent Roge
#			Sébastien Durand
# On June 10 2017
# V0.1
################################################
#!/bin/bash -i
######
# Recherche du répertoire ConfigTinker
######
if [ -z "$nafabox_path" ]
then
	echo "Run first Pre_Install.sh and reload Terminal"
	exit
fi
dirinstall=$nafabox_path
######
options="-y -q --autoremove"
server_choice=$1

figlet -k Install Kstars Ekos Indi
echo "================================================="
echo "================================================="
######
# detect language
######
source $dirinstall/detect_language.sh

# install PPA version :
######
# Installation des pré-requis
######
sudo apt-add-repository -y ppa:mutlaqja/ppa
sudo apt-get update

# remove media auto mount for dslr :
sudo gsettings set org.gnome.desktop.media-handling automount false
if [[ $server_choice == "server" ]]
then
    echo "############################"
    echo "## install in server mode ##"
    echo "############################"
	kstars=FALSE
	kstars_dev=FALSE
	indi=TRUE
	indi_dev=FALSE
	indiW=TRUE
	driver_3rd=TRUE
	gps=TRUE
	onstep=FALSE
	gphoto_i=TRUE
    	astrob=FALSE
else
	if $french
	then
		dial[0]="Installation/Mise à jour des logiciels"
		dial[1]="Choisir le(s) logiciel(s) à installer"
		choice[0]="Installation Kstars"
		choice[1]="Installation Kstars développement"
		choice[2]="Installation Indi"
		choice[3]="Installation Indi développement"
		choice[4]="Installation IndiWebManager"
		choice[5]="Installation driver Atik/Inova"
		choice[6]="Installation driver GPS (GPSD)"
		choice[7]="Installation OnStep driver (et Arduino)"
	    choice[8]="Installation des drivers Gphoto2 (version PPA Jasem)"
        choice[9]="installation de astroberry_diy"
		version=`lsb_release -c -s`
        sudo apt-get $options install language-pack-kde-fr
		sudo apt-get -o Dpkg::Options::="--force-overwrite" -f install
	else
		dial[0]="Install/Update of software"
		dial[1]="Choose software(s) to install"
		choice[0]="Install Kstars"
		choice[1]="Install Kstars nightly"
		choice[2]="Install Indi"
		choice[3]="Install Indi nightly"
		choice[4]="Install IndiWebManager"
		choice[5]="Install Atik/Inova driver"
		choice[6]="Install GPS driver (GPSD)"
		choice[7]="Install OnStep driver (and Arduino)"
	    choice[8]="Install Gphoto2 driver (Jasem PPA version)"
        choice[9]="install astroberry_diy"
	    sudo apt-get $options install language-pack-kde-en
		sudo apt-get -o Dpkg::Options::="--force-overwrite" -f install
	fi

	st=(true false true false true true true false true false)

	sudo apt-get $options install gsc
	sudo apt-get $options install libqt5sql5-sqlite qtdeclarative5-dev

	if chose=`yad --width=400 \
		--center \
		--form \
		--title="${dial[0]}" \
		--text="${dial[1]}" \
		--field=":LBL" \
		--field="${choice[0]}:CHK" \
		--field="${choice[1]}:CHK" \
		--field="${choice[2]}:CHK" \
		--field="${choice[3]}:CHK" \
		--field="${choice[4]}:CHK" \
		--field="${choice[5]}:CHK" \
		--field="${choice[6]}:CHK" \
		--field="${choice[7]}:CHK" \
	    --field="${choice[8]}:CHK" \
        --field="${choice[9]}:CHK" \
		"" "${st[0]}" "${st[1]}" "${st[2]}" \
		"${st[3]}" "${st[4]}" "${st[5]}" "${st[6]}" \
	    "${st[7]}" "${st[8]}" "${st[9]}"`
	then
		kstars=$(echo "$chose" | cut -d "|" -f2)
		kstars_dev=$(echo "$chose" | cut -d "|" -f3)
		indi=$(echo "$chose" | cut -d "|" -f4)
		indi_dev=$(echo "$chose" | cut -d "|" -f5)
		indiW=$(echo "$chose" | cut -d "|" -f6)
		driver_3rd=$(echo "$chose" | cut -d "|" -f7)
		gps=$(echo "$chose" | cut -d "|" -f8)
		onstep=$(echo "$chose" | cut -d "|" -f9)
	    gphoto_i=$(echo "$chose" | cut -d "|" -f10)
        astrob=$(echo "$chose" | cut -d "|" -f11)
	else
		echo "cancel"
	fi
fi
######
# Installation du programme : kstars
#              du serveur : indi
#              de tous les drivers
######

if [[ $gphoto_i == "TRUE" ]]
then
    # install PPA version :
    ######
    # Installation de gphoto2
    ######
    sudo add-apt-repository -y ppa:mutlaqja/libgphoto2
    sudo apt-get update
    sudo apt-get -y install libgphoto2-6 libgphoto2-dev libgphoto2-l10n libgphoto2-l10n libgphoto2-port12
fi



if [[ $kstars_dev == "TRUE" ]]
then
	sudo apt-get $options install build-essential cmake git libeigen3-dev libcfitsio-dev zlib1g-dev libindi-dev extra-cmake-modules libkf5plotting-dev libqt5svg5-dev libkf5xmlgui-dev kio-dev kinit-dev libkf5newstuff-dev kdoctools-dev libkf5notifications-dev libkf5crash-dev gettext libnova-dev libgsl-dev libraw-dev libkf5notifyconfig-dev wcslib-dev libqt5websockets5-dev qt5keychain-dev xplanet xplanet-images
	sudo apt-get $options install libusb-1.0-0-dev libjpeg-dev libcurl4-gnutls-dev
	sudo apt-get $options install libftdi-dev libgps-dev libdc1394-22-dev libgphoto2-dev libboost-dev libboost-regex-dev librtlsdr-dev libftdi1-dev libfftw3-dev
	sudo add-apt-repository -y ppa:myriadrf/drivers
	sudo apt-get update
	sudo apt-get $options install liblimesuite-dev

	if [ -d "/home/${USER}/Projects/build/kstars" ]
	then
		echo "Update Kstars Dev"
		cd ~/Projects/kstars
		git pull
		cd ~/Projects/build/kstars
		make
		sudo make install
	else
		# install Kstars dev
		echo "Install Kstars Dev"
		mkdir -p ~/Projects/build/kstars
		cd ~/Projects
		git clone git://anongit.kde.org/kstars.git
		cd ~/Projects/build/kstars
		cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Debug ~/Projects/kstars
		make
		sudo make install
	fi
	indi=true

elif [[ $kstars == "TRUE" ]]
then
	sudo apt-get $options install indi-full kstars-bleeding
	sudo apt-get -o Dpkg::Options::="--force-overwrite" -f install
	sudo apt-get $options install indi-dbg kstars-bleeding-dbg
fi

if [[ $indi_dev == "TRUE" ]]
then
	sudo apt-get $options install build-essential cmake git libeigen3-dev libcfitsio-dev zlib1g-dev libindi-dev extra-cmake-modules libkf5plotting-dev libqt5svg5-dev libkf5xmlgui-dev kio-dev kinit-dev libkf5newstuff-dev kdoctools-dev libkf5notifications-dev libkf5crash-dev gettext libnova-dev libgsl-dev libraw-dev libkf5notifyconfig-dev wcslib-dev libqt5websockets5-dev qt5keychain-dev xplanet xplanet-images
	sudo apt-get $options install libusb-1.0-0-dev libjpeg-dev libcurl4-gnutls-dev
	sudo apt-get $options install libftdi-dev libgps-dev libdc1394-22-dev libgphoto2-dev libboost-dev libboost-regex-dev librtlsdr-dev libftdi1-dev libfftw3-dev
	sudo add-apt-repository -y ppa:myriadrf/drivers
	sudo apt-get update
	sudo apt-get $options install liblimesuite-dev

	if [ -d "/home/${USER}/Projects/build/libindi" ]
	then
		echo "Update Indi Dev"
		cd ~/Projects/indi
		git pull
		cd ~/Projects/build/libindi
		make
		sudo make install
	else
		# install indi dev
		echo "Install Indi Dev"
		mkdir -p ~/Projects
		cd ~/Projects
		git clone https://github.com/indilib/indi.git
		mkdir -p build/libindi
		cd ~/Projects/build/libindi
		cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Debug ~/Projects/indi/libindi
		make
		sudo make install
	fi

	if [ -d "/home/${USER}/Projects/build/3rdparty" ]
	then
		echo "Update Indi3rd Dev"
		cd ~/Projects/indi
		git pull
		cd ~/Projects/build/3rdparty
		make
		sudo make install
	else
		# install indi3rd dev
		echo "Install Indi3rd Dev"
		cd ~/Projects
		mkdir -p build/3rdparty
		cd ~/Projects/build/3rdparty
		cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Debug ~/Projects/indi/3rdparty
		make
		sudo make install
		cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Debug ~/Projects/indi/3rdparty
		make
		sudo make install
	fi
elif [[ $indi == "TRUE" ]]
then
	sudo apt-get $options install indi-full
	sudo apt-get $options install indi-dbg
fi

######
# Installation du web manager pour indi
######
if [[ $indiW == "TRUE" ]]
then
	$dirinstall/install_indiwebmanager.sh
fi
######
# Installation des drivers 3rdparty qui ne sont pas sous forme de dépot
######
if [[ $driver_3rd == "TRUE" ]]
then
	$dirinstall/install_other3rdparty_drivers.sh
fi

######
# Installer le pad amélioré
######
#$dirinstall/install_pad.sh

######
# Installer gpsd
######
if [[ $gps == "TRUE" ]]
then
	$dirinstall/install_gps.sh
fi

######
# Installer onstep
######
if [[ $onstep == "TRUE" ]]
then
	$dirinstall/install_onstep.sh $server_choice
fi

if [[ $astrob == "TRUE" ]]
then
    $dirinstall/install_astroberry_diy.sh
fi


######
# Création de l'icône sur le bureau
######
$dirinstall/install_shortcut.sh kstars 0

######
# Installation du programme de résolution astrométrique
######
sudo apt-get $options install astrometry.net
sudo apt-get -o Dpkg::Options::="--force-overwrite" -f install




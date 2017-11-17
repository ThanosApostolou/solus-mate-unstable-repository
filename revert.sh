#!/bin/bash

#fucntion to determine if package is installed
is_installed() {
	is_installed_string=$(eopkg info -s $1 |grep "\[inst\]")
	if [[ ! -z $is_installed_string ]]
	then
		return 0
	else
		return 1
	fi
} 

# all available packages in my repo:
PackagesArray=(atril \
			   atril-devel \
			   atril-docs \
			   brisk-menu \
			   caja \
			   caja-devel \
			   caja-docs \
			   caja-extensions \
			   caja-extensions-devel \
			   caja-extensions-docs \
			   engrampa \
			   eom \
			   eom-devel \
			   eom-docs \
			   libmatekbd \
			   libmatekbd-devel \
			   libmatekbd-docs \
			   libmateweather \
			   libmateweather-devel \
			   libmateweather-docs \
			   marco \
			   marco-devel \
			   mate-applets \
			   mate-backgrounds \
			   mate-calc \
			   mate-common \
			   mate-control-center \
			   mate-control-center-devel \
			   mate-desktop \
			   mate-desktop-devel \
			   mate-desktop-docs \
			   mate-icon-theme \
			   mate-media \
			   mate-menus \
			   mate-menus-devel \
			   mate-notification-daemon \
			   mate-panel \
			   mate-panel-docs \
			   mate-polkit \
			   mate-polkit-devel \
			   mate-power-manager \
			   mate-screensaver \
			   mate-screensaver-devel \
			   mate-sensors-applet \
			   mate-sensors-applet-devel \
			   mate-session-manager \
			   mate-settings-daemon \
			   mate-settings-daemon-devel \
			   mate-system-monitor \
			   mate-terminal \
			   mate-user-guide \
			   mate-utils \
			   mate-utils-devel \
			   mate-utils-docs \
			   pluma \
			   pluma-devel \
			   pluma-docs)

# remove SolusMateUnstableRepository
sudo eopkg rr SolusMateUnstableRepository
# update repo databases
sudo eopkg ur

# for every available package
for i in $(seq 0 $((${#PackagesArray[@]} - 1)))
do
	package_name=${PackagesArray[i]}
	#if package is installed
	if (is_installed $package_name)
	then
		#reinstall package from the official repositories
		sudo eopkg it --reinstall $package_name
	fi
done

# remove packages not available in official repositories
if (is_installed mate-icon-theme-faenza)
then
	sudo eopkg rm mate-icon-theme-faenza
fi 

echo "It is recommended to logout and login again in order to avoid any problems"

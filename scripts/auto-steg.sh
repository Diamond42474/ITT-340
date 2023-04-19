#!/bin/bash

BANNER="                                                                                               
 @@@@@@   @@@  @@@  @@@@@@@   @@@@@@       @@@@@@   @@@@@@@  @@@@@@@@   @@@@@@@@   @@@@@@      
@@@@@@@@  @@@  @@@  @@@@@@@  @@@@@@@@     @@@@@@@   @@@@@@@  @@@@@@@@  @@@@@@@@@  @@@@@@@@     
@@!  @@@  @@!  @@@    @@!    @@!  @@@     !@@         @@!    @@!       !@@        @@!  @@@     
!@!  @!@  !@!  @!@    !@!    !@!  @!@     !@!         !@!    !@!       !@!        !@!  @!@     
@!@!@!@!  @!@  !@!    @!!    @!@  !@!     !!@@!!      @!!    @!!!:!    !@! @!@!@  @!@  !@!     
!!!@!!!!  !@!  !!!    !!!    !@!  !!!      !!@!!!     !!!    !!!!!:    !!! !!@!!  !@!  !!!     
!!:  !!!  !!:  !!!    !!:    !!:  !!!          !:!    !!:    !!:       :!!   !!:  !!:  !!!     
:!:  !:!  :!:  !:!    :!:    :!:  !:!         !:!     :!:    :!:       :!:   !::  :!:  !:!     
::   :::  ::::: ::     ::    ::::: ::     :::: ::      ::     :: ::::   ::: ::::  ::::: ::     
 :   : :   : :  :      :      : :  :      :: : :       :     : :: ::    :: :: :    : :  :      
                                                                                               
                                                                                               
@@@@@@@@  @@@  @@@  @@@@@@@  @@@@@@@    @@@@@@    @@@@@@@  @@@@@@@   @@@@@@   @@@@@@@          
@@@@@@@@  @@@  @@@  @@@@@@@  @@@@@@@@  @@@@@@@@  @@@@@@@@  @@@@@@@  @@@@@@@@  @@@@@@@@         
@@!       @@!  !@@    @@!    @@!  @@@  @@!  @@@  !@@         @@!    @@!  @@@  @@!  @@@         
!@!       !@!  @!!    !@!    !@!  @!@  !@!  @!@  !@!         !@!    !@!  @!@  !@!  @!@         
@!!!:!     !@@!@!     @!!    @!@!!@!   @!@!@!@!  !@!         @!!    @!@  !@!  @!@!!@!          
!!!!!:      @!!!      !!!    !!@!@!    !!!@!!!!  !!!         !!!    !@!  !!!  !!@!@!           
!!:        !: :!!     !!:    !!: :!!   !!:  !!!  :!!         !!:    !!:  !!!  !!: :!!          
:!:       :!:  !:!    :!:    :!:  !:!  :!:  !:!  :!:         :!:    :!:  !:!  :!:  !:!         
 :: ::::   ::  :::     ::    ::   :::  ::   :::   ::: :::     ::    ::::: ::  ::   :::         
: :: ::    :   ::      :      :   : :   :   : :   :: :: :     :      : :  :    :   : :         
                                                                                               "

INFO="
To use Auto Stego Extractor, put how ever many images you want in a folder.
The images must be of type: .jpg or .png

Make sure you have wget. All other dependencies will be installed by the script.

Next, run this script in the directory that contains the images.

A auto_stego_extractor_output will be generated. Any extracted data will go here!
"
# Colors
RED='\033[0;31m'
NC='\033[0m' # No Color

# Directory containing the image files
DIRECTORY=`pwd` 
OUTPUT_FOLDER="$DIRECTORY/auto_stego_extractor_output/"

#!/bin/bash

# Specify the version of OpenStego to install
version="0.8.6"

# ==================================
# Start Program
# ==================================

echo -e "${RED}$BANNER${NC}"
echo -e "By: Diamond42474\n"
echo -e "$INFO\n\n"

# -----------------------------------
# Check Installs
# -----------------------------------

echo "Checking dependencies..."

# Check if Wget is installed
if ! which wget >/dev/null 2>&1; then
  echo "Wget is not installed. Downloading and installing..."
  sudo apt install wget -y
else
  echo "Wget is already installed."
 fi

# Check if OpenStego is installed
if ! dpkg -s openstego &> /dev/null; then
  echo "OpenStego is not installed. Downloading and installing..."
  wget -q "https://github.com/syvaidya/openstego/releases/download/openstego-$version/openstego_$version-1_all.deb"
  sudo dpkg -i "openstego_$version-1_all.deb"
  sudo apt install -f -y
  rm "openstego_$version-1_all.deb"
  echo "OpenStego $version has been installed."
else
  echo "OpenStego is already installed."
fi

# ----------------------------------
# Start OpenStego Operations
# ----------------------------------

mkdir $OUTPUT_FOLDER
# Loop through files in the directory
for file in "$DIRECTORY"/*.png "$DIRECTORY"/*.jpg; do
  # Check if file exists
  if [ -f "$file" ]; then
    # Display the filename
    java -jar /usr/share/openstego/lib/openstego.jar extract -sf $file -xd $OUTPUT_FOLDER -p ""
  fi
done

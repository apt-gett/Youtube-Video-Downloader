
# Colors
ESC_SEQ="\x1b["
reset=$ESC_SEQ"39;49;00m"
red=$ESC_SEQ"31;01m"
green=$ESC_SEQ"32;01m"
yellow=$ESC_SEQ"33;01m"
blue=$ESC_SEQ"34;01m"
magenta=$ESC_SEQ"35;01m"
cyan=$ESC_SEQ"36;01m"


#install need software
echo ""
echo -e "$green Installing needed tools... Please wait$reset"
echo -e "$green IF an option comes up, select yes and continue installation$reset"
echo ""
sleep 0.5
sudo apt-get install youtube-dl
echo ""
echo -e "$green Done!$reset"
clear

#command to download video
#youtube-dl <insert video link>

#ytdl="$(sudo youtube-dl )"

function welcome() {

  chmod +x ytvdlogo.sh
  ./ytvdlogo.sh
  echo " Please select an option..."
  echo ""
  echo -e "$red [1]$reset Youtube Video Downloader"
  echo -e "$red [2]$reset Youtube Video to Mp3 converter"
  echo ""
  echo -e "$yellow Type 'q' to quit$reset"
  echo ""
}



function ytvdfunc() {

  #ytdl="$(youtube-dl )"

  while : [ $userinput != 1 ]
  do

    read -p " host@ytvd: " userinput

    #error message if user leaves usersinput empty
    if [ -z $userinput ]
    then
      echo ""
      echo -e "$red >> error $reset"
      echo ""

    #if user selects 1
    elif [ $userinput == 1 ]
    then
      clear
      echo ""
      echo -e "$green Insert youtube video link..$reset"
      echo ""
      read -p " host@ytvd: " userlink
      echo ""
      echo -e "$green-Downloading..$reset"
      echo ""
      sudo youtube-dl $userlink
      echo ""
      echo -e "$green-Done!$reset"
      echo ""
      read -p "Press enter to continue.."
      clear
      welcome

    #if userselects 2
    elif [ $userinput == 2 ]
    then
      clear
      echo ""
      echo -e "$green Insert youtube video link..$reset"
      echo ""
      read -p " host@ytvd: " userlink
      echo ""
      echo -e "$green-Downloading..$reset"
      echo ""
      sudo youtube-dl -x --audio-format mp3 $userlink
      echo ""
      echo -e "$green-Done!$reset"
      echo ""
      read -p "Press enter to continue.."
      clear
      welcome

    #if user quits
    elif [ $userinput == "q" ]
    then
      echo ""
      echo -e "$yellow Quitting..$reset"
      echo ""
      sleep 0.3
      exit
    else
      echo ""
      echo -e "$red >> error $reset"
      echo ""
    fi
  done


}


#start of ytvd

welcome
ytvdfunc

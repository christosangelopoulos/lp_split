#! /bin/bash
INPUT=$(zenity --file-selection --height=100 width=100 --title="LP Split - Select Music File to Split"  --window-icon=/usr/share/icons/gnome/24x24/mimetypes/sound.png)
case $? in 
  0)  
  ;; 
  1)  exit
  ;; 
esac
DIRECTORY="${INPUT%/*}"
NAME="${INPUT##*/}"
OUTPUT=$(zenity --entry --height=100 width=300 --title="LP Split " --text="Please enter the new name of the output files (include extension)" --window-icon=/usr/share/icons/gnome/24x24/mimetypes/sound.png)
case $? in 
  0)  
  ;; 
  1)  exit
  ;; 
esac
sox -V3 "$INPUT" "$DIRECTORY"/"$OUTPUT" silence 1 0.50 0.1% 1 2.0 0.1% : newfile : restart
zenity --info --height=100 --width=300 --title="LP Split " --icon-name=sound --text="Splitting of ""$NAME"" is complete!" --window-icon=/usr/share/icons/gnome/24x24/mimetypes/sound.png

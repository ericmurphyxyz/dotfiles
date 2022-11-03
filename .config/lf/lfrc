# Basic Settings
set hidden true
set ignorecase true
set icons true

# Custom Functions
cmd mkdir ${{
  printf "Directory Name: "
  read ans
  mkdir $ans
}}

cmd mkfile ${{
  printf "File Name: "
  read ans
  $EDITOR $ans
}}

cmd setwallpaper %cp "$f" ~/.config/wall.jpg && xwallpaper --zoom "$f"

cmd trash ${{
  trash-put "$f"
}}

# Archive bindings
cmd unarchive ${{
  case "$f" in
      *.zip) unzip "$f" ;;
      *.tar.gz) tar -xzvf "$f" ;;
      *.tar.bz2) tar -xjvf "$f" ;;
      *.tar) tar -xvf "$f" ;;
      *) echo "Unsupported format" ;;
  esac
}}

# Trash bindings
cmd trash ${{
  files=$(printf "$fx" | tr '\n' ';')
  while [ "$files" ]; do
    file=${files%%;*}

    trash-put "$(basename "$file")"
    if [ "$files" = "$file" ]; then
      files=''
    else
      files="${files#*;}"
    fi
  done
}}

cmd restore_trash ${{
  trash-restore
}}

# Bindings
# Remove some defaults
map m
map o
map n
map "'"
map '"'
map d

map c $vscodium "$f"

map au unarchive

# Basic Functions
map . set hidden!
map DD trash
map p paste
map x cut
map y copy
map <enter> open
map R reload
map mf mkfile
map md mkdir
map bg setwallpaper
map C clear

map dd trash
map dr restore_trash

# Movement
map gd cd ~/documents
map gD cd ~/downloads
map gp cd ~/pictures
map gc cd ~/.config
map gr cd ~/repos
map gv cd ~/videos/recordings
map gs cd ~/.local/bin
map gt cd ~/.local/share/Trash/files

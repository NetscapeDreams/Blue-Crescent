# removes broken symlinks

# checks if symlinks tool is installed.
symlinks --help 1>/dev/null 2>/dev/null
exitCode=$(echo $?)
if [[ $exitCode == "127" ]]; then
  echo "Symlinks is not installed, please wait while I install it..."
  ./scripts/installer.sh symlinks
  exitCode=$(echo $?)
  if [[ $exitCode != "0" ]]; then
    echo "An error has occurred with the installation script, we are NOT continuing."
    exit 1
  fi
fi

symlinks -dr /

yad --width="500" --height="100" --title="Blue Crescent | Symlinks" --text="The script has successfully finished." --button=OK:0
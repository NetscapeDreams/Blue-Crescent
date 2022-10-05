![bc](https://user-images.githubusercontent.com/74492478/187731754-384da0ec-b559-4691-a2fd-35c6e4ee6bc8.png)

Blue Crescent version 0.2.1, Written by BurningInfern0

Linux hardening script.

## Compatibility
For now, Blue Crescent only works with most package managers, such as `apt, pacman, dnf, yum, zypper`.

Make sure you have `yad`, a fork of zenity, installed.

## How to run
Simply run `./start.sh -g` to start the program. Command line mode is not complete yet and will be done in a later version.
![image](https://user-images.githubusercontent.com/74492478/193976020-5dd389b4-41c8-4d7d-a190-a30ff8824c45.png)

### What is the "External" column?
If a script has something in that column, it means Blue Crescent requires the use of an external program to complete this script fully.

If the program is not installed, Blue Crescent will install it for you, but only if the installer script supports your system's package manager.

If the program is already installed, Blue Crescent will simply skip the installer script.

## Version History
Version 0.2.1:
- Changed name
- Swapped `zenity` to `yad`
- Shortened script arguments

Version 0.2:
- Added 5 new scripts
  - disableguest.sh
  - disablepingreply.sh
  - disablerootaccess.sh
  - disablesshrootaccess.sh
  - hideprocid.sh
- Removed a small amount of text in some scripts.

Version 0.1:
- Initial Release

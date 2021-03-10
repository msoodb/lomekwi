#!/bin/bash


Graphical User Interface (GUI)
Text User Interface (TUI)
Command-Line Interfaces (CLI)


┌───────────────────────────────────────────────┐
│                       User                    │
│     ┌─────────────────────────────────────────┤
│     │             Application                 │
│     │            ┌──────────┬─────┬─────┬─────┤
│     │            │      ... │ SDL │ GTK │ QT  │
│     │            ├──────────┴─────┴─────┴─────┤
│     │            │            xLib            │
│     │            ├────────────────────────────┤
├─────┴───┬────────┴──┐         X11             │
│   Gnu   │ Libraries │        Server           │
│   Tools │           │                         │
├─────────┘           │                         │ 
├─────────────────────┤                         │
│   Linux (kernel)    │                         │
├─────────────────────┴─────────────────────────┤
│                    Hardware                   │
└───────────────────────────────────────────────┘

# GUI Architecture
┌───────────────────────────────────────────────┐
│               Desktop Environment             │
├───────────────────────────────────────────────┤
│                Windows Manager                │
├───────────────────────────────────────────────┤
│            Display(Login) Manager             │
├───────────────────────────────────────────────┤
│                 Display Server                │
└───────────────────────────────────────────────┘

Desktop Environment: KDE, MATE, GNOME, Cinnamon, Budgie, LXQt, XFCE, Deepin
Window Manager: i3, Awesome WM, XMonad, Openbox, dwm, Gala, KWin
Display(Login) Manager: SLiM, LightDM, CDM, XDM, SDDM
Display Server: Wayland, X11 (X.org), Mir

# Find Desktop and install new Desktop-Environment
env | grep XDG
env | grep XDG_CURRENT_DESKTOP
cat /etc/sysconfig/desktop
sudo dnf grouplist -v
sudo dnf install @xfce-desktop-environment
sudo dnf remove @gnome-desktop


#Localization
Character Sets
-ASCII
-ISO-8859 [1-15]
-Unicode
-UTF
locale
locale -ck LC_MONETARY
localectl
timedatectl


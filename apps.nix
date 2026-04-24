
{ config, lib, pkgs, ... }:

{
  # programs.firefox.enable = true;
    programs.chromium.enable = true;
    programs.bash.enable = true;
    programs.thunar.enable = true;
    programs.git.enable = true;
    programs.thunar.plugins = with pkgs; [
	xfce.thunar-volman
	xfce.thunar-archive-plugin
	xfce.thunar-media-tags-plugin
    ];
    services.gvfs.enable = true;
    #services.playerctld.enable = true;


  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
   environment.systemPackages = with pkgs; [
   	vim
	kdePackages.kate
	wget
#	thunar
#	xfce.thunar-volman
#	thunar-archive-plugin
#	thunar-media-tags-plugin
	xfce.tumbler
	gvfs
	ffmpeg
	vlc
	libvlc
	fastfetch
	openbox
	obconf
	xterm
	xorg.xinit
	neovim
	chromium
	python3
	xwallpaper
	lxappearance
	xbindkeys
	libdvdcss
	xprintidle
	#playerctl
   ];




}

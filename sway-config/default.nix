{stdenv, brightnessctl, i3lock, rofi, termite, libnotify, slack}:

stdenv.mkDerivation rec {
  name = "sway-config";

  phases = [ "installPhase" ];

  src = ./.;

  installPhase = ''
    cp $src/bin $out/bin

    install -d -m755 $out/userHome/.config/sway
    substitute $src/config $out/userHome/.config/sway/config \
      --subst-var-by @out_dir@ $out \
      --subst-var-by @brightnessctl_bin@ ${brightnessctl}/bin/brightnessctl \
      --subst-var-by @pactl_bin@ ${TODO}/bin/pactl \
      --subst-var-by @i3lock_bin@ ${i3lock}/bin/i3lock \
      --subst-var-by @rofi_bin@ ${rofi}/bin/rofi \
      --subst-var-by @termite_bin@ ${termite}/bin/termite \
      --subst-var-by @notify-send_bin@ ${libnotify}/bin/notify-send \
      --subst-var-by @slack_bin@ ${slack}/bin/slack
  '';
}

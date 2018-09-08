{ pkgs }:

let
  vimrc   = pkgs.callPackage ./vimrc.nix {};
  plugins = pkgs.callPackage ./plugins.nix {};
in
{
  customRC = vimrc;
  vam = {
    knownPlugins = pkgs.vimPlugins // plugins;

    pluginDictionaries = [
      # from pkgs.vimPlugins
      { name = "fzfWrapper"; }
      { name = "fzf-vim"; }
      { name = "vim-airline"; }
      { name = "Solarized"; }

      # from our own plugin package set
      { name = "vim-smooth-scroll"; }
    ];
  };
}

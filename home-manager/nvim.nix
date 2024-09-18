{ config, pkgs, neovim-nightly-overlay }: {
  xdg.configFile = {
    "nvim".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/vim";
  };
  programs.neovim = {
    enable = true;
    package = neovim-nightly-overlay.packages.${pkgs.system}.default;
    extraPackages = with pkgs; [
      efm-langserver
      nixd
      nixpkgs-fmt
      vim-language-server
      python3Packages.python-lsp-server
      clang-tools
      texlab
    ];
    defaultEditor = true;
  };

}

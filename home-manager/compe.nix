{ pkgs, qitoypkgs }: {
  home.packages = [
    qitoypkgs.cargo-compete
    qitoypkgs.cargo-equip
    pkgs.python3Packages.online-judge-tools
    pkgs.python3Packages.online-judge-api-client
    qitoypkgs.online-judge-verify-helper
  ];
}

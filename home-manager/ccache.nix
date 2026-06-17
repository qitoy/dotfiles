{
  pkgs,
  ...
}: {
  home.packages = [ pkgs.ccache ];
  home.sessionVariables = {
    USE_CCACHE = 1;
    NDK_CCACHE = "${pkgs.ccache}/bin/ccache";
    CCACHE_CPP2 = "yes";
    CCACHE_COMPILERCHECK = "content";
  };
}

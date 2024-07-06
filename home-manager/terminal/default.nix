{ ... }: {
  programs.alacritty = {
    enable = true;
    settings = {
      import = [ (toString ./starlight.toml) ];
      window = {
        dimensions = { columns = 40; lines = 25; };
        opacity = 0.85;
      };
      font = {
        normal = { family = "MoralerspaceNeonNF"; style = "Regular"; };
        size = 12.5;
      };
    };
  };
}

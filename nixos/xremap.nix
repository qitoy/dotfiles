{
  services.xremap = {
    enable = true;
    withWlroots = true;
    watch = true;
    config = {
      modmap = [
        {
          remap.Space = {
            held = "Shift_L";
            alone = "Space";
          };
        }
      ];
      keymap = [
        {
          remap = {
            Yen = "Dollar";
            Shift-Yen = "Shift-Grave";
          };
        }
      ];
    };
  };
}

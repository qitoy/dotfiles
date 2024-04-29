{ inputs, ... }: {
  imports = [
    inputs.xremap.homeManagerModules.default
  ];
  services.xremap = {
    withWlroots = true;
    watch = true;
    config = {
      modmap = [{
        remap.Space = {
          held = "Shift_L";
          alone = "Space";
        };
      }];
      keymap = [{
        remap = {
          Yen = "Dollar";
          Shift-Yen = "Shift-Grave";
        };
      }];
    };
  };
}

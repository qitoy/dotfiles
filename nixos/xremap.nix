{ username, ... }:
{
  services.xremap = {
    enable = true;
    withNiri = true;
    watch = true;
    serviceMode = "user";
    userName = username;
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

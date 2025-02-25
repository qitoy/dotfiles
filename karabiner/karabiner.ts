import * as k from "karabiner.ts";

k.writeToProfile("Default profile", [
  k.rule("JIS as US")
    .manipulators([
      k.map({ key_code: "international3", modifiers: { optional: ["any"] } })
        .to({ key_code: "grave_accent_and_tilde" }),
    ]),

  k.rule("SandS")
    .manipulators([
      k.map({ key_code: "spacebar" })
        .to({ key_code: "left_shift" })
        .toIfAlone({ key_code: "spacebar" }),
    ]),
]);

#!/usr/bin/env -S deno run -A
import Dfm from "https://deno.land/x/dfm@v0.10/mod.ts";
import {
	Repository,
	Shell,
	Symlink,
} from "https://deno.land/x/dfm@v0.10/plugin/mod.ts";
import { os } from "https://deno.land/x/dfm@v0.10/util/mod.ts";
import { fromFileUrl } from "https://deno.land/std@0.170.0/path/mod.ts";

const dfm = new Dfm({
	dotfilesDir: "~/dotfiles",
	dfmFilePath: fromFileUrl(import.meta.url),
});

const links: [string, string][] = [
    ["latexmkrc", "~/.latexmkrc"],
    ["w3m", "~/.w3m"],
    ["vim", "~/.vim"],
    ["vim", "~/.config/nvim"],
    ["vimrc", "~/.vimrc"],
    ["zprofile", "~/.zprofile"],
    ["zshrc", "~/.zshrc"],
    ["gitmessage", "~/.gitmessage"],
    ["config/wezterm", "~/.config/wezterm"],
    ["config/powerline-shell", "~/.config/powerline-shell"],
    ["config/git", "~/.config/git"],
];

const cmds: string[] = [
    "vim",
];

const path: string[] = [];

if(os() == "darwin") {
    links.push(
        ["hammerspoon", "~/.hammerspoon"],
        ["config/karabiner", "~/.config/karabiner"],
    );
	path.push();
} else if(os() == "linux") {
    links.push(
        ["config/systemd", "~/.config/systemd"],
        ["config/i3", "~/.config/i3"],
        ["config/sway", "~/.config/sway"],
        ["config/swaylock", "~/.config/swaylock"],
        ["config/waybar", "~/.config/waybar"],
    )
	path.push(
        "~/.deno/bin",
    );
}

dfm.use(
	new Symlink(dfm, links),
	new Shell({
        env_path: "~/.cache/env",
		cmds,
		path,
	}),
	new Repository(dfm),
);

dfm.end();

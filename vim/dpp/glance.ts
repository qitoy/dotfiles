import MarkdownIt from "npm:markdown-it@14.1.0";
import Shiki from "npm:@shikijs/markdown-it@1.11.1";
import { katex } from "npm:@mdit/plugin-katex@0.12.0";

const shiki = await Shiki({
  themes: {
    light: "github-light",
  },
});

export function createMarkdownRenderer(md: MarkdownIt): MarkdownIt {
  return md.use(shiki).use(katex);
}

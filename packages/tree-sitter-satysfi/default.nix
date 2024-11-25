{ tree-sitter, source }: tree-sitter.buildGrammar {
  language = "satysfi";
  inherit (source) version src;
}

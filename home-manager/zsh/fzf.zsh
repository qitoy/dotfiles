function fzf-cdr() {
  local selected_dir=$(\cdr -l | awk '{print $2}' | fzf)
  selected_dir=${selected_dir/\~/$HOME}
  if [ -n "$selected_dir" ]; then
    cd "$selected_dir"
  fi
}

function fzf-ghq() {
  local repo=$(ghq list | fzf)
  if [ -n "$repo" ]; then
    cd $(ghq root)/$repo
  fi
}

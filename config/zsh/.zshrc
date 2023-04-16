foreach file (
  load.zsh
  exports.zsh
  plugins.zsh
  prompt_style.zsh
  settings.zsh
  aliases.zsh
  mappings.zsh
) {
  source $ZDOTDIR/config/$file
}
unset file

foreach file (
  load.zsh
  exports.zsh
  prompt.zsh
  settings.zsh
  aliases.zsh
  mappings.zsh
  plugins.zsh
) {
  source $ZDOTDIR/config/$file
}
unset file

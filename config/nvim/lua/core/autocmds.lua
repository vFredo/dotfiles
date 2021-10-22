local create_autocommands = require("core.utils").create_autocommands

local autocmds = {
  packer = {
    { "BufWritePost", "*.lua", "source <afile> | PackerCompile" };
  };
  format_options = {
    { "FileType", "*", "set fo-=c fo-=r fo-=o fo+=j fo+=n" };
  };
  terminal_job = {
    { "TermOpen", "*", "startinsert" };
    { "TermOpen", "*", "setlocal listchars= nonumber norelativenumber" };
  };
  restore_cursor = {
    { 'BufRead', '*', [[call setpos(".", getpos("'\""))]] };
  };
  responsive_window_size = {
    { "VimResized", "*", ":wincmd =" };
  };
  highlight_yank = {
    {
      "TextYankPost", "*",
      [[silent! lua vim.highlight.on_yank() {higroup="IncSearch", timeout=400}]]
    };
  };
}

-- Creating all autocommands
create_autocommands(autocmds)

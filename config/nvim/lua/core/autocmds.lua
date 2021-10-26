local create_autocommands = require("core.utils").create_autocommands

local autocmds = {
  general_options = {
    { "FileType", "*", "set fo-=c fo-=r fo-=o fo+=j fo+=n" }; -- format options
    { "VimResized", "*", ":wincmd =" }; -- responsive panel/window size
    { 'BufRead', '*', [[call setpos(".", getpos("'\""))]] }; -- restore cursor pos
  };
  unique_filetypes = {
    { "BufWritePost", "*.lua", "source <afile> | PackerCompile" };
    { "FileType", "NeogitCommitMessage", "lua require('core.utils').toggleSpelling('ft')" };
  };
  terminal_job = {
    { "TermOpen", "*", "startinsert" };
    { "TermOpen", "*", "setlocal listchars= nonumber norelativenumber" };
  };
  highlight_yank = {
    {
      "TextYankPost", "*",
      [[silent! lua vim.highlight.on_yank() {higroup="IncSearch", timeout=500}]]
    };
  };
}

-- Creating all autocommands
create_autocommands(autocmds)

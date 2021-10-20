local lsp = require("lspconfig")
local coq = require("coq")

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)

  -- if the server client can format files then format on save
  if client.resolved_capabilities.document_formatting then
    vim.cmd([[ autocmd! BufWritePre <buffer> lua vim.lsp.buf.formatting(nil, 1000) ]])
  end
end

local lsp_installer = require("nvim-lsp-installer")

local checkInstall = function ()
  local lsp_installer_servers = require('nvim-lsp-installer.servers')
  local servers = { 'clangd', 'gopls', 'html', 'jsonls', 'tsserver', 'pyright', 'cssls', 'bashls', 'volar', 'sumneko_lua' }

  for _, currServer in ipairs(servers) do
    local ok, server =  lsp_installer_servers.get_server(currServer)
    if ok then
      if not server:is_installed() then
        server:install()
      end
    end
  end
end

lsp_installer.on_server_ready(function(server)
  checkInstall()

  local opts = {
    on_attach = on_attach,
    capabilities = coq.lsp_ensure_capabilities(vim.lsp.protocol.make_client_capabilities()),
  }

  if server.name == "gopls" then
    opts.cmd = { 'gopls' }
    opts.settings = {
      gopls = {
        experimentalPostfixCompletions = true,
        analyses = {
          unusedparams = true,
          shadow = true,
        },
        staticcheck = true,
      }
    }
  end
  server:setup(opts)
  vim.cmd [[ do User LspAttachBuffers ]]
end)

-- replace the default lsp diagnostic symbols
local function lspSymbol(name, icon)
   vim.fn.sign_define("LspDiagnosticsSign" .. name, { text = icon, numhl = "LspDiagnosticsDefaul" .. name })
end

lspSymbol("Error", "")
lspSymbol("Information", "")
lspSymbol("Hint", "")
lspSymbol("Warning", "")

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = { prefix = "", spacing = 4, },
    signs = true,
    underline = true,
    update_in_insert = false, -- don't update diagnostics in insert mode
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
   border = "single",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
   border = "single",
})

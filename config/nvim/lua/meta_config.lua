local meta = require("meta")

-- Keybinds
vim.api.nvim_set_keymap(
  "n",
  "<leader>p",
  [[<cmd>Telescope myles<CR>]],
  { noremap = true, silent = true }
)

-- Local LSP Configs
-- This imports ~/.config/nvim/lua/lsp.lua or ~/.config/nvim/lua/lsp/init.lua.
local lsp_util = require("lsp")
-- This imports `lua/lspconfig/init.lua` from the nvim-lspconfig plugin.
local nvim_lsp = require("lspconfig")

-- Enable Meta specific commands like e.g. MetaDiffOpenFiles, GetCodehubLink
require("meta.cmds")

-------------------------------------------------------------------------------
-- LSP server configuration
-------------------------------------------------------------------------------
local servers = {
  --"rusty@meta",
  "pyls@meta",
  "wasabi@meta",
  "pyre@meta",
  "thriftlsp@meta",
  "cppls@meta",
  "buckls@meta",
  "erlang@meta",
  "gopls@meta",
}
for _, lsp in ipairs(servers) do
  require("lspconfig")[lsp].setup {
    on_attach = on_attach,
    capabilities = lsp_util.capabilities,
    print_meta_ls_statuses_to_messages = false,
  }
end

-- Start a language server client from a native lspconfig config.
nvim_lsp["flow"].setup({
  cmd = { "flow", "lsp" },
  on_attach = lsp_util.on_attach,
  capabilities = lsp_util.capabilities,
})

nvim_lsp["hhvm"].setup({
  on_attach = lsp_util.on_attach,
  capabilities = lsp_util.capabilities,
})

-------------------------------------------------------------------------------
-- Null LS configuration
-------------------------------------------------------------------------------
-- This imports `lua/null-ls/init.lua` from the null-ls plugin.
local null_ls = require("null-ls")

-- Register allows you to add more null-ls sources after having already called
null_ls.setup({
  on_attach = lsp_util.on_attach,
  sources = {
    null_ls.builtins.formatting.trim_whitespace,
    null_ls.builtins.formatting.trim_newlines,
      meta.null_ls.diagnostics.arclint,
      meta.null_ls.formatting.arclint,
  },
})

-------------------------------------------------------------------------------
-- Tree sitter configuration
-------------------------------------------------------------------------------
require("nvim-treesitter.install").prefer_git = true
require("nvim-treesitter.install").command_extra_args = {
    curl = { "--proxy", "http://fwdproxy:8080" },
}

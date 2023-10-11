-- (c) Meta Platforms, Inc. and affiliates. Confidential and proprietary.

-- @lint-ignore-every LUA_LUAJIT

-- This imports /usr/share/fb-editor-support/nvim/lua/meta/init.lua
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

-- Setup language server clients from the neovim@meta plugin.
-- These will only autostart on the corresponding filetypes, iow you don't need
-- to gate these behind a filetype check.
local servers = {
  "rust-analyzer@meta",
  "pyls@meta",
  "wasabi@meta",
  "pyre@meta",
  "thriftlsp@meta",
  "cppls@meta",
  "buckls@meta",
  "buck2@meta",
  "erlang@meta",
  "gopls@meta",
}
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup({
    on_attach = lsp_util.on_attach,
    capabilities = lsp_util.capabilities,
    print_meta_ls_statuses_to_messages = false,
  })
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

-- null-ls configs
-- This imports `lua/null-ls/init.lua` from the null-ls plugin.
local null_ls = require("null-ls")
local on_attach = function(client, bufnr)
    if client.resolved_capabilities.document_formatting then
        vim.cmd([[
        augroup LspFormatting
            autocmd! * <buffer>
            autocmd BufWritePre <buffer> silent noa w | lua vim.lsp.buf.formatting_sync(nil, 30000)
        augroup END
        ]])
    end
end

null_ls.setup({
    on_attach = on_attach,
    sources = {
        meta.null_ls.diagnostics.arclint,
        meta.null_ls.formatting.arclint,
    }
})

-- Treesitter configs
require("nvim-treesitter.install").prefer_git = true
require("nvim-treesitter.install").command_extra_args = {
  curl = { "--proxy", "http://fwdproxy:8080" },
}

-- Metamate
require('meta.metamate').init()

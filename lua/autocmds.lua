require 'nvchad.autocmds'

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd('BufWritePost', {
  pattern = '*.md',
  command = 'MarkdownPreview',
})

-- ID for the autocmd group so we can clear it later
local hover_augroup = vim.api.nvim_create_augroup('LspAutoHover', { clear = true })

-- <leader>us → Set up auto hover
vim.keymap.set('n', '<leader>ie', function()
  vim.api.nvim_create_autocmd('CursorHold', {
    group = hover_augroup,
    pattern = '*',
    callback = function()
      vim.lsp.buf.hover()
    end,
    desc = 'Auto hover on CursorHold',
  })
  print '🟢 Auto hover enabled'
end, { desc = 'Enable LSP hover on CursorHold' })

-- <leader>ur → Unset auto hover
vim.keymap.set('n', '<leader>id', function()
  vim.api.nvim_clear_autocmds { group = hover_augroup }
  print '🔴 Auto hover disabled'
end, { desc = 'Disable LSP hover on CursorHold' })

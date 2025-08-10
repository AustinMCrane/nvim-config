-- Gitlinker
vim.api.nvim_set_keymap('n', '<leader>gY', '<cmd>lua require"gitlinker".get_repo_url()<cr>', { silent = true })
vim.api.nvim_set_keymap(
  'n',
  '<leader>gB',
  '<cmd>lua require"gitlinker".get_repo_url({action_callback = require"gitlinker.actions".open_in_browser})<cr>',
  { silent = true }
)

-- Telescope
vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, { desc = '[G]oto [R]eferences' })
vim.keymap.set('n', 'gI', require('telescope.builtin').lsp_implementations, { desc = '[G]oto [I]mplementation' })
vim.keymap.set('n', 'gd', require('telescope.builtin').lsp_definitions, { desc = '[G]oto [D]Definition' })

vim.api.nvim_set_keymap('n', 'nn', '<cmd>lua require("codecompanion").chat()<cr>', { desc = '[C]ode [N]ew Chat' })
-- vim.cmd.command('Chat', 'lua require("codecompanion").chat()')

--local builtin = require('telescope.builtin')
--vim.keymap.set('n', 'ff', builtin.find_files, {})
--vim.keymap.set('n', 'fg', builtin.live_grep, {})
--vim.keymap.set('n', 'fb', builtin.buffers, {})
--vim.keymap.set('n', 'fh', builtin.help_tags, {})

--require('telescope').setup()

--vim.keymap.set('n', 'ff', ':Telescope find_files<CR>')

-- Charge le module Telescope
local telescope = require('telescope')

-- Charge le module file_browser
local file_browser = require('telescope.builtin')

-- Configuration pour permettre d'accéder aux dossiers précédents
telescope.setup {
  defaults = {
    file_ignore_patterns = {"node_modules", ".git", "venv"} -- Ignorer certains fichiers/dossiers
  }
}

-- Définition de la fonction find_files
_G.find_files = function()
  -- Récupère le chemin du dossier parent du dossier parent du dossier parent du fichier actuel
  local parent_dir = vim.fn.fnamemodify(vim.fn.expand('%:p:h:h:h'), ':p')
  -- Ouvre le file browser
  file_browser.find_files({ cwd = parent_dir })
end

-- Associe la commande `ff` à la fonction find_files
vim.keymap.set('n', 'ff', '<cmd>lua find_files()<CR>')


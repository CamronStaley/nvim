return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.6', -- Updated to slightly newer tag, or use branch = '0.1.x'

  dependencies = {
    'nvim-lua/plenary.nvim',
    -- KICKSTART STANDARD: FZF is essential for fast sorting
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make', -- Requires 'make' and 'gcc' installed on your system
    },
    -- Optional: Sets the UI for things like Code Actions to use Telescope
    { 'nvim-telescope/telescope-ui-select.nvim' },
  },

  config = function()
    -- Get access to telescope handles
    local telescope = require 'telescope'
    local actions = require 'telescope.actions'

    telescope.setup {
      defaults = {
        -- Common Kickstart setting: mappings in insert mode
        mappings = {
          i = {
            -- ['<C-u>'] = false,
            -- ['<C-d>'] = false,
          },
        },
      },
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
    }

    -- Enable Telescope Extensions if they are installed
    pcall(telescope.load_extension, 'fzf')
    pcall(telescope.load_extension, 'ui-select')

    local builtin = require 'telescope.builtin'

    -- === YOUR EXISTING KEYMAPS (Primeagen Style) ===
    vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = '[P]roject [F]iles' })
    vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Search Git Files' })

    vim.keymap.set('n', '<leader>pws', function()
      local word = vim.fn.expand '<cword>'
      builtin.grep_string { search = word }
    end, { desc = '[P]roject [W]ord [S]earch' })

    vim.keymap.set('n', '<leader>pWs', function()
      local word = vim.fn.expand '<cWORD>'
      builtin.grep_string { search = word }
    end, { desc = '[P]roject [W]ORD [S]earch' })

    vim.keymap.set('n', '<leader>ps', function()
      builtin.grep_string { search = vim.fn.input 'Grep > ' }
    end, { desc = '[P]roject [S]earch (Grep)' })

    vim.keymap.set('n', '<leader>vh', builtin.help_tags, { desc = '[V]im [H]elp' })

    -- === NEW: LSP KEYMAPS (The "Kickstart" definition jumping) ===
    -- These allow you to jump to definition using Telescope

    vim.keymap.set('n', 'gd', builtin.lsp_definitions, { desc = '[G]oto [D]efinition' })
    vim.keymap.set('n', 'gr', builtin.lsp_references, { desc = '[G]oto [R]eferences' })
    vim.keymap.set('n', 'gi', builtin.lsp_implementations, { desc = '[G]oto [I]mplementation' })

    -- Optional: Lists symbols in the current buffer (like functions/variables)
    vim.keymap.set('n', '<leader>ds', builtin.lsp_document_symbols, { desc = '[D]ocument [S]ymbols' })
  end,
}

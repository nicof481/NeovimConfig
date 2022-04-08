-- ROOT CONFIG

require('settings')
require('plugins')
require('functions')

-- PLUGIN CONFIGS
require('nvim-treesitter.configs').setup { rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil
    }
}
require('indent_blankline').setup { filetype = {'java', 'lua', 'r'}}
require('telescope').setup { defaults = { mappings = { i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false
    }}}
}

-- MAPPINGS

local opts = { noremap = true, silent = true }
map('.', '', {nowait = true})
vim.g.mapleader = '.'

-- general
map('j','<Left>', opts)
map('k','<Down>', opts)
map('l','<Up>', opts)
map(';','<Right>', opts)
nmap('<A-j>', '<C-w>h', opts)
nmap('<A-k>', '<C-w>j', opts)
nmap('<A-l>', '<C-w>k', opts)
nmap('<A-;>', '<C-w>l', opts)
nmap('<A-S-j>', '<C-W>H', opts)
nmap('<A-S-k>', '<C-W>J', opts)
nmap('<A-S-l>', '<C-W>K', opts)
nmap('<A-S-;>', '<C-W>L', opts)
nmap('<A-Right>', '<cmd>:vertical resize +1<CR>', opts)
nmap('<A-Down>', '<cmd>:resize -1<CR>', opts)
nmap('<A-Up>', '<cmd>:resize +1<CR>', opts)
nmap('<A-Left>', '<cmd>:vertical resize -1<CR>', opts)
imap('<A-j>', '<C-\\><C-n><C-w>h', opts)
imap('<A-k>', '<C-\\><C-n><C-w>j', opts)
imap('<A-l>', '<C-\\><C-n><C-w>k', opts)
imap('<A-;>', '<C-\\><C-n><C-w>l', opts)
imap('<A-S-j>', '<C-\\><C-n><C-W>H', opts)
imap('<A-S-k>', '<C-\\><C-n><C-W>J', opts)
imap('<A-S-l>', '<C-\\><C-n><C-W>K', opts)
imap('<A-S-;>', '<C-\\><C-n><C-W>L', opts)
tmap('<A-j>', '<C-\\><C-n><C-w>h', opts)
tmap('<A-k>', '<C-\\><C-n><C-w>j', opts)
tmap('<A-l>', '<C-\\><C-n><C-w>k', opts)
tmap('<A-;>', '<C-\\><C-n><C-w>l', opts)
tmap('<A-S-j>', '<C-\\><C-n><C-W>H', opts)
tmap('<A-S-k>', '<C-\\><C-n><C-W>J', opts)
tmap('<A-S-l>', '<C-\\><C-n><C-W>K', opts)
tmap('<A-S-;>', '<C-\\><C-n><C-W>L', opts)
timap('kl','<C-\\><C-n>', opts)


nmap('<leader>cd', '<cmd>:cd %:p:h<CR><cmd>:pwd<CR>', opts)
nmap('<leader>pwd', '<cmd>:pwd<CR>', opts)

--terminal
nmap('<leader>t', '<cmd>:split term://zsh<CR><C-W>Ji', opts)

-- nerdtree
nmap('<leader>n', '<cmd>:NERDTreeToggle<CR>', opts)

-- telescope
nmap('<leader><space>', [[<cmd>lua require('telescope.builtin').buffers()<CR>]], opts)
nmap('<leader>sf', [[<cmd>lua require('telescope.builtin').find_files({hidden = true})<CR>]], opts)
nmap('<leader>sb', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]], opts)
nmap('<leader>sh', [[<cmd>lua require('telescope.builtin').help_tags()<CR>]], opts)
nmap('<leader>st', [[<cmd>lua require('telescope.builtin').tags()<CR>]], opts)
nmap('<leader>sd', [[<cmd>lua require('telescope.builtin').grep_string()<CR>]], opts)
nmap('<leader>sp', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], opts)
nmap('<leader>so', [[<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }<CR>]], opts)
nmap('<leader>?', [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]], opts)

-- diagnostics
nmap('<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', {silent = true})
nmap('<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', {silent = true})
nmap(']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', {silent = true})
nmap('[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', {silent = true})

--lsp
on_attach = function(_, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    lspmap(bufnr, 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
    lspmap(bufnr, 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
    lspmap(bufnr, 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
    lspmap(bufnr, 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
    lspmap(bufnr, 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
    --lspmap(bufnr, '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
    lspmap(bufnr, '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>')
    lspmap(bufnr, '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>')
    lspmap(bufnr, '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>')
    lspmap(bufnr, '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
    lspmap(bufnr, '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
    lspmap(bufnr, '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>')
    lspmap(bufnr, '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>')
end

require('lsp')





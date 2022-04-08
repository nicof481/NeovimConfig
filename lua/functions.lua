
t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local nvim_map = vim.api.nvim_set_keymap
local buf_map = vim.api.nvim_buf_set_keymap
map = function(key, command, opts)
    nvim_map('n', key, command, opts)
    nvim_map('v', key, command, opts)
    nvim_map('o', key, command, opts)
end
nmap = function(key, command, opts)
    nvim_map('n', key, command, opts)
end
imap = function(key, command, opts)
    nvim_map('i', key, command, opts)
end
vmap = function(key, command, opts)
    nvim_map('v', key, command, opts)
end
tmap = function(key, command, opts)
    nvim_map('t', key, command, opts)
end
timap = function(key, command, opts)
    nvim_map('t', key, command, opts)
    nvim_map('i', key, command, opts)
end
bufmap = function(key, command, opts)
    buf_map(0, 'n', key, command, opts)
    buf_map(0, 'v', key, command, opts)
    buf_map(0, 'o', key, command, opts)
end
nbufmap = function(key, command, opts)
    buf_map(0, 'n', key, command, opts)
end
ibufmap = function(key, command, opts)
    buf_map(0, 'i', key, command, opts)
end
vbufmap = function(key, command, opts)
    buf_map(0, 'v', key, command, opts)
end

lspmap = function(bufnr, key, command)
    buf_map(bufnr, 'n', key, command, {noremap = true, silent = true})
end


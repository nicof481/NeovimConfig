-- AUTOMATICALLY APPEND CLOSING CHARACTERS
_G.smart_close = function(char)
    if vim.fn.strpart(vim.fn.getline('.'), vim.fn.col('.')-1, 1) == char then
        return t'<Right>'
    else
        return char
    end
end

_G.undo_brackets = function()
    local open = vim.fn.strpart(vim.fn.getline('.'), vim.fn.col('.')-2, 1)
    local close = vim.fn.strpart(vim.fn.getline('.'), vim.fn.col('.')-1, 1)

    if open == "(" and close == ")" or open == "{" and close == "}" or open == "[" and close == "]" then
        return t'<BS><Del>'
    else
        return t'<BS>'
    end

end

local opts = {noremap = true, silent = true}
local expr_opts = {noremap = true, expr = true}

ibufmap('{', '{}<Left>', opts)
ibufmap('{{', '{', opts)
ibufmap('{}', '{}', opts)
ibufmap('{<CR>', '{<CR>}<Esc>O', opts)
ibufmap('}', 'v:lua.smart_close("}")', expr_opts)


ibufmap('(', '()<Left>', opts)
ibufmap('((', '(', opts)
ibufmap('()', '()', opts)
ibufmap(')', 'v:lua.smart_close(")")', expr_opts)

ibufmap('[', '[]<Left>', opts)
ibufmap('[[', '[', opts)
ibufmap('[]', '[]', opts)
ibufmap(']', 'v:lua.smart_close("]")', expr_opts)


ibufmap('\'', 'v:lua.smart_close("\'")', expr_opts)
ibufmap('"', 'v:lua.smart_close(\'"\')', expr_opts)



ibufmap('<BS>', 'v:lua.undo_brackets()', expr_opts)




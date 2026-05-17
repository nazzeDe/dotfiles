vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.clipboard = "unnamedplus"

vim.pack.add({
    -- Tree-sitter 核心
    "https://github.com/nvim-treesitter/nvim-treesitter",
    -- Tokyo Night 主题
    "https://github.com/folke/tokyonight.nvim",
    -- 自动括号
    "https://github.com/windwp/nvim-autopairs",
    -- 自动切输入法
    "https://github.com/h-hg/fcitx.nvim"
})

require("nvim-autopairs").setup({})


vim.api.nvim_create_autocmd('PackChanged', {
    callback = function(ev)
        if ev.data.kind == 'update' and ev.data.spec.name == 'nvim-treesitter' then
            vim.cmd('TSUpdate')
        end
    end,
})

-- 设置主题
vim.cmd[[colorscheme tokyonight-night]]

call plug#begin()
Plug 'nvim-lualine/lualine.nvim'
" If you want to have icons in your statusline choose one of these
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'neovim/nvim-lspconfig' 
Plug 'hrsh7th/nvim-cmp'
Plug 'sindrets/diffview.nvim'
Plug 'akinsho/bufferline.nvim', { 'tag': 'v3.*' }
Plug 'nvim-tree/nvim-tree.lua'
Plug 'https://github.com/hashivim/vim-terraform'
Plug 'numToStr/Comment.nvim'
Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}
Plug 'folke/which-key.nvim', {'tag' : '*'}
call plug#end()

lua <<EOF
vim.g.mapleader = " "
EOF

setlocal ts=4 sts=4 sw=4 expandtab
" YAML
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
let g:indentLine_char = '⦙'

" YAML
autocmd FileType tf setlocal ts=2 sts=2 sw=2 expandtab
let g:indentLine_char = '⦙'

" Enter new line
map <Enter> o<ESC>
map <S-Enter> O<ESC>

set termguicolors

lua <<EOF
    require('lualine').setup()
    require("telescope").load_extension "file_browser"

    -- NEOTREE setup
    -- disable netrw at the very start of your init.lua (strongly advised)
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- set termguicolors to enable highlight groups
    vim.opt.termguicolors = true
EOF

" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fr <cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>

" Sync clipboard
set clipboard=unnamedplus

" Terraform
lua <<EOF
  require'lspconfig'.terraformls.setup{}
EOF
autocmd BufWritePre *.tfvars lua vim.lsp.buf.format()
autocmd BufWritePre *.tf lua vim.lsp.buf.format()

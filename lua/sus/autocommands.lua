-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})


-- -- [[ NANI??? ]]
-- 
-- local augroup = vim.api.nvim_create_augroup
-- Sus = augroup('Sus', {})
-- 
-- local autocmd = vim.api.nvim_create_autocmd
-- local yank_group = augroup('HighlightYank', {})
-- 
-- function R(name)
--     require("packer.reload").reload_module(name)
-- end
-- 
-- autocmd('TextYankPost', {
--     group = yank_group,
--     pattern = '*',
--     callback = function()
--         vim.highlight.on_yank({
--             higroup = 'IncSearch',
--             timeout = 40,
--         })
--     end,
-- })
-- 
-- autocmd({"BufWritePre"}, {
--     group = Sus,
--     pattern = "*",
--     command = "%s/\\s\\+$//e",
-- })
-- 
-- -- [[ WHAT THE FUCK!!! ]]
-- 
-- vim.api.nvim_create_autocmd({ "FileType" }, {
-- 	pattern = { "qf", "help", "man", "lspinfo", "spectre_panel" },
-- 	callback = function()
-- 		vim.cmd([[
--       nnoremap <silent> <buffer> q :close<CR> 
--       set nobuflisted 
--     ]])
-- 	end,
-- })
-- 
-- vim.api.nvim_create_autocmd({ "FileType" }, {
-- 	pattern = { "markdown" },
-- 	callback = function()
-- 		vim.opt_local.wrap = true
-- 		vim.opt_local.spell = true
-- 	end,
-- })
-- 
-- vim.api.nvim_create_autocmd({ "VimResized" }, {
-- 	callback = function()
-- 		vim.cmd("tabdo wincmd =")
-- 	end,
-- })
-- 
-- -- vim.api.nvim_create_autocmd({ "CmdWinEnter" }, {
-- -- 	callback = function()
-- -- 		vim.cmd("quit")
-- -- 	end,
-- -- })
-- 
-- vim.api.nvim_create_autocmd({ "TextYankPost" }, {
-- 	callback = function()
-- 		vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })
-- 	end,
-- })
-- 
-- vim.api.nvim_create_autocmd({ "VimEnter" }, {
-- 	callback = function()
-- 		vim.cmd("hi link illuminatedWord LspReferenceText")
-- 	end,
-- })

-- let g:arduino_use_slime = 1
-- vim.g.arduino_use_slime = 1

vim.keymap.set('n', '<leader>aa', ":ArduinoAttach<CR>")
vim.keymap.set('n', '<leader>am', ":ArduinoVerify<CR>")
vim.keymap.set('n', '<leader>au', ":ArduinoUpload<CR>")
vim.keymap.set('n', '<leader>ad', ":ArduinoUploadAndSerial<CR>")
vim.keymap.set('n', '<leader>ab', ":ArduinoChooseBoard<CR>")
vim.keymap.set('n', '<leader>ap', ":ArduinoChooseProgrammer<CR>")

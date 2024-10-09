vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Map ]tt to run sfdx apex:run:test
vim.keymap.set('n', ']tt', [[:!sfdx apex:run:test -y -c -r human -w 5 -t "%:t:r"]]..'"', { silent = true, noremap = true })

-- Map ]a to run sfdx project:deploy:start
vim.keymap.set('n', ']a', [[:!sfdx project:deploy:start]], { silent = true, noremap = true })

-- Map ]af to run sfdx project:deploy:start -c
vim.keymap.set('n', ']af', [[:!sfdx project:deploy:start -c]], { silent = true, noremap = true })

-- Map ]u to run sfdx project:retrieve:start
vim.keymap.set('n', ']u', [[:!sfdx project:retrieve:start]], { silent = true, noremap = true })

-- Map ]uf to run sfdx project:retrieve:start -c
vim.keymap.set('n', ']uf', [[:!sfdx project:retrieve:start -c]], { silent = true, noremap = true })

-- Map ]d to run sfdx project:deploy:start -d "%" -l NoTestRun -w 5 -o
vim.keymap.set('n', ']d', [[:!sfdx project:deploy:start -d "%" -l NoTestRun -w 5 -o]], { silent = true, noremap = true })

-- Map ]dd to run sfdx project:deploy:start -d "%" -l NoTestRun -w 5
vim.keymap.set('n', ']dd', [[:tabnew | read !sfdx project:deploy:start -d "%" -l NoTestRun -w 5]], { silent = true, noremap = true })

-- Map ]e to open a new tab and run sfdx apex:run
vim.keymap.set('n', ']e', [[:tabnew | read !sfdx apex:run -f "#" -o]], { silent = true, noremap = true })

-- Map ]ee to open a new tab and run sfdx apex:run -f "#"
vim.keymap.set('n', ']ee', [[:tabnew | read !sfdx apex:run -f "#"]], { silent = true, noremap = true })

-- Map ]ej to open a new tab and run sfdx apex:run -f "#" --json
vim.keymap.set('n', ']ej', [[:tabnew | read !sfdx apex:run -f "#" --json]], { silent = true, noremap = true })


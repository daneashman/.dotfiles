vim.cmd('compiler go')
-- The above command will compile to an executable, we override this to just run it
vim.opt_local.makeprg = "go run ./"


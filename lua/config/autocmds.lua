-- view PRX as REXX
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    pattern = "*.prx",
    command = "setfiletype rexx"
})

-- last position
vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = "*",
    callback = function()
        local last_line = vim.fn.line([['"]])
        local last_buf_line = vim.fn.line("$")

        if last_line > 0 and last_line <= last_buf_line then
            vim.cmd([[normal! g`"]])
        end
    end
})

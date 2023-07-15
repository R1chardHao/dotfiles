require("lualine").setup {
    options = {
        theme = 'auto',
        section_separators = '',
        component_separators = '|'
    },
    tabline = {
        lualine_a = {'buffers'},
        lualine_z = {'tabs'}
    }
}

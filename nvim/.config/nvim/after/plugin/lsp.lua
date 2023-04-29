local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
  'tsserver',
  'eslint',
})

local cmp = require('cmp')
lsp.setup_nvim_cmp({
    mapping = lsp.defaults.cmp_mappings({
        ['<C-Space>'] = cmp.mapping.complete(),

        ["<Tab>"] = cmp.mapping(function(fallback)
            -- This little snippet will confirm with tab, and if no entry is selected, will confirm the first item
            if cmp.visible() then
                local entry = cmp.get_selected_entry()
                if not entry then
                    cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
                else
                    cmp.confirm()
                end
            else
                fallback()
            end
        end, {"i","s","c",}),
    })
})

cmp.setup.cmdline(':', {
    --mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        {
            name = 'cmdline',
            option = {
                ignore_cmds = { 'Man', '!' }
            }
        }
    })
})

lsp.setup()

vim.diagnostic.config({
    virtual_text = {
        severity = vim.diagnostic.severity.ERROR
    },
})

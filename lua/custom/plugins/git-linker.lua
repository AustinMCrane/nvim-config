return {
  'ruifm/gitlinker.nvim',
  requires = 'nvim-lua/plenary.nvim',
  config = function()
    require('gitlinker').setup {
      opts = {
        remote = nil, -- force the use of a specific remote
        -- adds current line nr in the url for normal mode
        add_current_line_on_normal_mode = true,
        -- callback for what to do with the url
        action_callback = require('gitlinker.actions').copy_to_clipboard,
        -- print the url after performing the action
        print_url = true,
      },
      callbacks = {
        ['austin-crane-fhr'] = function(url_data)
          url_data.host = 'github.com'
          local url = require('gitlinker.hosts').get_github_type_url(url_data)

          return url
        end,
        ['github.com'] = require('gitlinker.hosts').get_github_type_url,
      },
      -- default mapping to call url generation with action_callback
      mappings = '<leader>gy',
    }
  end,
}

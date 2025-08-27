-- setup mcp for code companion
require('codecompanion').setup {
  strategies = {
    chat = {
      tools = {
        opts = {
          default_tools = {
            'mcp',
          },
        },
      },
      adapter = {
        name = 'copilot',
        model = 'claude-sonnet-4',
      },
    },
  },
  extensions = {
    mcphub = {
      callback = 'mcphub.extensions.codecompanion',
      opts = {
        make_vars = true,
        make_slash_commands = true,
        show_result_in_chat = true,
      },
    },
  },
}

require('mcphub').setup {
  global_env = function()
    return {
      -- Define global environment variables here
      -- Example: MY_VAR = 'value'
      ['ado_org'] = os.getenv 'ADO_ORG',
    }
  end,
  workspace = {
    enabled = true, -- Default: true
    look_for = { '.mcphub/servers.json', '.vscode/mcp.json' },
    reload_on_dir_changed = true, -- Auto-switch on directory change
    port_range = { min = 40000, max = 41000 }, -- Port range for workspace hubs
    get_port = nil, -- Optional function for custom port assignment
  },
}

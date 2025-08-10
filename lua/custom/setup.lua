-- setup mcp for code companion
require('codecompanion').setup {
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

print(os.getenv 'GITHUB_TOKEN')

require('mcphub').setup {
  global_env = {
    ['input:github_token'] = os.getenv 'GITHUB_TOKEN' or '',
  },
  workspace = {
    enabled = true, -- Default: true
    look_for = { '.vscode/mcp.json' },
    reload_on_dir_changed = true, -- Auto-switch on directory change
    port_range = { min = 40000, max = 41000 }, -- Port range for workspace hubs
    get_port = nil, -- Optional function for custom port assignment
  },
}

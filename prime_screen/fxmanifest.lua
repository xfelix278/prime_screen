fx_version 'adamant'
game 'gta5'

author 'Prime-Scripts'
description 'discord.gg/prime-scripts'
version '1.0.0'

shared_scripts {
    'config/cl_config.lua'
}

server_scripts {
    'config/sv_config.lua',
    'server/server.lua'
}

client_scripts {
    'client/client.lua'
}

dependencies {
    'screenshot-basic'
}
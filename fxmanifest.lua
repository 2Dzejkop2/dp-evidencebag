fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name 'dp-evidencebag'
description 'Advanced Evidence Bag System for ox_inventory'
author 'Dzejkop'
version '2.0.0'

client_scripts {
  'client/*.lua'
}

server_scripts {
  'server/*.lua'
}

shared_scripts {
  '@ox_lib/init.lua',
  'config.lua',
  'shared/*.lua'
}

dependencies {
  'ox_inventory',
  'ox_lib'
}
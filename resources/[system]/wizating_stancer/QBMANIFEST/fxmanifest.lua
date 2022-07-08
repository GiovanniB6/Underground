fx_version 'bodacious'
game 'gta5'

description "Wizating Stancer v1.1"

client_scripts {
 'client/client.lua',
}

server_scripts {
   "server/server.lua",
   "@oxmysql/lib/MySQL.lua",
}

shared_script 'config.lua'

files {
	"html/*.html",
	"html/*.js",
	"html/*.css",
    "html/images/*.png"
}

ui_page "html/index.html"

escrow_ignore {
	'config.lua',
	'VRPMANIFEST/*',
	'QBMANIFEST/*'
}

lua54 'yes'

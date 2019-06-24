


description "Script de Expediente."


dependency "vrp"


server_scripts{ 
    "@vrp/lib/utils.lua",
    "exp_server.lua",
}

client_scripts{
    "lib/Proxy.lua",
    "lib/Tunnel.lua", 
    "cfg/exp_config.lua",
    "exp_functions.lua",
    "exp_client.lua",
  }
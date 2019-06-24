local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRPl = {}
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_onservice")
Lclient = Tunnel.getInterface("vrp_onservice","vrp_onservice")
Tunnel.bindInterface("vrp_onservice",vRPl)


function vRPl.perm(p1)
    local user_id = vRP.getUserId({source})
    return vRP.hasPermission({user_id,p1})
  end
  
function vRPl.padrao(voltar)
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({source})
  vRPclient.getCustomization(player,{}, function(old_custom)
  antigo = old_custom
    if voltar then 
      vRPclient.setCustomization(source,{antigo})
    end
      --else 
     --   custom = {}
   --     custom.model = 's_m_m_prisguard_01'
        --HKclient.lockVehicle(player,{vehStorage[i].lockStatus, vehStorage[i].id})
 --       Lclient.setCustomization(player,{'s_m_m_prisguard_01'})
end) 
  end
  



function vRPl.sendtodiscord(webhook, entrando, PMptr)
    if entrando then acao = 'Entrando em serviço!' else acao = 'Saindo de serviço!' end
    local user_id = vRP.getUserId({source})
if user_id ~= nil then
    vRP.getUserIdentity({user_id, function(identity)
    local fields = {}
    table.insert(fields, { name = "Passaporte:", value = 'Numeração => **'..user_id..'**', inline = true });
    table.insert(fields, { name = "Nome e Sobrenome:", value = ''..identity.nome..' '..identity.sobrenome, inline = true }); --> Se der erro, mude para identity.name e identity.lastname <--
    table.insert(fields, { name = "Registro Geral:", value = identity.registration, inline = true }); --> Se der erro, mude para identity.name e identity.lastname <--
    table.insert(fields, { name = "Ação:", value = acao, inline = true });
    table.insert(fields, { name = "Cargo:", value = vRP.getUserGroupByType({user_id,"job"}), inline = true });
    table.insert(fields, { name = "Horário:", value = os.date("%X"), inline = true });
    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode(
              {
                  username = "PMESP",
                  content = ''..identity.nome..' '..identity.sobrenome..' '..acao,
                  embeds = {
                      {
                          color = 16769280,
                          fields = fields,
                      }
                  }
              }), { ['Content-Type'] = 'application/json' })
            end});
        end
      TriggerClientEvent('chat:addMessage', -1, {
        template = 
        [[<div style= "padding: 0.5vw; 
        max-width: 400px; 
        height: 7px;
        margin: 0.5vw; 
        border-radius: 3px;">
        <i class="fa fa-bullhorn"></i> Agora temos <b>{0}</b> policiais em serviço.<br>
        </div>
        ]],
            args = { PMptr}
        })
end


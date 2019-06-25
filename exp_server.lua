local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRPl = {}
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_onservice")
Lclient = Tunnel.getInterface("vrp_onservice","vrp_onservice")
Tunnel.bindInterface("vrp_onservice",vRPl)
cfg = {}
local config = module("vrp_onservice","cfg/exp_config")
PMptr = 0;
ativoserver = false;
if PMptr == nil or PMptr < 0 then PMptr = 0 end;

function vRPl.perm(p1)
    local user_id = vRP.getUserId({source});
    return vRP.hasPermission({user_id,p1});
  end


AddEventHandler('playerDropped', function ()
local user_id = vRP.getUserId({source})
  for k,v in pairs(cfg.expediente) do 
      if ativoserver and vRP.hasPermission({user_id,k}) then
          PMptr = PMptr - 1;
      end
  end 
end)

function vRPl.sendtodiscord(webhook, entrando)
    if entrando then 
    acao = 'Entrando em serviço!';
    ativoserver = true;
    PMptr = PMptr + 1;
  else
       acao = 'Saindo de serviço!';
      PMptr = PMptr - 1;
      ativoserver = false;
      end
    local user_id = vRP.getUserId({source})
if user_id ~= nil then
    vRP.getUserIdentity({user_id, function(identity)
    local fields = {}
    table.insert(fields, { name = "Passaporte:", value = 'Numeração => **'..user_id..'**', inline = true });
    table.insert(fields, { name = "Nome e Sobrenome:", value = ''..identity.nome..' '..identity.sobrenome, inline = true }); --> Se der erro, mude para identity.name e identity.lastname <--
    table.insert(fields, { name = "Registro Geral:", value = identity.registration, inline = true }); 
    table.insert(fields, { name = "Ação:", value = acao, inline = true });
    table.insert(fields, { name = "Cargo:", value = vRP.getUserGroupByType({user_id,"job"}), inline = true });
    table.insert(fields, { name = "Horário:", value = os.date("%X"), inline = true });
    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode(
              {
                  username = "BATER-PONTO",
                  content = ''..identity.nome..' '..identity.sobrenome..' '..acao,--> Se der erro, mude para identity.name e identity.lastname
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
        <i class="fa fa-bullhorn"></i> <b>[COPOM]</b> Agora temos <b>{0}</b> policiais em patrulha .<br>
        </div>
        ]],
            args = { PMptr}
        })
end


RegisterCommand("ptr", function(source) 
  if source ~= nil then 
    TriggerClientEvent('chat:addMessage', source, {
      template = 
      [[<div style= "padding: 0.5vw; 
      max-width: 400px; 
      height: 7px;
      margin: 0.5vw; 
      border-radius: 3px;">
      <i class="fa fa-bullhorn"></i> Agora temos <b>{0}</b> policiais em patrulha.<br>
      </div>
      ]],
          args = { PMptr}
      })  end
  end)



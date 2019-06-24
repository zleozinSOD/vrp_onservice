vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_onservice")
vRPl = {}
Lserver = Tunnel.getInterface("vrp_onservice","vrp_onservice")
vRPl = Tunnel.getInterface("vrp_onservice","vrp_onservice")
Tunnel.bindInterface("vrp_onservice",vRPl)

ativo = false;
PMptr = 0;

Citizen.CreateThread( function()
while true do 
    Wait(2)

    jogador = PlayerPedId();
    plyCoords = GetEntityCoords(jogador, true);
    expediente = cfg.coords
    distancia = GetDistanceBetweenCoords(plyCoords.x, plyCoords.y, plyCoords.z, expediente.x, expediente.y, expediente.z);

    if distancia < 3 then
    if ativo then strComp = '~r~SAIR~w~ de' else strComp = '~g~ENTRAR~w~ em' end
    TextoUser(expediente.x, expediente.y, expediente.z+0.4,"~g~[E] ~w~ para "..strComp.."  serviço ") 
    TextoUser(expediente.x, expediente.y, expediente.z+0.3,"~y~[Y]~w~ PARA RECARREGAR SUAS MUNIÇÕES.")
    Marker(1, expediente.x, expediente.y, expediente.z)
        if IsControlJustReleased(1, 51) then
                                if not ativo then 
                        for k, v in pairs(cfg.expediente) do 

                            Lserver.perm({k}, function(permissaoo)
                                
                                for i = 1, #v.armas do
                                    if permissaoo then
                                        darArma(v.armas[i], cfg.municaopadrao)     
                                        ativo = true
                                    end
                                end
                                if v.colete then darColete(100) end 

                                if permissaoo then 
                                    PMptr = PMptr + 1   
                                    Lserver.sendtodiscord({cfg.discordURL, true})
                        end

                        end)
                        end
                else
                    -- responsavel por tirar.
                    for k,v in pairs(cfg.expediente) do 
                        Lserver.perm({k}, function(permissaoo)
                            if permissaoo and ativo then 
                            RemoveAllPedWeapons(jogador, false)
                            darColete(0)
                            PMptr = PMptr - 1
                            Lserver.sendtodiscord({cfg.discordURL, false})
                            ativo = false
                            end
                    end)
                    end 

                end
        end
        if IsControlJustReleased(1, 246) then
            for k,v in pairs(cfg.expediente) do 
            Lserver.perm({k}, function(permissaoo)
                if permissaoo and ativo then
                            for i = 1, #v.armas do
                                ahash = GetHashKey((v.armas[i]))
                                if HasPedGotWeapon(jogador, ahash, false) then    
                                    SetPedAmmo(jogador, ahash, cfg.municaopadrao)
                                end
                        end
                        if v.colete then darColete(100) end 

                        end           
        end)
        end
    end

    end 

end
end)








function darArma(weapon,ammo)
    GiveWeaponToPed(PlayerPedId(), GetHashKey(weapon), ammo, false)
end

function darColete(qtd)
local jogador = PlayerPedId()
SetPedArmour(jogador, qtd)
end


function Marker(tipo,x,y,z)
DrawMarker(23, x, y, z-0.87, 0, 0, 0, 0.0, 0, 0, 3.0, 3.0, 0.5001, 255, 255, 255, 255, 0, 0, 0, 0)
end

function TextoUser(x,y,z, text, s1, s2)
    local onScreen,_x,_y = World3dToScreen2d(x,y,z)
    local px,py,pz = table.unpack(GetGameplayCamCoords())    
    if s1 == nil or s2 == nil then s1 = 0.54; s2 = 0.54 end
    if onScreen then
        SetTextScale(0.54, 0.54)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end



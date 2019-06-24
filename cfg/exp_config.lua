cfg = {}

cfg.expediente = { -- configuração do expediente
	["paycheck.policial.rct"] = { -- Recruta [PM]
        armas = { 'WEAPON_SMG','WEAPON_ASSAULTRIFLE','WEAPON_COMBATPISTOL' },
        colete = true,
        regenerarHP = true,
    },
	["paycheck.policial.2sgt"] = { --   2ºSGT [PM]
        armas = { 'WEAPON_MICROSMG','WEAPON_HEAVYSHOTGUN','WEAPON_CARBINERIFLE' },
        colete = true,
        regenerarHP = true,
    },
	["paycheck.policial.3sgt"] = { -- 1ºSGT [PM]
        armas = { 'WEAPON_REVOLVER_MK2','WEAPON_APPISTOL','WEAPON_PISTOL50' },
        colete = true,
        regenerarHP = true,
    },
}

cfg.municaopadrao = 500; -- padrao de munição que vai vir em cada arma kk
cfg.vidapadrao = 400; --

cfg.discordURL = 'https://discordapp.com/api/webhooks/592207758934409247/2jvIiHMzBa26X6mDB-6yB7_2SJMvaxP4IoIYOKQR-TYnudTJDcBxKLnnTLQrkL8NT7Qo'; -- seu webhook

cfg.nomeservidor = 'Trevo'; -- nome do servidor pra aparecer no embed

cfg.coords = { ["x"] = 455.38616943359, ["y"] = -980.09063720703, ["z"] = 30.68957901001 }
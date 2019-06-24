# vrp_onservice
### Script simples de expediente com bate-ponto no Discord e recarregar munições, feito para VRP Old.
#### Likizão#1479

Configure atráves do arquivo `exp_config.lua` na pasta /cfg/.
A configuração da tabela `cfg.expediente` exige que dentre dos colchetes vá a permissão que o grupo possui entre aspas, por exemplo:

```lua
cfg.expediente = { 
	["permissao.dogrupo"] = { 
        armas = { 'WEAPON_SMG','WEAPON_ASSAULTRIFLE','WEAPON_COMBATPISTOL' },
        colete = true, -- TRUE -> Vai dar colete 100.
        regenerarHP = true, -- Função ainda não colocada.
    },
}
```

[Clique aqui e pegue o nome de spawn das armas para utilizar na configuração](https://forum.fivem.net/t/list-of-weapon-spawn-names-after-hours/90750)

O script contem o comando **/ptr** que irá mostrar a quantidade de policiais em serviço no momento.
    Se você se deparar, com algum erro relacionado a função `identity` próximo a linha 41 ou 50, tente mudar a função `identity.nome e identity.sobrenome` para `identity.name e identity.firstname`.
    
Tecla | Função
------------ | -------------
**[E]** | Entrar ou sair de serviço
**[Y]** | Recarregar munições e pegar um novo colete


*Lista*
- [x] Mandar embed no Discord 
- [x] Inserir horário no Embed
- [x] Recarregar munições
<<<<<<< HEAD
- [ ] Colocar farda
=======
- [ ] Colocar farda.
>>>>>>> 2d703a72095aa575252b576e1ea3fffeef1c8d7e

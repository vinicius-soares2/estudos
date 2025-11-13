local inimigo = {
	nome = "Slime Verde",
	vida = 50,
	dano = 8
}

local function atacar(inimigo, danoRecebido)
	inimigo.vida = inimigo.vida - danoRecebido
	if inimigo.vida < 0 then
		inimigo.vida = 0
	end
	print(string.format("%s agora tem %d de vida.", inimigo.nome, inimigo.nome))
end

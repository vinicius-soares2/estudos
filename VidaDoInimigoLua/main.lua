local inimigo = {
	nome = "Slime Verde",
	vida = 50,
	dano = 8
}

local function atacar(inimigo, danoRecebido)
	inimigo.vida = inimigo.vida - danoRecebido
	print(string.format("%s agora tem %d de vida. ", inimigo.nome, inimigo.vida))
end

--is a live 
--chamando a funcao
atacar(inimigo, 8)

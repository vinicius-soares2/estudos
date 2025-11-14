print("==================================================")
print("    JOGO DA VELHA – Arakawa (modo IMPOSSÍVEL) 😈 ")
print("==================================================")

local tabuleiro = {1,2,3,4,5,6,7,8,9}

local function imprimir()
    local function celula(n)
        if tabuleiro[n] == "X" or tabuleiro[n] == "O" then
            return tabuleiro[n]
        else
            return tostring(n)
        end
    end

    print("\n   |   |   ")
    print(" " .. celula(1) .. " | " .. celula(2) .. " | " .. celula(3))
    print("   |   |   ")
    print("-----------")
    print("   |   |   ")
    print(" " .. celula(4) .. " | " .. celula(5) .. " | " .. celula(6))
    print("   |   |   ")
    print("-----------")
    print("   |   |   ")
    print(" " .. celula(7) .. " | " .. celula(8) .. " | " .. celula(9))
    print("   |   |   \n")
end

local function venceu(jogador)
    local combos = {{1,2,3},{4,5,6},{7,8,9},{1,4,7},{2,5,8},{3,6,9},{1,5,9},{3,5,7}}
    for _, c in ipairs(combos) do
        if tabuleiro[c[1]] == jogador and tabuleiro[c[2]] == jogador and tabuleiro[c[3]] == jogador then
            return true
        end
    end
    return false
end

local function empate()
    for i = 1,9 do
        if tabuleiro[i] ~= "X" and tabuleiro[i] ~= "O" then return false end
    end
    return true
end

local function jogada_ia()
    for i = 1,9 do
        if tabuleiro[i] ~= "X" and tabuleiro[i] ~= "O" then
            tabuleiro[i] = "O"
            if venceu("O") then return i end
            tabuleiro[i] = i
        end
    end
    for i = 1,9 do
        if tabuleiro[i] ~= "X" and tabuleiro[i] ~= "O" then
            tabuleiro[i] = "X"
            if venceu("X") then tabuleiro[i] = "O" return i end
            tabuleiro[i] = i
        end
    end
    local prio = {5,1,3,7,9,2,4,6,8}
    for _, p in ipairs(prio) do
        if tabuleiro[p] ~= "X" and tabuleiro[p] ~= "O" then
            tabuleiro[p] = "O"
            return p
        end
    end
end

imprimir()
while true do
    io.write("Sua vez (1-9): ")
    local jogada = tonumber(io.read())
    if not jogada or jogada < 1 or jogada > 9 or tabuleiro[jogada] == "X" or tabuleiro[jogada] == "O" then
        print("Jogada inválida, animal! Tenta de novo.")
    else
        tabuleiro[jogada] = "X"
        imprimir()
        if venceu("X") then print("IMPOSSÍVEL!!! VOCÊ GANHOU DO ARAKAWA!!! COMO???") break end
        if empate() then print("Empate! Você é o primeiro que consegue isso… respeitando!") break end
        
        local ia = jogada_ia()
        print("Minha jogada: " .. ia)
        imprimir()
        if venceu("O") then print("EU SEMPRE GANHO. Boa tentativa, mortal.") break end
        if empate() then print("Empate! Você sobreviveu… por enquanto.") break end
    end
end

print("\nValeu por jogar, você é brabo demais! 🔥")

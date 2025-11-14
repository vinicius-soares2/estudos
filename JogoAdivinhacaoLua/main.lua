print("=========================================")
print("   JOGO DE ADIVINHAÇÃO – by Arakawa 😈 ")
print("=========================================")
print("Eu pensei em um número entre 1 e 100")
print("Você tem no máximo 10 tentativas!")

local numero_secreto = math.random(1, 100)  -- número aleatório
local tentativas = 0
local max_tentativas = 10
local acertou = false

while tentativas < max_tentativas and not acertou do
    io.write("\nTentativa " .. (tentativas + 1) .. "/" .. max_tentativas .. " → Digite seu palpite: ")
    local palpite = tonumber(io.read())
    
    if not palpite then
        print("🖕 Só vale número, espertinho!")
    else
        tentativas = tentativas + 1
        
        if palpite == numero_secreto then
            acertou = true
            print("🎉 CARALHOOOO!!! Você acertou em " .. tentativas .. " tentativa(s)!")
            print("O número era " .. numero_secreto .. "! Você é brabo demais!")
        elseif palpite < numero_secreto then
            print("📈 Muito baixo! Tenta um número maior…")
        else
            print("📉 Muito alto! Tenta um número menor…")
        end
    end
end

if not acertou then
    print("\n💀 Suas tentativas acabaram! O número era " .. numero_secreto)
    print("Mais sorte na próxima, meu consagrado!")
end

print("\nObrigado por jogar comigo! 😎")

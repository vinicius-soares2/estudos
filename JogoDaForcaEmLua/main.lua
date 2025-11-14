print("=========================================")
print("       JOGO DA FORCA – by Arakawa 🔥   ")
print("=========================================")

local palavras = {"LUA", "ROBLOX", "COMPUTADOR", "ARAKAWA", "PROGRAMACAO", "GITHUB"}
local palavra = palavras[math.random(#palavras)]
local escondida = string.rep("_ ", #palavra)
local letras_erradas = {}
local erros = 0
local max_erros = 6

print("A palavra tem " .. #palavra .. " letras: " .. escondida)

while erros < max_erros and string.find(escondida, "_") do
    io.write("\nErros (" .. erros .. "/" .. max_erros .. "): " .. table.concat(letras_erradas, " ") .. "\n")
    io.write("Digite uma letra: ")
    local letra = string.upper(io.read():sub(1,1))
    
    if letra == "" then
        print("Tá de sacanagem? Digita uma letra direito!")
    elseif palavra:find(letra) then
        print("✅ Boa! A letra '" .. letra .. "' existe!")
        local nova = ""
        for i = 1, #palavra do
            if palavra:sub(i,i) == letra then
                nova = nova .. letra .. " "
            else
                nova = nova .. escondida:sub(i*2-1, i*2-1) .. " "
            end
        end
        escondida = nova
    else
        print("❌ Errou feio! A letra '" .. letra .. "' não tem!")
        table.insert(letras_erradas, letra)
        erros = erros + 1
    end
    
    print(escondida)
end

if erros == max_erros then
    print("\n💀 ENFORCADO! Você perdeu, seu lindo!")
    print("A palavra era: " .. palavra)
else
    print("\n🎉 PARABÉNS, MITO!!! Você salvou o bonequinho e acertou a palavra!")
end

print("\nValeu por jogar comigo, você é brabo demais! 😎🔥")

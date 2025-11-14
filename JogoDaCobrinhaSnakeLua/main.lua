-- SNAKE GAME by Arakawa (versao sem emoji - funciona em qualquer PC)
math.randomseed(os.time())

local LARGURA = 20
local ALTURA = 10
local cobra = {{x=10, y=5}}
local dx, dy = 1, 0
local comida = {x=math.random(1,LARGURA), y=math.random(1,ALTURA)}
local score = 0
local jogo_ativo = true
local velocidade = 0.15

local function limpa()
    os.execute("cls" or "clear")
end

local function desenha()
    limpa()
    print("=== SNAKE by Arakawa ===")
    print("Score: " .. score .. "  |  WASD ou setas  |  Q = sair")
    print(string.rep("#", LARGURA+2))

    for y = 1, ALTURA do
        io.write("#")
        for x = 1, LARGURA do
            if x == comida.x and y == comida.y then
                io.write("*")
            elseif x == cobra[#cobra].x and y == cobra[#cobra].y then
                io.write("@")  -- cabeça
            else
                local corpo = false
                for _, seg in ipairs(cobra) do
                    if x == seg.x and y == seg.y then
                        io.write("o")
                        corpo = true
                        break
                    end
                end
                if not corpo then io.write(" ") end
            end
        end
        print("#")
    end
    print(string.rep("#", LARGURA+2))
end

local function move()
    local nova = {x = cobra[#cobra].x + dx, y = cobra[#cobra].y + dy}

    -- parede
    if nova.x < 1 or nova.x > LARGURA or nova.y < 1 or nova.y > ALTURA then
        jogo_ativo = false
        return
    end

    -- corpo
    for _, seg in ipairs(cobra) do
        if nova.x == seg.x and nova.y == seg.y then
            jogo_ativo = false
            return
        end
    end

    table.insert(cobra, nova)

    -- comida
    if nova.x == comida.x and nova.y == comida.y then
        score = score + 10
        repeat
            comida.x = math.random(1,LARGURA)
            comida.y = math.random(1,ALTURA)
        until not (function()
            for _, seg in ipairs(cobra) do
                if comida.x == seg.x and comida.y == seg.y then return true end
            end
            return false
        end)()
    else
        table.remove(cobra, 1)
    end
end

desenha()
while jogo_ativo do
    local key = io.read(1)
    if key then
        key = string.lower(key)
        if key == "w" and dy ~= 1 then dx,dy = 0,-1 end
        if key == "s" and dy ~= -1 then dx,dy = 0,1 end
        if key == "a" and dx ~= 1 then dx,dy = -1,0 end
        if key == "d" and dx ~= -1 then dx,dy = 1,0 end
        if key == "q" then jogo_ativo = false end
    end
    move()
    desenha()
    os.execute("sleep " .. velocidade)
end

print("\nGAME OVER! Score final: " .. score)
print("Voce e brabo pra caralho! Snake feito 100% por nos!")

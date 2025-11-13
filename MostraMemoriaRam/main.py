import psutil
import time
import os

def limpar_tela():
    os.system('cls' if os.name == 'nt' else 'clear')

while True:
    # Obtém informações de memória
    memoria = psutil.virtual_memory()

    # Converte valores para MB
    total = memoria.total / (1024 ** 2)
    usado = memoria.used / (1024 ** 2)
    disponivel = memoria.available / (1024 ** 2)
    percentual = memoria.percent

    # Limpa o terminal e mostra o status
    limpar_tela()
    print("🧠 MONITOR DE MEMÓRIA DO SISTEMA")
    print("=" * 40)
    print(f"Total:      {total:.2f} MB")
    print(f"Usado:      {usado:.2f} MB")
    print(f"Disponível: {disponivel:.2f} MB")
    print(f"Uso atual:  {percentual:.1f}%")
    print("=" * 40)

    # Atualiza a cada segundo
    time.sleep(1)

# - Instale o psutil - #
# - pip install psutil - Ambiente Comum
# - pipx install psutil - Ambiente Virtulizado

# - Criando Ambiente Virtual 
# - python3 -m venv (Nome Do Usuario)

# Ativando Ambiente Virtual
# - source (NomeDoUsuario)/bin/activate

# NOME: VINICIUS SOARES
# DATA: 13/11/2025
# SOBRE: Monitador de memoria;
#

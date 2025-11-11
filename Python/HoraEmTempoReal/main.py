import datetime
import time
import pytz  # precisa instalar com: pip install pytz

# Define o fuso horário de Brasília
brasilia_tz = pytz.timezone("America/Sao_Paulo")

while True:
    # Obtém a hora atual no fuso de Brasília
    agora = datetime.datetime.now(brasilia_tz)
    hora_formatada = agora.strftime("%H:%M:%S")

    # Exibe no terminal (limpando antes)
    print(f"\r🕒 Hora em Brasília: {hora_formatada}", end="")
    time.sleep(1)

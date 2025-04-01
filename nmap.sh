#!/bin/bash

echo ""
echo " █████╗ ██╗   ██╗██╗  ██╗ ██████╗ ██╗  ██╗    ███╗   ██╗███╗   ███╗ █████╗ ██████╗ "
echo "██╔══██╗██║   ██║██║  ██║██╔═████╗██║  ██║    ████╗  ██║████╗ ████║██╔══██╗██╔══██╗"
echo "███████║██║   ██║███████║██║██╔██║███████║    ██╔██╗ ██║██╔████╔██║███████║██████╔╝"
echo "██╔══██║╚██╗ ██╔╝██╔══██║████╔╝██║╚════██║    ██║╚██╗██║██║╚██╔╝██║██╔══██║██╔═══╝ "
echo "██║  ██║ ╚████╔╝ ██║  ██║╚██████╔╝     ██║    ██║ ╚████║██║ ╚═╝ ██║██║  ██║██║     "
echo "╚═╝  ╚═╝  ╚═══╝  ╚═╝  ╚═╝ ╚═════╝      ╚═╝    ╚═╝  ╚═══╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝     "
echo ""
echo "Autor: avh04"
echo "github: https://github.com/AVH04"

if [ -z "$1" ]
then
  echo "Uso: ./nmap_avanzado.sh <objetivo>"
  exit 1
fi

OBJETIVO=$1

menu() {
  echo "Seleccione una opción para ejecutar en el objetivo $OBJETIVO:"
  echo "1. Descubrimiento de hosts activos"
  echo "2. Escaneo básico TCP SYN"
  echo "3. Escaneo TCP completo"
  echo "4. Escaneo UDP intensivo"
  echo "5. Escaneo profundo de versiones y NSE"
  echo "6. Identificación avanzada del sistema operativo"
  echo "7. Auditoría de vulnerabilidades específicas"
  echo "8. Escaneo IPv6 detallado"
  echo "9. Escaneo avanzado con evasión IDS"
  echo "10. Escaneo con señuelos para evasión"
  echo "11. Ejecución avanzada de NSE"
  echo "12. Salir"
}

while true; do
  menu
  read -p "Ingrese su opción: " opcion
  case $opcion in
    1) nmap -sn $OBJETIVO ;;
    2) nmap -sS $OBJETIVO ;;
    3) nmap -sT $OBJETIVO ;;
    4) nmap -sU --max-retries 5 --min-rate 5000 -p- $OBJETIVO ;;
    5) nmap -sV --script="vuln and safe" --script-timeout=30m $OBJETIVO ;;
    6) nmap -O --osscan-limit --osscan-guess $OBJETIVO ;;
    7) nmap --script ssl-heartbleed,ftp-anon,http-shellshock $OBJETIVO ;;
    8) read -p "Ingrese la dirección IPv6: " ipv6; nmap -6 -A -T4 $ipv6 ;;
    9) nmap -sS -Pn -f --data-length 25 -T paranoid $OBJETIVO ;;
    10) nmap -D 192.168.0.1,10.0.0.1,RND:5 -Pn $OBJETIVO ;;
    12) echo "Saliendo del script."; exit 0 ;;
    *) echo "Opción no válida." ;;
  esac
done

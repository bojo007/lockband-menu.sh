# lockband-menu.sh
#!/bin/sh

PORT="/dev/ttyUSB2"  # Ganti jika port AT modem beda
BAND=""

echo "=== PILIH BAND LTE (ZTE MF90) ==="
echo "1. Band 3 (1800 MHz)"
echo "2. Band 5 (850 MHz)"
echo "3. Band 8 (900 MHz)"
echo "4. Band 40 (2300 MHz)"
echo "5. Band 1 (2100 MHz)"
echo "6. Tampilkan Band Saat Ini"
echo "0. Keluar"
read -p "Pilih (0-6): " pilih

case "$pilih" in
  1) BAND="4" ;;
  2) BAND="8" ;;
  3) BAND="10" ;;
  4) BAND="2000000" ;;
  5) BAND="2" ;;
  6)
    echo -e "AT+ZBAND?\r" > "$PORT"
    cat "$PORT"
    exit 0
    ;;
  0) exit 0 ;;
  *) echo "Pilihan tidak valid"; exit 1 ;;
esac

echo -e "AT+ZBAND=$BAND\r" > "$PORT"
echo "Band berhasil dikunci ke $BAND"


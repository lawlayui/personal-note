**1. Pernyataan if**
```bash
if [[ kondisi_1 ]]; then
    # Perintah jika kondisi_1 benar
elif [[ kondisi_2 ]]; then
    # Perintah jika kondisi_1 salah DAN kondisi_2 benar
else
    # Perintah jika semua kondisi di atas salah
fi
```

```bash
#!/bin/bash

read -p "Masukkan angka: " nilai

if (( nilai > 10 )); then
    echo "Angka lebih besar dari 10"
elif (( nilai == 10 )); then
    echo "Angka sama dengan 10"
else
    echo "Angka kurang dari 10"
fi
```

**2. Pernyataan case**
```bash
case "$variabel" in
    pola_1)
        # Perintah jika variabel cocok dengan pola_1
        ;;
    pola_2|pola_3)
        # Perintah jika variabel cocok dengan pola_2 ATAU pola_3
        ;;
    *)
        # Perintah default jika tidak ada pola yang cocok (opsional)
        ;;
esac
```

```bash
#!/bin/bash

read -p "Pilih menu [1-3] atau [start/stop]: " pilihan

case "$pilihan" in
    1|start)
        echo "Menjalankan layanan..."
        ;;
    2|stop)
        echo "Menghentikan layanan..."
        ;;
    3|restart)
        echo "Mulai ulang layanan..."
        ;;
    *)
        echo "Pilihan tidak valid!"
        ;;
esac
```
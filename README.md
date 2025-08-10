# UAS-Pemrograman-Web – Buywinter.com

##  Deskripsi
Website **Buywinter.com** ini dibuat sebagai bagian dari Ujian Akhir Semester Pemrograman Web. Project ini merupakan aplikasi web berbasis Flask dengan fitur interaksi database MySQL (via file `db_steam.sql`).

##  Anggota Tim
- Alfebrio Setia Nugraha (23.83.1009)  
- Bintang Bani Raharjo (23.83.1046)  
- Tino Febrian Efendi (23.83.1048) :contentReference[oaicite:1]{index=1}

##  Struktur Direktori
- `/static` → File CSS, JavaScript, dan assets statis
- `/templates` → Template HTML untuk tampilan user
- `app.py` → Script utama aplikasi Flask
- `db_steam.sql` → Skrip SQL untuk setup database

##  Teknologi & Library
| Komponen          | Teknologi/Library               |
|-------------------|---------------------------------|
| Backend / Web     | Python + Flask                  |
| Database          | MySQL (via `db_steam.sql`)      |
| Frontend          | HTML, CSS                       |

##  Instalasi & Setup
```bash
# (1) Buat virtual environment dan aktifkan
virtualenv FlaskEnv
FlaskEnv\Scripts\activate  # Windows
source FlaskEnv/bin/activate  # Mac/Linux

# (2) Instal dependensi
pip install flask
pip install mysql-connector-python

# (3) Set environment variables
set FLASK_APP=app.py
set FLASK_ENV=development  # Windows
export FLASK_APP=app.py
export FLASK_ENV=development  # Mac/Linux

# (4) Jalankan aplikasi
flask run --debug

# (5) Setup database
Import `db_steam.sql` ke database MySQL (contoh: via tools online atau lokal) :contentReference[oaicite:2]{index=2}

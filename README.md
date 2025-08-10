# UAS-Pemrograman-Web

##  Deskripsi
Repositori ini merupakan Website yang dibuat sebagai implementasi tugas Ujian Akhir Semester (UAS) untuk mata kuliah Pemrograman Web. Project ini merupakan aplikasi web berbasis Flask dengan fitur interaksi database MySQL.

##  Struktur
- `/static` – File CSS, JavaScript, dan assets statis
- `/templates` – Template HTML untuk tampilan user
- `app.py` – Script utama aplikasi Flask
- `db_steam.sql` – Skrip SQL untuk setup database

##  Komponen
| Bagian        | Library               |
|---------------|-----------------------|
| Backend       | Python + Flask        |
| Database      | MySQL                 |
| Frontend      | HTML, CSS             |

##  Setup
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
Import `db_steam.sql` ke database online (cth: filess.io)


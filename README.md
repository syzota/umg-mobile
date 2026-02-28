<img width="1919" height="477" alt="image" src="https://github.com/user-attachments/assets/15e9bd5b-981e-4c76-a432-87384035120d" />

<h1 align="center">✮ Universal Music Group: Management Mobile</h1>
<p align="center">
  <i>A Flutter-based mobile application developed for Mobile Programming Course. was made by Putri Syafana Afrillia (NIM: 2409116015).</i>
</p>

## **Introduction** ★

Projek ini merupakan aplikasi mobile berbasis Flutter yang dikembangkan sebagai mini project mata kuliah Mobile Programming. Aplikasi ini berfungsi sebagai sistem manajemen data album dengan fitur CRUD (Create, Read, Update, Delete) serta filtering berdasarkan genre musik.

---
## **App Hands-On** ⸝⸝.ᐟ⋆.ᐟ
### Features Checklist ᯓ★

- [x] Create Data (Tambah Album)
- [x] Read Data (Menampilkan Daftar Album)
- [x] Update Data (Edit Album)
- [x] Delete Data (Hapus Album)
- [x] Genre Filtering
- [x] Form Validation
      
## Tools and Tech Stack ᯓ★

Seluruh pengembangan aplikasi dilakukan menggunakan Flutter SDK dengan pendekatan declarative UI berbasis widget. Proyek ini bersifat cross-platform dan dapat dijalankan pada Android Emulator maupun perangkat fisik tanpa konfigurasi tambahan di sisi client.

### Core Technologies ⍟

- [x] **Flutter** – Digunakan sebagai UI toolkit utama untuk membangun antarmuka aplikasi berbasis widget.
- [x] **Dart** – Bahasa pemrograman utama untuk mengelola logika aplikasi dan state.
- [x] **Material Design** – Digunakan sebagai sistem desain untuk memastikan tampilan UI konsisten dan responsif.

### Frameworks & Libraries ⍟

- [x] **intl** – Digunakan untuk formatting nilai kontrak dalam mata uang USD menggunakan `NumberFormat`.
- [x] **Navigator (Flutter Routing)** – Digunakan untuk perpindahan halaman antara HomePage dan FormPage.
- [x] **StatefulWidget** – Digunakan untuk manajemen state sederhana pada fitur CRUD dan filtering.

### Development Tools ⍟

- [x] **VS Code** – Sebagai code editor utama dalam pengembangan aplikasi.
- [x] **Flutter SDK** – Digunakan untuk build, run, dan debugging aplikasi.
- [x] **Android Emulator / Physical Device** – Digunakan untuk pengujian aplikasi.
- [x] **Flutter DevTools** – Digunakan untuk debugging dan monitoring performa aplikasi.

---

## Implemented Features ᯓ★

Berikut adalah rangkuman fitur yang sudah berhasil diimplementasikan sesuai dengan instruksi tugas:

- [x] Home Page (Album List) – Menampilkan daftar album dalam bentuk card.
- [x] CRUD Functionality – Tambah, Edit, dan Hapus data album.
- [x] Genre Filtering – Filter album berdasarkan kategori genre (All Genres, Pop, Rock, R&B, Jazz, Hip Hop).
- [x] Form Validation – Validasi input sebelum data disimpan.
- [x] Navigation Between Pages – Perpindahan halaman menggunakan Navigator.

### Home Page
Halaman utama menampilkan daftar album dalam bentuk card yang berisi:
- Nama Album
- Nama Artist
- Genre
- Nilai Kontrak (USD)
- Cover Image

Tersedia fitur filtering berdasarkan genre:
- All Genres
- Pop
- Rock
- R&B
- Jazz
- Hip Hop

### Form Page
Digunakan untuk menambahkan dan mengedit data album.

Field yang tersedia:
- Album Name
- Artist Name
- Contract Value
- Cover Image URL
- Genre (Dropdown)

Form dilengkapi validasi untuk memastikan semua field wajib terisi sebelum data disimpan.

---

## Library Structure ⊹ ࣪ ˖ ✔

```
lib/
├── main.dart            # Entry point aplikasi
├── home_page.dart       # Halaman utama (List & Filter Artist)
└── form_page.dart       # Form tambah & edit data artist

```

---

## Program Flows ⭑ & Graphical User Interface (GUI) —͟͟͞͞★

### Navigation Bar ⍟

Navigation bar pada halaman utama menggunakan BackdropFilter dan ImageFilter.blur(). Komponen ini dibungkus dalam reusable glassContainer() agar konsisten untuk navbar dan card. Navbar tetap berada di bagian atas layar dan menyatu dengan background image.

```dart
                  glassContainer(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.album_rounded, color: Colors.white),
                        const Text(
                          "Universal Music Group",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            letterSpacing: 4,
                            shadows: [
                              Shadow(
                                color: Color.fromARGB(76, 0, 0, 0),
                                blurRadius: 10,
                                offset: Offset(2, 2),
                              ),
                            ],
                          ),
                        ),
                        CircleAvatar(
                          radius: 16,
                          backgroundColor: const Color.fromARGB(
                            127,
                            255,
                            255,
                            255,
                          ),
                          child: const Icon(
                            Icons.person_rounded,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
```

### Home Page ⍟

<img width="948" height="1043" alt="image" src="https://github.com/user-attachments/assets/bce45b4c-6711-4053-b051-2f773ff76f6a" />

Halaman utama ini menampilkan judul besar dan subjudul, filter kategori genre, dan list artist berbentuk glass card jika memang sudah disubmit. Bagian ini dibuat menggunakan Column + Center + Expanded agar layout tetap responsif di berbagai ukuran layar.

```dart
                  Center(
                    child: Column(
                      children: [
                        const Text(
                          "Our Artists",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 70,
                            letterSpacing: 4,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            height: 1.0,
                            shadows: [
                              Shadow(
                                color: Colors.black45,
                                blurRadius: 10,
                                offset: Offset(2, 2),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 2),

                        const Text(
                          "Universal Music Group Management",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            letterSpacing: 1.5,
                            height: 1.0,
                            shadows: [
                              Shadow(
                                color: Color.fromARGB(103, 0, 0, 0),
                                blurRadius: 5,
                                offset: Offset(1, 1),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),

```

### Genre Filtering System ⍟

Filter kategori menggunakan state selectedCategory dan memanfaatkan .where() untuk menyaring data berdasarkan genre. Jika tidak ada album yang terdata maka akan menampilkan UI seperti di bawah ini.

<img width="288" height="144" alt="image" src="https://github.com/user-attachments/assets/3c7f819b-2266-4f08-81e8-53246f69e7b3" />

```dart
List filteredItems = selectedCategory == "All Genres"
  ? items
  : items.where((item) => item["kategori"] == selectedCategory).toList();
```

### Artist Card Component ⍟

Setiap artist ditampilkan dalam bentuk Glass Card yang berisi lima atribut hasil dari input.

```dart
                 Expanded(
                    child: filteredItems.isEmpty
                        ? Center(
                            child: glassContainer(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 40,
                                vertical: 20,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.library_music_outlined,
                                    color: Colors.white.withOpacity(0.5),
                                    size: 50,
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
                                    "No Artists Registered",
                                    style: TextStyle(
                                      color: Color.fromARGB(216, 255, 255, 255),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w300,
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : ListView.builder(
                            padding: const EdgeInsets.only(bottom: 100),
                            itemCount: filteredItems.length,
                            itemBuilder: (context, index) {
                              final item = filteredItems[index];
                              return artistGlassCard(item, items.indexOf(item));
                            },
                          ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white.withOpacity(0.4),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                FormPage(onSave: (b) => setState(() => items.add(b))),
          ),
        ),
        child: const Icon(Icons.add, color: Colors.white, size: 30),
      ),
    );
  }

```
### Form Page (Add / Edit Artist) ⍟

FormPage digunakan untuk menambahkan data baru, dan mengedit data lama. Foto harus diisi oleh tautan gambar dari internet. 

<img width="953" height="1048" alt="image" src="https://github.com/user-attachments/assets/1b36ee20-fe43-4739-99fc-17caa548d67e" />
<img width="951" height="1045" alt="image" src="https://github.com/user-attachments/assets/d284eea1-5690-4b5f-8d35-a32e72ed5006" />


```dart
                 Expanded(
                    child: SingleChildScrollView(
                      child: glassContainer(
                        padding: const EdgeInsets.all(25),
                        child: Column(
                          children: [
                            const Icon(
                              Icons.album_rounded,
                              size: 50,
                              color: Colors.white,
                            ),
                            const SizedBox(height: 30),

                            buildLabel("Album Name"),
                            buildTextField(namaController, Icons.album),

                            const SizedBox(height: 15),
                            buildLabel("Artist"),
                            buildTextField(labelController, Icons.person),

                            const SizedBox(height: 15),
                            buildLabel("Contract Value (USD)"),
                            buildTextField(
                              hargaController,
                              Icons.attach_money,
                              isNumber: true,
                            ),

                            const SizedBox(height: 15),
                            buildLabel("Cover Image URL"),
                            buildTextField(imagePathController, Icons.link),

                            const SizedBox(height: 15),
                            buildLabel("Genre"),
                            buildDropdown(),

                            const SizedBox(height: 30),

                            SizedBox(
                              width: double.infinity,
                              height: 55,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color.fromARGB(
                                    194,
                                    255,
                                    255,
                                    255,
                                  ).withOpacity(0.3),
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                onPressed: () {
                                  if (namaController.text.isEmpty ||
                                      labelController.text.isEmpty ||
                                      selectedKategori == null) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          "Complete all fields & choose genre",
                                        ),
                                      ),
                                    );
                                    return;
                                  }

                                  final dataBaru = {
                                    "nama": namaController.text,
                                    "label": labelController.text,
                                    "harga": hargaController.text,
                                    "kategori": selectedKategori,
                                    "imagePath": imagePathController.text,
                                  };

                                  widget.onSave(dataBaru);
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  "SAVE DATA",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontWeight: FontWeight.bold,
                                    shadows: [
                                      Shadow(
                                        color: Color.fromARGB(76, 0, 0, 0),
                                        blurRadius: 10,
                                        offset: Offset(2, 2),
                                      ),
                                    ],
                                    letterSpacing: 2,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
```
Admin juga dilarang tidak mengisi beberapa field, sehingga akan muncul peringatan seperti di bawah ini.

<img width="959" height="1053" alt="image" src="https://github.com/user-attachments/assets/bd8ea076-5143-4558-ba3d-8798114b515c" />

## More Details ゛⸝⸝.ᐟ⋆

### Flutter Widget Architecture  .✦ ݁˖

Aplikasi dibangun menggunakan StatefulWidget untuk manajemen state sederhana, Navigator.push() untuk navigasi halaman, juga setState() untuk update UI secara cepat.

```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) =>
        FormPage(onSave: (b) => setState(() => items.add(b))),
  ),
);
```
### Browser Customize Personalized  .✦ ݁˖

Nama tab dan icon browser dapat dikonfigurasi melalui web/index.html untuk mengubah <title> dan web/favicon.png untuk mengganti logo tab browser sehingga aplikasi enak dilihat.

```dart
<title>Universal Music Group</title>
<link rel="icon" type="image/png" href="favicon.png">
```

<p align="center">
  <i>© 2026 - UMG Mobile by Putri. All rights reserved. </i>
</p>

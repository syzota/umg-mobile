import 'package:flutter/material.dart';
import 'dart:ui';

class FormPage extends StatefulWidget {
  final Function(Map<String, dynamic>) onSave;
  final Map<String, dynamic>? existingAlbum;

  const FormPage({super.key, required this.onSave, this.existingAlbum});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController labelController = TextEditingController();
  final TextEditingController hargaController = TextEditingController();
  final TextEditingController imagePathController = TextEditingController();

  String? selectedKategori;

  @override
  void initState() {
    super.initState();
    if (widget.existingAlbum != null) {
      namaController.text = widget.existingAlbum!["nama"] ?? "";
      labelController.text = widget.existingAlbum!["label"] ?? "";
      hargaController.text = widget.existingAlbum!["harga"] ?? "";
      imagePathController.text = widget.existingAlbum!["imagePath"] ?? "";
      selectedKategori = widget.existingAlbum!["kategori"];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  "https://images.unsplash.com/photo-1501612780327-45045538702b?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 15),

                  // Navbar //
                  glassContainer(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: Colors.white,
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                        const Text(
                          "Our Data",
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
                        const CircleAvatar(
                          radius: 16,
                          backgroundColor: Color.fromARGB(127, 255, 255, 255),
                          child: Icon(
                            Icons.person_rounded,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 40),

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

  // Container //

  Widget glassContainer({required Widget child, EdgeInsetsGeometry? padding}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.15),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white.withOpacity(0.3), width: 1),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: child,
        ),
      ),
    );
  }

  Widget buildLabel(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
    TextEditingController controller,
    IconData icon, {
    bool isNumber = false,
  }) {
    return TextField(
      controller: controller,
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.white),
        filled: true,
        fillColor: Colors.white.withOpacity(0.1),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.white.withOpacity(0.2)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.white),
        ),
      ),
    );
  }

  Widget buildDropdown() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.white.withOpacity(0.2)),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedKategori,
          hint: const Text(
            "Select Genre",
            style: TextStyle(color: Colors.white70),
          ),
          dropdownColor: const Color(0xFF1A1A1A),
          icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
          isExpanded: true,
          style: const TextStyle(color: Colors.white),
          items: [
            "Pop",
            "Rock",
            "R&B",
            "Jazz",
            "Hip Hop",
          ].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
          onChanged: (val) => setState(() => selectedKategori = val),
        ),
      ),
    );
  }
}

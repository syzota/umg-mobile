import 'package:flutter/material.dart';
import 'dart:ui';
import 'form.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedCategory = "All Genres";
  final List<Map<String, dynamic>> items = [];

  // Format Mata Uang USD
  String formatCurrency(String angka) {
    int value = int.tryParse(angka) ?? 0;
    return NumberFormat.currency(
      locale: 'en_US',
      symbol: '\$ ',
      decimalDigits: 0,
    ).format(value);
  }

  @override
  Widget build(BuildContext context) {
    List filteredItems = selectedCategory == "All Genres"
        ? items
        : items.where((item) => item["kategori"] == selectedCategory).toList();

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 15),

                  // navbar //
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

                  const SizedBox(height: 20),

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

                  Center(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          "All Genres",
                          "Pop",
                          "Rock",
                          "R&B",
                          "Jazz",
                          "Hip Hop",
                        ].map((e) => categoryChip(e)).toList(),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // card inputan album //
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

  // Reusable Widget //
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
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: child,
        ),
      ),
    );
  }

  Widget artistGlassCard(Map<String, dynamic> item, int realIndex) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: glassContainer(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            // 1. Input Cover Album //
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.circular(12),
                image: item["imagePath"] != null && item["imagePath"] != ""
                    ? DecorationImage(
                        image: NetworkImage(item["imagePath"]),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
              child: (item["imagePath"] == null || item["imagePath"] == "")
                  ? const Icon(
                      Icons.album_rounded,
                      color: Colors.white,
                      size: 30,
                    )
                  : null,
            ),

            const SizedBox(width: 15),

            // 2. Input info lain //
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Nama album //
                  Text(
                    item["nama"].toString().toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      letterSpacing: 1,
                      shadows: [
                        Shadow(
                          color: Colors.black45,
                          blurRadius: 8,
                          offset: Offset(1, 1),
                        ),
                      ],
                    ),
                  ),
                  // Artis //
                  Text(
                    item["label"] ?? "Unknown Artist",
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(height: 4),
                  // Sales //
                  Text(
                    formatCurrency(item["harga"]),
                    style: const TextStyle(
                      color: Colors.cyanAccent,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      shadows: [
                        Shadow(color: Colors.cyanAccent, blurRadius: 5),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // 3. Tombol update dan delete //
            Column(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.edit_note_rounded,
                    color: Colors.white70,
                  ),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FormPage(
                        existingAlbum: item,
                        onSave: (baru) =>
                            setState(() => items[realIndex] = baru),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.delete_outline_rounded,
                    color: Colors.white60,
                  ),
                  onPressed: () => setState(() => items.removeAt(realIndex)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget categoryChip(String text) {
    bool isSelected = selectedCategory == text;
    return GestureDetector(
      onTap: () => setState(() => selectedCategory = text),
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: isSelected
                    ? Colors.white.withOpacity(0.5)
                    : Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color: Colors.white.withOpacity(isSelected ? 0.6 : 0.2),
                ),
              ),
              child: Center(
                child: Text(
                  text,
                  style: TextStyle(
                    color: isSelected ? Colors.black87 : Colors.white,
                    fontWeight: isSelected
                        ? FontWeight.bold
                        : FontWeight.normal,
                    shadows: isSelected
                        ? []
                        : [
                            const Shadow(
                              color: Color.fromARGB(103, 0, 0, 0),
                              blurRadius: 4,
                              offset: Offset(1, 1),
                            ),
                          ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:p8/themeprovider.dart';
import 'package:p8/username_provider.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeprovider = Provider.of<Themeprovider>(context);
    final usernameProvider = Provider.of<UsernameProvider>(context);

    TextEditingController controller =
        TextEditingController(text: usernameProvider.username);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengaturan Tema & Username'),
        centerTitle: true,
      ),

      // ------------------- BODY BARU -------------------
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // CARD TEMA
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        Icon(Icons.dark_mode, size: 28),
                        SizedBox(width: 10),
                        Text("Mode Gelap", style: TextStyle(fontSize: 16)),
                      ],
                    ),
                    Switch(
                      value: themeprovider.isDarkMode,
                      onChanged: (value) {
                        themeprovider.toggleTheme(value);
                      },
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // CARD USERNAME INPUT
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Nama Pengguna",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: controller,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintText: "Masukkan nama...",
                      ),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          usernameProvider.saveUsername(controller.text);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Nama pengguna disimpan"),
                              behavior: SnackBarBehavior.floating,
                            ),
                          );
                        },
                        icon: const Icon(Icons.save),
                        label: const Text("Simpan"),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 25),

            // CARD MENAMPILKAN NAMA
            Card(
              color: Colors.blue.shade50,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    const Icon(Icons.account_circle, size: 40),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Text(
                        "Nama kamu: ${usernameProvider.username}",
                        style: const TextStyle(fontSize: 17),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

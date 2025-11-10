import 'package:flutter/material.dart';
import 'package:h1d023048_tugas6/ui/tampil_data.dart';

class FormData extends StatefulWidget {
  @override
  _FormDataState createState() => _FormDataState();
}

class _FormDataState extends State<FormData> {
  // Add a GlobalKey for the Form
  // uniquely identifies the Form and allows validation.
  final _formKey = GlobalKey<FormState>();

  final _namaController = TextEditingController();
  final _nimController = TextEditingController();
  final _tahunLahirController = TextEditingController();

  @override
  void dispose() {
    _namaController.dispose();
    _nimController.dispose();
    _tahunLahirController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Input Data')),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: _namaController,
                  decoration: InputDecoration(
                    labelText: 'Nama',
                    hintText: 'Masukkan nama lengkap',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nama tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _nimController,
                  decoration: InputDecoration(
                    labelText: 'NIM',
                    hintText: 'Masukkan NIM',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'NIM tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _tahunLahirController,
                  decoration: InputDecoration(
                    labelText: 'Tahun Lahir',
                    hintText: 'Contoh: 2000',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number, // Set keyboard type
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Tahun lahir tidak boleh kosong';
                    }
                    if (int.tryParse(value) == null) {
                      return 'Harus berupa angka';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      String nama = _namaController.text;
                      String nim = _nimController.text;
                      int tahunLahir = int.parse(_tahunLahirController.text);

                      int currentYear = DateTime.now().year;
                      int umur = currentYear - tahunLahir;

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              TampilData(nama: nama, nim: nim, umur: umur),
                        ),
                      );
                    }
                  },
                  child: Text('Simpan'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

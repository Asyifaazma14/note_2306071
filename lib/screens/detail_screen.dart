// lib/screens/detail_screen.dart

import 'package:flutter/material.dart';
import '../database/db_helper.dart';
import '../models/note_model.dart';

class DetailScreen extends StatefulWidget {
  final Note? note;
  const DetailScreen({super.key, this.note});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _title;
  late String _content;
  late String _category;
  late bool _isFavorite;

  final List<String> _categories = ['Hutang', 'Kuliah', 'Personal', 'Kerja'];

  @override
  void initState() {
    super.initState();
    _title = widget.note?.title ?? '';
    _content = widget.note?.content ?? '';
    _category = widget.note?.category ?? 'Personal';
    _isFavorite = widget.note?.isFavorite ?? false;
  }

  void _saveNote() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final note = Note(
        id: widget.note?.id,
        title: _title,
        content: _content,
        category: _category,
        isFavorite: _isFavorite,
        createdAt: widget.note?.createdAt ?? DateTime.now().toString(),
      );

      if (widget.note == null) {
        await DbHelper.instance.create(note);
      } else {
        await DbHelper.instance.update(note);
      }

      if (mounted) Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.note == null ? 'Tambah Catatan' : 'Edit Catatan'),
        actions: [
          IconButton(
            icon: Icon(
              _isFavorite ? Icons.star : Icons.star_border,
              color: Colors.amber,
            ),
            onPressed: () {
              setState(() {
                _isFavorite = !_isFavorite;
              });
            },
          ),
          IconButton(icon: const Icon(Icons.save), onPressed: _saveNote),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              DropdownButtonFormField<String>(
                value: _category,
                decoration: const InputDecoration(
                  labelText: 'Pilih Kategori',
                  border: OutlineInputBorder(),
                ),
                items: _categories.map((cat) {
                  return DropdownMenuItem(value: cat, child: Text(cat));
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _category = value!;
                  });
                },
              ),
              const SizedBox(height: 15),
              TextFormField(
                initialValue: _title,
                decoration: const InputDecoration(
                  labelText: 'Judul Catatan',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value == null || value.isEmpty
                    ? 'Judul tidak boleh kosong!'
                    : null,
                onSaved: (value) => _title = value!,
              ),
              const SizedBox(height: 15),
              TextFormField(
                initialValue: _content,
                decoration: const InputDecoration(
                  labelText: 'Isi Catatan',
                  border: OutlineInputBorder(),
                ),
                maxLines: 10,
                validator: (value) => value == null || value.isEmpty
                    ? 'Isi tidak boleh kosong!'
                    : null,
                onSaved: (value) => _content = value!,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

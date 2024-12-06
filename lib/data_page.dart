import 'package:flutter/material.dart';

class DataPage extends StatefulWidget {
  @override
  _DataPageState createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  List<Map<String, dynamic>> authors = [
    {'name': 'Author 1', 'books': 5},
    {'name': 'Author 2', 'books': 3},
    {'name': 'Author 3', 'books': 7},
  ];

  void deleteAuthor(int index) {
    setState(() {
      authors.removeAt(index);
    });
  }

  void editAuthor(int index, String newName, int newBooks) {
    setState(() {
      authors[index]['name'] = newName;
      authors[index]['books'] = newBooks;
    });
  }

  void showEditDialog(int index) {
    TextEditingController nameController =
        TextEditingController(text: authors[index]['name']);
    TextEditingController booksController =
        TextEditingController(text: authors[index]['books'].toString());

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Author'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: booksController,
                decoration: InputDecoration(labelText: 'Books'),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                editAuthor(
                  index,
                  nameController.text,
                  int.tryParse(booksController.text) ?? authors[index]['books'],
                );
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Page'),
      ),
      body: ListView.builder(
        itemCount: authors.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(authors[index]['name']),
              subtitle: Text('${authors[index]['books']} books'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () => showEditDialog(index),
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => deleteAuthor(index),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

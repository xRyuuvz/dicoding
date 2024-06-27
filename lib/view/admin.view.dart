import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kantinwisaga1/view/add.menu.view.dart';

import 'package:kantinwisaga1/view/edit.menu.view.dart';


class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  List<dynamic>? menus;

  @override
  void initState() {
    super.initState();
    _fetchMenus();
  }

  Future<void> _fetchMenus() async {
    var url = Uri.parse("http://localhost/phpflutter/get_menus.php");
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        setState(() {
          menus = data;
        });
      } else {
        print("Failed to load menus: ${response.statusCode}");
      }
    } catch (error) {
      print("Error loading menus: $error");
    }
  }

  void _deleteMenu(int index) async {
    try {
      var url = Uri.parse("http://localhost/phpflutter/delete_menu.php");
      var response = await http.post(url, body: {'id': menus![index]['id']});

      if (response.statusCode == 200) {
        setState(() {
          menus!.removeAt(index);
        });
        print("Menu deleted successfully");
      } else {
        throw Exception('Failed to delete menu');
      }
    } catch (e) {
      print('Error deleting menu: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Panel'),
      ),
      body: menus != null
          ? ListView.builder(
              itemCount: menus!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: menus![index]['image'] != null
                        ? CircleAvatar(
                            backgroundImage: NetworkImage(
                              "http://localhost/phpflutter/${menus![index]['image']}",
                            ),
                          )
                        : CircleAvatar(
                            child: Icon(Icons.fastfood),
                          ),
                    title: Text(menus![index]['name']),
                    subtitle: Text("\Rp.${menus![index]['price']}"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditMenuPage(data: menus![index]),
                              ),
                            ).then((_) {
                              _fetchMenus();
                            });
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Confirm"),
                                  content: Text("Are you sure you want to delete this menu?"),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text("Cancel"),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        _deleteMenu(index);
                                      },
                                      child: Text("Delete"),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddMenuPage()),
          ).then((_) {
            _fetchMenus();
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}





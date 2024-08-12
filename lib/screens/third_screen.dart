import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_internsuitmedia/provider/palindrome_provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ThirdScreen extends StatefulWidget {
  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  List<dynamic> users = [];
  bool isLoading = false;
  bool hasMore = true;
  int page = 1;

  @override
  void initState() {
    super.initState();
    _fetchUsers();
  }

  Future<void> _fetchUsers() async {
    if (isLoading) return;
    setState(() {
      isLoading = true;
    });

    final response = await http
        .get(Uri.parse('https://reqres.in/api/users?page=$page&per_page=10'));
    final data = json.decode(response.body);

    setState(() {
      users.addAll(data['data']);
      hasMore = data['page'] < data['total_pages'];
      isLoading = false;
      page++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Users')),
      body: users.isEmpty
          ? Center(child: Text('No users available'))
          : NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification scrollInfo) {
                if (!isLoading &&
                    hasMore &&
                    scrollInfo.metrics.pixels ==
                        scrollInfo.metrics.maxScrollExtent) {
                  _fetchUsers();
                }
                return false;
              },
              child: ListView.builder(
                itemCount: users.length + (isLoading ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index == users.length) {
                    return Center(child: CircularProgressIndicator());
                  }
                  final user = users[index];
                  return ListTile(
                    leading: CircleAvatar(
                        backgroundImage: NetworkImage(user['avatar'])),
                    title: Text('${user['first_name']} ${user['last_name']}'),
                    subtitle: Text(user['email']),
                    onTap: () {
                      Provider.of<PalindromeProvider>(context, listen: false)
                          .setSelectedUserName(
                              '${user['first_name']} ${user['last_name']}');
                      Navigator.of(context).pop();
                    },
                  );
                },
              ),
            ),
    );
  }
}

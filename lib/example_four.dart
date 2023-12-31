import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ExampleFour extends StatefulWidget {
  const ExampleFour({super.key});

  @override
  State<ExampleFour> createState() => _ExampleFourState();
}

class _ExampleFourState extends State<ExampleFour> {
  var data;
  Future<void> getUserApi() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString());
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Api Course'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.purple,
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getUserApi(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Loading...',
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    );
                  }
                  return ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Column(
                            children: [
                              ReusableRow(
                                  title: 'Name',
                                  value: data[index]['name'].toString()),
                              ReusableRow(
                                  title: 'Username',
                                  value: data[index]['username'].toString()),
                              ReusableRow(
                                  title: 'Email',
                                  value: data[index]['email'].toString()),
                              ReusableRow(
                                  title: 'Address',
                                  value: data[index]['address']['street']
                                      .toString()),
                              ReusableRow(
                                  title: 'Geo',
                                  value:
                                      data[index]['address']['geo'].toString()),
                              ReusableRow(
                                  title: 'Lat',
                                  value: data[index]['address']['geo']['lat']
                                      .toString()),
                              ReusableRow(
                                  title: 'Lng',
                                  value: data[index]['address']['geo']['lng']
                                      .toString()),
                            ],
                          ),
                        );
                      });
                }),
          ),
        ],
      ),
    );
  }
}

class ReusableRow extends StatelessWidget {
  final String title, value;
  const ReusableRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(value),
        ],
      ),
    );
  }
}

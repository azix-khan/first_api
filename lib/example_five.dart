// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Models/ProductsModel.dart';

class ExampleFive extends StatefulWidget {
  const ExampleFive({super.key});

  @override
  State<ExampleFive> createState() => _ExampleFiveState();
}

class _ExampleFiveState extends State<ExampleFive> {
  Future<ProductsModel> getProductsApi() async {
    final response = await http.get(
        Uri.parse('https://webhook.site/e799f31c-b92c-48fe-8bfe-59ccb0e72f1a'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return ProductsModel.fromJson(data);
    } else {
      return ProductsModel.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Api Course'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      // backgroundColor: Colors.purpleAccent,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
                child: FutureBuilder(
                    future: getProductsApi(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            itemCount: snapshot.data!.data!.length,
                            itemBuilder: (context, index) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ListTile(
                                    title: Text(snapshot
                                        .data!.data![index].shop!.name
                                        .toString()),
                                    subtitle: Text(snapshot
                                        .data!.data![index].shop!.description
                                        .toString()),
                                    trailing: Icon(
                                      Icons.shopping_bag,
                                      color: Colors.redAccent,
                                    ),
                                    leading: CircleAvatar(
                                      backgroundImage: NetworkImage(snapshot
                                          .data!.data![index].shop!.image
                                          .toString()),
                                    ),
                                  ),
                                  Container(
                                    height:
                                        MediaQuery.of(context).size.height * .3,
                                    width:
                                        MediaQuery.of(context).size.width * 1,
                                    child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: snapshot
                                            .data!.data![index].images!.length,
                                        itemBuilder: (context, position) {
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                                right: 10),
                                            child: Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .25,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .5,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: NetworkImage(
                                                          snapshot
                                                              .data!
                                                              .data![index]
                                                              .images![position]
                                                              .url
                                                              .toString()))),
                                            ),
                                          );
                                        }),
                                  ),
                                  Icon(
                                      snapshot.data!.data![index].inWishlist! ==
                                              false
                                          ? Icons.favorite
                                          : Icons.favorite_outline),
                                ],
                              );
                            });
                      } else {
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
                    }))
          ],
        ),
      ),
    );
  }
}

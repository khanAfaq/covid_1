import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Model/country.dart';

class CountriesListScreen extends StatefulWidget {
  const CountriesListScreen({super.key});

  @override
  State<CountriesListScreen> createState() => _CountriesListScreenState();
}

class _CountriesListScreenState extends State<CountriesListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 40.0,
            color: Colors.black,
          ),
        ),
      ),
      body: FutureBuilder(
          future: loadJson(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Country>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              throw const Text(
                  'Error occured while fetching data from json file');
            } else {
              List<Country> countries = snapshot.data as List<Country>;
              return ListView.builder(
                  itemCount: countries.length,
                  itemBuilder: (context, index) {
                    Country country = countries[index];
                    return Card(
                      elevation: 3,
                      child: ListTile(
                        leading: const CircleAvatar(
                          backgroundColor: Colors.cyan,
                          child: Text('Afaq'),
                        ),
                        title: Text(
                          country.name,
                          style: TextStyle(
                              fontSize: 20.0, color: Colors.grey[100]),
                        ),
                        subtitle: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Cases: ${country.cases} ',
                                  style: const TextStyle(color: Colors.orange),
                                ),
                                Text(
                                  'Died: ${country.died}',
                                  style: const TextStyle(color: Colors.red),
                                ),
                              ],
                            ),
                            Text('Recovered: ${country.recovered}'),
                          ],
                        ),
                      ),
                    );
                  });
            }
          }),
    );
  }
}

Future<List<Country>> loadJson() async {
  String jsonString = await rootBundle.loadString('images/data.json');
  List<dynamic> jsonList = json.decode(jsonString)['countires'];

  return jsonList.map((json) => Country.fromJson(json)).toList();
}

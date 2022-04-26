import 'package:flutter/material.dart';

class WhereFunction extends StatefulWidget {
 const WhereFunction({Key? key}) : super(key: key);

  @override
  State<WhereFunction> createState() => _WhereFunctionState();
}

class _WhereFunctionState extends State<WhereFunction> {

   List<Country> countries = [
    Country(
      country: "Switzerland",
      governinBody: 'Federal republic',
    ),
    Country(
      country: "Germany",
      governinBody: 'Federal democratic\'s republic',
    ),
    Country(
      country: "India",
      governinBody: 'Federal state',
    ),
    Country(
      country: "Kirgiziya",
      governinBody: 'Presidential-parlamentary republic',
    ),
    Country(
      country: "Ukraine",
      governinBody: 'Presidential-parlamentary republic',
    ),
    Country(
      country: "USA",
      governinBody: 'Presidential-parlamentary republic',
    ),
    Country(country: "England", governinBody: "Parliamentary monarchy"),
    Country(
      country: "Poland",
      governinBody: 'Presidential-parlamentary republic',
    ),
    Country(country: "Qatar", governinBody: 'Monarchy'),
    Country(country: "Tajikistan", governinBody: 'Presidential republic'),
    Country(
      country: "Cyprus",
      governinBody: 'Presidential republic',
    ),
  ];

  List<Country>? getCounrty;

  @override
  void initState() {
    getCounrty = countries;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title: const Text('Where Function'),
       centerTitle: true,
       ),
      body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(
                  helperText: 'Enter a country name',
                ),
                onChanged: (value) {
                  setState(() {
                    getCounrty = countries
                        .where((country) => country.country.contains(value))
                        .toList();
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                flex: 2,
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: getCounrty!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(getCounrty![index].country),
                        subtitle: Text(getCounrty![index].governinBody!),
                      );
                    }),
              ),
            ],
          ),
        ),
    );
  }
}

class Country {
  String country;
  String? governinBody;

  Country({required this.country, this.governinBody});
}
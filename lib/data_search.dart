import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate<String> {
  static const cities = [
    "Aguascalientes",
    "Mexicali",
    "La Paz",
    "Campeche",
    "Saltillo",
    "Colima",
    "Tuxtla Gutiérrez",
    "Chihuahua",
    "Ciudad de México",
    "Durango",
    "Guanajuato",
    "Chilpancingo de los Bravo",
    "Pachuca",
    "Guadalajara",
    "Toluca",
    "Morelia",
    "Cuernavaca",
    "Tepic",
    "Monterrey",
    "Oaxaca",
    "Puebla",
    "Querétaro",
    "Chetumal",
    "San Luis Potosí",
    "Culiacán",
    "Hermosillo",
    "Villahermosa",
    "Ciudad Victoria",
    "Tlaxcala",
    "Xalapa",
    "Mérida",
    "Zacatecas"
  ];

  List<String> recentCities = [];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (cities.contains(query) && !recentCities.contains(query)) {
      recentCities.insert(0, query);
    }
    return Center(
      child: Text(query),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty ? recentCities : cities.where((city) => city.toLowerCase().startsWith(query.toLowerCase())).toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        leading: const Icon(Icons.location_city),
        onTap: () {
          query = suggestionList[index];
          showResults(context);
        },
        title: RichText(
          text: TextSpan(
            text: suggestionList[index].substring(0, query.length),
            style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                text: suggestionList[index].substring(query.length),
                style: const TextStyle(color: Colors.green),
              ),
            ],
          ),
        ),
      ),
      itemCount: suggestionList.length,
    );
  }
}

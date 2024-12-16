import 'dart:convert';
import 'package:app/domain/models/city.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:diacritic/diacritic.dart';

class SelectCity extends StatefulWidget {
  final String? label;
  final City? value;
  final Function(City? type)? onChange;

  const SelectCity({super.key, this.onChange, this.value, this.label});

  @override
  State<SelectCity> createState() => _SelectCityState();
}

class _SelectCityState extends State<SelectCity> {
  City? _city;

  @override
  void initState() {
    super.initState();
    _city = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label ?? 'Origem',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 6),
          InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SelectValue(
                  value: _city,
                  onChange: (City? selectedCity) {
                    setState(() {
                      _city = selectedCity;
                    });
                    if (widget.onChange != null) {
                      widget.onChange!(_city);
                    }
                  },
                ),
              ),
            ),
            child: Container(
              height: 58,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black26),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: _city != null
                        ? Text(
                            '${_city!.name} - ${_city!.state}',
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          )
                        : const Text(
                            'Selecione a cidade',
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              color: Colors.black54,
                            ),
                          ),
                  ),
                  _city != null
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              _city = null;
                            });
                          },
                          icon: const Icon(
                            Icons.close,
                            size: 20,
                          ))
                      : Container(),
                  const Icon(Icons.expand_more_outlined)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SelectValue extends StatefulWidget {
  final City? value;
  final Function(City? type) onChange;

  const SelectValue({super.key, required this.onChange, this.value});

  @override
  State<SelectValue> createState() => _SelectValueState();
}

class _SelectValueState extends State<SelectValue> {
  List<City> cities = [];
  List<City> filteredCities = [];
  final TextEditingController _filterController = TextEditingController();
  Future<void> findCities() async {
    final String response =
        await rootBundle.loadString('assets/json/cities.json');
    List<dynamic> data = json.decode(response);
    setState(() {
      cities = data.map((item) => City.fromJson(item)).toList();
      filteredCities = cities;
    });
  }

  @override
  void initState() {
    super.initState();
    findCities();
    _filterController.addListener(() {
      filterCities();
    });
  }

  void filterCities() {
    String query = _filterController.text.toLowerCase();
    setState(() {
      filteredCities = cities.where((city) {
        String cityName = removeDiacritics(city.name.toLowerCase());
        String stateName = removeDiacritics(city.state.toLowerCase());
        return cityName.contains(query) || stateName.contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Selecione a cidade',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextField(
              controller: _filterController,
              decoration: InputDecoration(
                labelText: 'Filtrar cidade',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.black26),
                ),
                prefixIcon: const Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: filteredCities.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : ListView(
                    children: filteredCities
                        .map(
                          (city) => RadioListTile<City>(
                            title: Text('${city.name} - ${city.state}'),
                            value: city,
                            groupValue: widget.value,
                            onChanged: (City? selectedCity) {
                              widget.onChange(selectedCity);
                              Navigator.pop(context);
                            },
                          ),
                        )
                        .toList(),
                  ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class DropdownField extends StatelessWidget {
  final TextEditingController dropdownController;
  final String? selectedCountry;
  final List<String>? countries ;
  final ValueChanged<String?>? onchanged;
  const DropdownField({super.key, required this.dropdownController, this.selectedCountry,  this.countries, this.onchanged  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'País',
                ),
                initialValue: selectedCountry,
                hint: const Text('Seleccione su país'),
                items: countries?.map((selectedCountry) {
                  return DropdownMenuItem(
                    value: selectedCountry,
                    child: Text(selectedCountry),
                  );
                }).toList(),
                onChanged: onchanged,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor seleccione un país';
                  }
                  return null;
                },
              );
  }
}
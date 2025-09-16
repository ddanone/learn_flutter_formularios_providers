import 'package:flutter/material.dart';

class PhoneField extends StatelessWidget {
  final TextEditingController phoneController;
  const PhoneField({super.key, required this.phoneController});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Teléfono',
                  hintText: '666552233',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor escriba su teléfono';
                  }
                  if(!RegExp(r'^\d{9}$').hasMatch(value)) {
                    return 'Por favor escriba un teléfono valido';
                  }
                  return null;
                },
              );
  }
}
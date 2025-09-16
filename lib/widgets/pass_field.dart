import 'package:flutter/material.dart';

class PassField extends StatelessWidget {
  final TextEditingController passController;
  const PassField({super.key, required this.passController});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
                controller: passController,
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  //border: OutlineInputBorder(),
                  labelText: 'Contraseña',
                  //hintText: '********',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor escriba una contraseña';
                  }
                  if(!RegExp(r'^.{3}$').hasMatch(value)) {
                    return 'Por favor escriba una contraseña válida';
                  }
                  return null;
                },
              );
  }
}
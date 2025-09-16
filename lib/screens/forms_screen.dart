import 'package:flutter/material.dart';
import 'package:formularios_providers/providers/form_provider.dart';
import 'package:formularios_providers/widgets/dropdown.dart';
import 'package:formularios_providers/widgets/email_field.dart';
import 'package:formularios_providers/widgets/name_field.dart';
import 'package:formularios_providers/widgets/pass_field.dart';
import 'package:formularios_providers/widgets/phone_field.dart';
import 'package:formularios_providers/widgets/terms_checkbox.dart';
import 'package:provider/provider.dart';

class FormsScreen extends StatefulWidget {
  const FormsScreen({super.key});

  @override
  State<FormsScreen> createState() => _FormsScreenState();
}

class _FormsScreenState extends State<FormsScreen> {

  final _formKey = GlobalKey<FormState>();

/*
// Controladores para los campos
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  bool _isAccept = false;
*/
  String? _selectedCountry;

  List<String> countries = [
    'España',
    'Francia',
    'Italia',
    'Alemania',
    'Portugal',
  ];

  @override
  Widget build(BuildContext context) {
    // Declarar el provider
    final formProvider = Provider.of<FormProvider>(context);
  

    return Scaffold(
      appBar: AppBar(
        title: const Text('Forms Screen'),
      ),
      //body: Padding(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // Country Dropdown
              //------------------------------------------------
              DropdownField(
                dropdownController: formProvider.dropdownController, 
                selectedCountry: _selectedCountry, 
                countries: countries, 
                onchanged: (value) {
                  setState(() {
                    _selectedCountry = value;
                  });
                },
              ),

              const SizedBox(height: 20),


              // Nombre
              //------------------------------------------------
              NameField(nameController: formProvider.nameController), // Usando el widget NameField con el controlador del provider

              SizedBox(height: 20.0),

              


              // Email
              //------------------------------------------------
              EmailField(emailController:   formProvider.emailController), // Usando el widget EmailField con el controlador del provider

              SizedBox(height: 20.0),              



              // Telefono
              //--------------------------------------------------------
              PhoneField(phoneController:   formProvider.phoneController), // Usando el widget PhoneField con el controlador del provider

              const SizedBox(height: 20),



              // Contraseña
              //--------------------------------------------------------
              PassField(passController: formProvider.passController), // Usando el widget PassField con el controlador del provider

              const SizedBox(height: 20),



              // Términos y condiciones
              //--------------------------------------------------------
              TermsCheckbox(value:  formProvider.isAccept, onChanged: (bool? newValue) {
                setState(() {
                  formProvider.toogleAccept();
                });
              }),


              if( !formProvider.isAccept )
                const Text(
                  'Debe aceptar los términos y condiciones',
                  style: TextStyle(color: Colors.red),
                ),


              SizedBox(height: 20),


              // Boton Enviar
              //--------------------------------------------------------
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate() && formProvider.isAccept) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Procesando datos')),
                    );
                  }else if( !formProvider.isAccept ) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Debe aceptar los términos y condiciones')),
                    );                    
                  } 
                },
                child: const Text('Enviar'),
              ),

            ]
          )
        )
      )
    );
  }
}


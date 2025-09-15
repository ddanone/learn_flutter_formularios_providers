import 'package:flutter/material.dart';
import 'package:formularios_providers/providers/form_provider.dart';
import 'package:formularios_providers/widgets/name_field.dart';
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


              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Seleccione un país',
                ),
                initialValue: _selectedCountry,
                hint: const Text('Seleccione su país'),
                items: countries.map((country) {
                  return DropdownMenuItem(
                    value: country,
                    child: Text(country),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedCountry = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor seleccione un país';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),




              // Nombre
              //------------------------------------------------
              /*
              TextFormField(
                controller: _nameController,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  labelText: "Nombre",
                  hintText: 'Introduzca su nombre',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ponga su nombre';
                  }
                  return null;
                },
              ),
              */

              //NameField(nameController: _nameController), // Usando el widget NameField con el controlador
              NameField(nameController: formProvider.nameController), // Usando el widget NameField con el controlador del provider


              SizedBox(height: 20.0),

              


              // Email
              //------------------------------------------------
              TextFormField(
                controller: formProvider.emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: "Email",
                  hintText: 'Introduzca su email',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor escriba su email';
                  }
                  if(!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Por favor escriba un email valido';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.0),              


              // Telefono
              //--------------------------------------------------------
              TextFormField(
                controller: formProvider.phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Introduce tu teléfono',
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
              ),
              const SizedBox(height: 20),


              // Contraseña
              //--------------------------------------------------------
              TextFormField(
                controller: formProvider.passController,
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  //border: OutlineInputBorder(),
                  labelText: 'Introduce tu contraseña',
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
              ),
              const SizedBox(height: 20),



              // Términos y condiciones
              //--------------------------------------------------------

  /*
              Row(
                children: [
                  Checkbox(
                    value: _isAccept,
                    onChanged: (bool? newValue) {
                      setState(() {
                        _isAccept = newValue ?? false;
                      });
                    },
                    //checkColor: Color(  0x00FFFFFF),
                  ),
                  const Text('Acepto los términos y condiciones'),
                ],
              ),
*/
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


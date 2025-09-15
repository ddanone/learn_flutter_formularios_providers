import 'package:flutter/material.dart';
import 'package:formularios_providers/screens/forms_screen.dart';
import 'package:provider/provider.dart';
import 'package:formularios_providers/providers/form_provider.dart';

void main() {
  runApp(
    MultiProvider(providers:  [
      ChangeNotifierProvider(create: (_) => FormProvider() ),
    ], 
    child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Formulario",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      //showSemanticsDebugger: true,
      /*
      home: Scaffold(
        appBar: AppBar(
          title: Text('Formulario'),
        ),
      */
      home: FormsScreen(),

     
    );
  }
}

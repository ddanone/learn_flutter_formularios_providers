import "package:flutter/material.dart";
//import 'package:provider/provider.dart';


class FormProvider extends ChangeNotifier {


// Controladores para los campos
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  bool _isAccept = false;

  bool isValidForm = false;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();



  bool validateForm(GlobalKey<FormState> formKey) {

    if( formKey.currentState!.validate() && _isAccept ) {
      isValidForm = true;
    } else {
      isValidForm = false;
    }
    return isValidForm;

    //return formKey.currentState?.validate() ?? false;
  }


  void toogleAccept() {
    _isAccept = !_isAccept;
    notifyListeners();
  }


  void resetForm() {
    _passController.clear();
    _emailController.clear();
    _nameController.clear();
    _phoneController.clear();
    _isAccept = false;
    isValidForm = false;
    formKey = GlobalKey<FormState>();
    notifyListeners();
  }

  TextEditingController get passController => _passController;
  TextEditingController get emailController => _emailController;
  TextEditingController get nameController => _nameController;
  TextEditingController get phoneController => _phoneController;

  bool get isAccept => _isAccept;






}


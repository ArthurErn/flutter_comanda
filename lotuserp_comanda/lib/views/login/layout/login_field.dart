import 'package:flutter/material.dart';
import 'package:ifood_flutter_clone/views/login/layout/textfield_layout.dart';
import 'login_dropdown.dart';

bool lembrar = false;

//LOGIN FIELD
class LoginField extends StatelessWidget {
  const LoginField({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(35)),
                border: Border.all(color: Colors.grey[350], width: .8)),
            child: DropdownButtonHideUnderline(child: Dropdown()),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          buildTextField(
              context, Icons.person_outline, 'Usuário', false, null),
          buildTextField(
              context, Icons.lock_outlined, 'Senha', true, null),
          SizedBox(height: MediaQuery.of(context).size.height * 0.015),
          
        ],
      ),
    );
  }
}

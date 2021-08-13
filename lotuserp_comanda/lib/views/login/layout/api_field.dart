import 'package:flutter/material.dart';
import 'package:ifood_flutter_clone/views/login/layout/textfield_layout.dart';

//API FIELD
class ApiField extends StatelessWidget {
  const ApiField({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          buildTextField(context, Icons.meeting_room_outlined, 'IP/Porta',
              false, null),
          SizedBox(
            height: 15,
          ),
          buildTextField(context, Icons.admin_panel_settings,
              'Insira o usuário', false, null),
          SizedBox(
            height: 15,
          ),
          buildTextField(
              context, Icons.lock_open, 'Insira a senha', true, null)
        ],
      ),
    );
  }
}

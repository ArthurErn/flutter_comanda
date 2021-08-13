import 'package:flutter/material.dart';
import '../login_page.dart';

int descontoIndividual;

class Dropdown extends StatefulWidget {
  @override
  DropdownState createState() => DropdownState();
}

GlobalKey formKey = GlobalKey<FormState>();

class DropdownState extends State<Dropdown> {
  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: DropdownButton(
          isExpanded: true,
          hint: Text(
            'SELECIONE UM SERVIÇO',
            style: TextStyle(color: Colors.black),
          ),
          value: selecionado,
          items: item.map((selecionado) {
            return DropdownMenuItem(
              value: selecionado != null ? selecionado : "SELECIONE UM SERVIÇO",
              child: Text(
                selecionado.fantasia,
                style: TextStyle(color: Colors.black),
              ),
            );
          }).toList(),
          onChanged: (valorNovo) {
            setState(() {
              selecionado = valorNovo;
            });
          },
        ));
  }
}

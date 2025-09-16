import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:primeiro/Screens/home_screen.dart';
import 'package:primeiro/Widgets/custom_loading_button.dart';
import 'package:primeiro/Widgets/custom_text_field.dart';

class CnpjForm extends StatefulWidget {
  const CnpjForm({super.key, required this.togglePlay});
  final VoidCallback togglePlay;

  @override
  State<CnpjForm> createState() => _CnpjFormState();
}

final cnpjFormatter = MaskTextInputFormatter(
  mask: "##.###.###/####-##",
  filter: {"#": RegExp(r'[0-9]')},
);

class _CnpjFormState extends State<CnpjForm> {
  final _formGlobalKey = GlobalKey<FormState>();

  String _cnpj = "";

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formGlobalKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Customtextfield(
            label: "Digite seu CNPJ",
            validator: (value) {
              if (value == null || value.isEmpty || value.length < 18) {
                return "Preencha o campo acima";
              }
              return null;
            },
            formatters: [cnpjFormatter],
            onSaved: (value) {
              _cnpj = value!;
            },
          ),
          CustomLoadingButton(
            title: "Entrar",
            onTap: () async {
              await Future.delayed(Duration(milliseconds: 1800));
              if (_formGlobalKey.currentState!.validate()) {
                _formGlobalKey.currentState!.save();
                if (_cnpj == "00.000.000/0000-00") {
                  widget.togglePlay();
                  await Future.delayed(Duration(milliseconds: 4000));
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (ctx) => HomeScreen()),
                  );
                }
              }
            },
          ),
        ],
      ),
    );
  }
}

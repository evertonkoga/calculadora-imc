import 'package:flutter/material.dart';
import 'package:calculadora_imc/pages/imc.dart';
import 'package:calculadora_imc/widgets/app_button.dart';
import 'package:calculadora_imc/widgets/app_text_field.dart';

class ImcPage extends StatefulWidget {
  final con = "Informe seus dados";
  @override
  _ImcPageState createState() => _ImcPageState();
}

class _ImcPageState extends State<ImcPage> {
  var _formKey = GlobalKey<FormState>();
  final _weightController = TextEditingController();
  final _heightController = TextEditingController();

  String _labelResult;

  @override
  void initState() {
    super.initState();
    _labelResult = widget.con;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de IMC'),
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            tooltip: "Limpa formulário",
            onPressed: _onClickCleanForm,
          )
        ],
      ),
      body: _body(),
    );
  }

  _body() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Icon(
              Icons.import_contacts,
              size: 120,
              color: Colors.teal,
            ),
            AppTextField(
              "Peso (kg)",
              hint: "Infome o peso ex: 65.8",
              controller: _weightController,
              validator: _validateWeight,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            SizedBox(height: 10),
            AppTextField(
              "Altura (cm)",
              hint: "Infome a altura ex: 1.65",
              controller: _heightController,
              validator: _validateHeight,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: AppButton(
                "Calcular",
                onPressed: _onClickCalculateIMC,
              ),
            ),
            Text(
              _labelResult,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.teal,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _validateHeight(value) {
    if (value.isEmpty) {
      return "Informe a altura.";
    }
    try {
      double.parse(value);
    } catch (Exception) {
      return "Informe um valor válido";
    }
    return null;
  }

  String _validateWeight(value) {
    if (value.isEmpty) {
      return "Informe o peso.";
    }
    try {
      double.parse(value);
    } catch (Exception) {
      return "Informe um valor válido";
    }
    return null;
  }

  void _onClickCalculateIMC() {
    if (!_formKey.currentState.validate()) {
      return;
    }

    final weight = double.parse(_weightController.text);
    final height = double.parse(_heightController.text);
    final imc = Imc(height, weight);
    imc.calculateIMC();

    setState(() {
      _labelResult = imc.getClassificationIMC();
    });
  }

  void _onClickCleanForm() {
    _weightController.text = "";
    _heightController.text = "";
    _formKey = GlobalKey<FormState>();

    setState(() {
      _labelResult = widget.con;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _weightController.dispose();
    _heightController.dispose();
  }
}

class Imc {

  double _imc;
  double _height;
  double _weight;

  Imc._(){}

  Imc(this._height, this._weight);

  calculateIMC() {
    final imcResult = _weight / (_height * _height);
    _imc = double.parse(imcResult.toStringAsPrecision(3));
    return _imc;
  }

  getClassificationIMC() {
    StringBuffer stringBuffer = StringBuffer("IMC: $_imc ");
    if (_imc < 18.5)
      stringBuffer.write("Magreza");
    else if (_imc >= 18.5 && _imc <= 24.9)
      stringBuffer.write("Normal");
    else if (_imc >= 25.0 && _imc <= 29.9)
      stringBuffer.write("Sobrepeso");
    else if (_imc >= 30.0 && _imc <= 39.9)
      stringBuffer.write("Obesidade");
    else if (_imc > 40) stringBuffer.write("Obesidade Grave");

    return stringBuffer.toString();
  }
}
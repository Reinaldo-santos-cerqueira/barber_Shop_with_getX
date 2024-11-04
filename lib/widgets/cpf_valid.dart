class Cpfvalid {
  bool validate(String cpf) {
    if (!_isValidFormat(cpf)) {
      return false;
    }

    return _validateCpfDigits(cpf);
  }

  bool _isValidFormat(String cpf) {
    return cpf.length == 11 && !RegExp(r'^(\d)\1{10}$').hasMatch(cpf);
  }

  bool _validateCpfDigits(String cpf) {
    for (int t = 9; t < 11; t++) {
      int d = 0;
      for (int c = 0; c < t; c++) {
        d += int.parse(cpf[c]) * ((t + 1) - c);
      }
      d = (d * 10) % 11;
      if (d == 10) d = 0;
      if (int.parse(cpf[t]) != d) {
        return false;
      }
    }
    return true;
  }
}


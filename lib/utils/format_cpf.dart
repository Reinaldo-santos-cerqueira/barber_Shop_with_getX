String formatCpf(String cpf){
  String cpfFormated;
  if(cpf.contains('.')){
    if(cpf.contains('-')){
      cpfFormated = cpf.replaceAll(".", "");
      cpfFormated = cpfFormated.replaceAll("-", "");
      return cpfFormated;
    }
  }
  return cpf;
}
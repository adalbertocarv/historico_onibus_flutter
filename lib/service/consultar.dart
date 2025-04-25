import 'dart:convert';

import 'package:historico_onibus/utils/latlong_polyline.dart';
import 'package:http/http.dart' as http;

class Consultar {
  final String linha;
  Consultar(this.linha);

  Future<void> consultarLinha(String linha) async {
    final response = await http.get(
      Uri.parse('https://mobilidade.semob.df.gov.br/espaciais/$linha'),
      headers: {
        'Authorization': 'Bearer kP\$7g@2n!Vx3X#wQ5^z',
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      final  List<dynamic> data = json.decode(response.body);
      return LatlongPolyline.fromJsonList(data);
    } else {
      return Future.error('Ocorreu algum erro');
    }
    print(response.body);
  }
}

//----------TESTE DE RETORNO -----------//

// void main() {
//   Consultar consultar = Consultar('0.110');

//   consultar.consultarLinha('0.110');
// }

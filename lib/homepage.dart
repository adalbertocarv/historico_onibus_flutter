import 'package:flutter/material.dart';
import 'package:historico_onibus/mapa.dart';
import './form.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Painel lateral esquerdo
        Container(
          width: 350,
          color: Colors.grey[100],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header com título e logo
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: DefaultTextStyle(
                        style: TextStyle(
                          fontWeight: FontWeight.w100,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                        child: Text(
                          'SECRETARIA DE TRANSPORTE E MOBILIDADE',
                        ),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(3.5),
                      child: const Image(
                        image: AssetImage('assets/images/logo.png'),
                        height: 40,
                      ),
                    ),
                  ],
                ),
              ),

              //formulário abaixo do título
              Formulario(),
            ],
          ),
        ),

        // Mapa do lado direito
        Expanded(
          child: Stack(
            children: [
              Mapa(),
            ],
          ),
        ),
      ],
    );
  }
}

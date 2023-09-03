import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_gymapp/_comum/minhas_cores.dart';
import 'package:flutter_gymapp/models/exercicio_modelo.dart';
import 'package:flutter_gymapp/models/sentimento_modelo.dart';

class ExercicioTela extends StatefulWidget {
  const ExercicioTela({super.key});

  @override
  State<ExercicioTela> createState() => _ExercicioTelaState();
}

class _ExercicioTelaState extends State<ExercicioTela> {
  Color color = MinhasCores.azulEscuro;

  final ExercicioModelo exercicioModelo = ExercicioModelo(
      id: "EX001",
      nome: "Remada Baixa Supinada",
      treino: "Treino A",
      comoFazer: "Segura a barra e puxa");

  final List<SentimentoModelo> listaSentimentos = [
    SentimentoModelo(
      id: "SE001",
      sentindo: "Pouca ativação hoje",
      data: "2023-05-28",
    ),
    SentimentoModelo(
      id: "SE001",
      sentindo: "Já senti alguma ativação",
      data: "2023-05-30",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        toolbarHeight: 72,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () => setState(() {
              color =
                  Colors.primaries[Random().nextInt(Colors.primaries.length)];
            }),
            icon: const Icon(Icons.palette),
            tooltip: "Temas",
          ),
        ],
        centerTitle: true,
        title: Column(
          children: [
            Text(
              exercicioModelo.nome,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            Text(
              exercicioModelo.treino,
              style: const TextStyle(fontSize: 15),
            ),
          ],
        ),
        backgroundColor: color,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: color,
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: ListView(
          children: [
            SizedBox(
              height: 250,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: color),
                    onPressed: () {},
                    child: const Text("Enviar foto"),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: color),
                    onPressed: () {},
                    child: const Text("Tirar foto"),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Como fazer?",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 8),
            Text(exercicioModelo.comoFazer),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Divider(color: Colors.black),
            ),
            const Text(
              "Como estou me sentindo?",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(listaSentimentos.length, (index) {
                SentimentoModelo sentimentoAgora = listaSentimentos[index];
                return ListTile(
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  title: Text(sentimentoAgora.sentindo),
                  subtitle: Text(sentimentoAgora.data),
                  leading: const Icon(Icons.double_arrow),
                  trailing: IconButton(
                    onPressed: () {
                      debugPrint("DELETAR ${sentimentoAgora.sentindo}");
                    },
                    icon: Icon(
                      Icons.delete,
                      color: color,
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

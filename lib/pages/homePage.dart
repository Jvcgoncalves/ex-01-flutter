import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  int generateRandomNumber() {
    return Random().nextInt(3);
  }

  void tapAvailableOption(int userChoice) {
    int botChoice = generateRandomNumber();
    if (botChoice == userChoice) {
      handleTheNavigation(0, userChoice, botChoice);
    } else if (botChoice == 0 && userChoice == 1) {
      handleTheNavigation(1, userChoice, botChoice);
    } else if (botChoice == 1 && userChoice == 2) {
      handleTheNavigation(1, userChoice, botChoice);
    } else if (botChoice == 2 && userChoice == 0) {
      handleTheNavigation(1, userChoice, botChoice);
    } else {
      handleTheNavigation(2, userChoice, botChoice);
    }
  }

  void handleTheNavigation(int status, int userChoice, int botChoice) {
    Navigator.pushNamed(context, "/result", arguments: {
      "status": status,
      "userChoice": userChoice,
      "botChoice": botChoice
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center ,
        mainAxisSize: MainAxisSize.min,
        spacing: 32,
        children: [
          Column(
            children: [
              Image.asset("assets/images/padrao.png"),
              Text("Faça a primeira jogada"),
            ],
          ),
          Row(
            spacing: 16,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => tapAvailableOption(0),
                child: Column(
                  children: [
                    Image.asset("assets/images/pedra.png", width: 80, height: 80),
                    Text("Pedra")
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => tapAvailableOption(1),
                child: Column(
                  children: [
                    Image.asset("assets/images/papel.png", width: 80, height: 80),
                    Text("Papel")
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => tapAvailableOption(2),
                child: Column(
                  children: [
                    Image.asset("assets/images/tesoura.png", width: 80, height: 80),
                    Text("Tesoura")
                  ]
                ),
              ),
            ],
          )
        ]
      ),
    );
  }
}

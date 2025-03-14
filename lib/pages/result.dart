import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _State();
}

class _State extends State<ResultPage> {
  String getImagePath(type) {
    switch (type) {
      case 0:
        return "assets/images/pedra.png";
      case 1:
        return "assets/images/papel.png";
      case 2:
        return "assets/images/tesoura.png";
      default:
        return "";
    }
  }

  String getResultStatus(int status) {
    switch (status) {
      case 0:
        return "Vocês empataram";
      case 1:
        return "Você venceu";
      case 2:
        return "Você perdeu";
      default:
        return "";
    }
  }

  String getMatchResult(int status) {
    switch (status) {
      case 0:
        return "assets/images/icons8-aperto-de-maos-100.png";
      case 1:
        return "assets/images/icons8-vitoria-48.png";
      case 2:
        return "assets/images/icons8-perder-48.png";
      default:
        return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    int status = args['status'];
    int botChoice = args['botChoice'];
    int userChoice = args['userChoice'];

    String botChoiceImage = getImagePath(botChoice);
    String userChoiceImage = getImagePath(userChoice);
    String resultStatus = getResultStatus(status);
    String matchResultImage = getMatchResult(status);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          spacing: 5,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Image.asset(botChoiceImage),
                Text("Escolha do APP")
              ],
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Image.asset(userChoiceImage),
                Text("Sua escolha")
              ],
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              spacing: 8,
              children: [
                Image.asset(matchResultImage, width: 100, height: 100,),
                Text(resultStatus),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                  ),
                  child: Text("Jogar novamente", style: TextStyle(color: Colors.white) ,),
                )
              ],
            )
          ],
        )
      ],
    );
  }
}

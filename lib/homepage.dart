import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //To add Icon Data
  Icon cross = Icon(
    Icons.cancel,
    size: 60,
  );
  Icon circle = Icon(
    Icons.circle,
    size: 60,
  );
  Icon edit = Icon(
    Icons.edit,
    size: 60,
  );

  //To Initialize Empty box
  bool isCross = true;
  late String message;
  late List<String> gameState;

  var index;

  @override
  void initState() {
    gameState = List.filled(9, "empty");
    this.message = "";
    super.initState();
  }

//To Play Game
  // ignore: non_constant_identifier_names
  PlayGame(int index) {
    if (this.gameState[index] == "empty") {
      setState(() {
        if (this.isCross) {
          this.gameState[index] = "cross";
        } else {
          this.gameState[index] = "circle";
        }
        isCross = !isCross;
        checkwin();
      });
    }
  }

//Reset Game
  resetGame() {
    setState(() {
      gameState = List.filled(9, "empty");
      this.message = "The Game was Succesfully Reset.";
    });
  }

  //To get icon Image
  getIcon(String title) {
    switch (title) {
      case ('empty'):
        return edit;
        // ignore: dead_code
        break;

      case ('cross'):
        return cross;
        // ignore: dead_code
        break;

      case ('circle'):
        return circle;
        // ignore: dead_code
        break;
    }
  }

  //to check for winning
  checkwin() {
    if ((gameState[0] != "empty") &&
        (gameState[0] == gameState[1]) &&
        (gameState[1] == gameState[2])) {
      setState(() {
        this.message = this.gameState[0] + " " + 'wins the game';
      });
    } else if ((gameState[3] != "empty") &&
        (gameState[3] == gameState[4]) &&
        (gameState[4] == gameState[5])) {
      setState(() {
        this.message = this.gameState[3] + " " + 'wins the game';
      });
    } else if ((gameState[6] != "empty") &&
        (gameState[6] == gameState[7]) &&
        (gameState[7] == gameState[8])) {
      setState(() {
        this.message = this.gameState[6] + " " + 'wins the game';
      });
    } else if ((gameState[0] != "empty") &&
        (gameState[0] == gameState[3]) &&
        (gameState[3] == gameState[6])) {
      setState(() {
        this.message = this.gameState[0] + " " + 'wins the game';
      });
    } else if ((gameState[1] != "empty") &&
        (gameState[1] == gameState[4]) &&
        (gameState[4] == gameState[7])) {
      setState(() {
        this.message = this.gameState[1] + " " + 'wins the game';
      });
    } else if ((gameState[2] != "empty") &&
        (gameState[2] == gameState[5]) &&
        (gameState[5] == gameState[8])) {
      setState(() {
        this.message = this.gameState[2] + " " + 'wins the game';
      });
    } else if ((gameState[0] != "empty") &&
        (gameState[0] == gameState[4]) &&
        (gameState[4] == gameState[8])) {
      setState(() {
        this.message = this.gameState[0] + " " + 'wins the game';
      });
    } else if ((gameState[2] != "empty") &&
        (gameState[2] == gameState[4]) &&
        (gameState[4] == gameState[6])) {
      setState(() {
        this.message = this.gameState[2] + " " + 'wins the game';
      });
    } else if (!gameState.contains("empty")) {
      setState(() {
        message = "Game Draw";
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tic Tac Toe'),
        centerTitle: true,
        backgroundColor: Colors.indigo[700],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: GridView.builder(
                padding: EdgeInsets.all(10),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.0,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: gameState.length,
                itemBuilder: (context, i) => SizedBox(
                    width: 100,
                    height: 100,
                    child: MaterialButton(
                      onPressed: () {
                        this.PlayGame(i);
                      },
                      child: getIcon(this.gameState[i]),
                    ))),
          ),
          Text(
            message,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.indigo[600],
                fontSize: 12),
          ),
          MaterialButton(
            color: Colors.indigo[700],
            onPressed: () => resetGame(),
            child: Text(
              "Reset Game",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "Developed By : Laxman Magarati",
            style: TextStyle(
              color: Colors.black45,
              fontSize: 14,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

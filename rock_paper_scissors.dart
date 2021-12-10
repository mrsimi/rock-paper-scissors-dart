import 'dart:io';
import 'dart:math';

enum Choice { ROCK, PAPER, SCISSORS }
enum Users { AI, PLAYER, NO, NONE }

Users WhoWon(Choice userChoice, Choice computerChoice) {
  if (userChoice == computerChoice) {
    return Users.NO;
  }
  if (userChoice == Choice.ROCK) {
    if (computerChoice == Choice.PAPER) {
      return Users.AI;
    } else {
      return Users.PLAYER;
    }
  }
  if (userChoice == Choice.PAPER) {
    if (computerChoice == Choice.SCISSORS) {
      return Users.AI;
    } else {
      return Users.PLAYER;
    }
  }
  if (userChoice == Choice.SCISSORS) {
    if (computerChoice == Choice.ROCK) {
      return Users.AI;
    } else {
      return Users.PLAYER;
    }
  } else {
    return Users.NONE;
  }
}

void main() {
  bool continuePlaying = true;
  int userWins = 0;
  int aiWins = 0;
  int totalGames = 0;

  while (continuePlaying) {
    print(r"Enter your choice ['rock', 'paper', 'scissors']: ");
    String? userInput = stdin.readLineSync();
    Random rand = new Random();
    var r2 = rand.nextInt(3);

    var computerChoice = Choice.values[r2];

    try {
      var result = Choice.values.firstWhere((element) =>
          element.toString().contains(userInput.toString().toUpperCase()));

      Choice userChoice = result;

      var output = WhoWon(userChoice, computerChoice);

      print('AI Choice: ${computerChoice.toString().split(".").last}');
      print('${output.toString().split(".").last} win');

      totalGames +=1;   

      if (output == Users.AI) {
        aiWins += 1;
      }
      if (output == Users.PLAYER) {
        userWins += 1;
      }

      print('You wanna continue playing, (y/N)? ');
      String? userContinue = stdin.readLineSync();

      if (userContinue.toString() != 'y') {
        print('AI won ${aiWins} games, Player won ${userWins} and Total games played was ${totalGames}');
        break;
      }
    } catch (e) {
      print('Invalid choice');
    }
  }
}

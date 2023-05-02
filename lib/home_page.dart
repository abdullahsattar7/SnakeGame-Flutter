import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:snake_game/blank_pixels.dart';
import 'package:snake_game/food_pixel.dart';
import 'package:snake_game/snake_pixel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}
enum SnakeDirection {  UP, DOWN,LEFT,RIGHT}

class _HomePageState extends State<HomePage> {

  // grid dimensions
  int rowSize=10;
  int totalSquares=100;
  bool gameHasStarted = false;
  // snakePosition
  List<int> snakePos = [0,1,2];
  // SNAKE DIRECTION IS INITIALLY TO THE RIGHT
  var currentDirection = SnakeDirection.RIGHT;
  // food Position
  int foodPos = 55;
  //user score
  int currentScore = 0;



  //start the game
  void startGame(){
    gameHasStarted=true;
    Timer.periodic(const Duration(milliseconds: 200), (timer) {
      setState(() {
        // keep the snake moving
        moveSnake();
        // snake is eating food
        eatFood();
        //check if the game is over
        if(gameOver()){
          timer.cancel();
          //display a message to the user
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context){
            return AlertDialog(
              title: const Text('𝙂𝙖𝙢𝙚 𝙊𝙫𝙚𝙧'),
              backgroundColor: Colors.lightBlueAccent,
              content: Text.rich(
                TextSpan(
                  text: '𝙔𝙤𝙪𝙧 𝙎𝙘𝙤𝙧𝙚 𝙞𝙨: ',style: const TextStyle(fontSize: 30),
                  children: <TextSpan>[
                    TextSpan(
                      text: '$currentScore',
                      style: const TextStyle(
                        color: Colors.redAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                onPressed: (){
                  Navigator.pop(context);
                  submitScore();
                  newGame();
                  startGame();
                },
                color: Colors.black,
                child: const Text('𝙍𝙚𝙨𝙩𝙖𝙧𝙩',style: TextStyle(color: Colors.white),),
              ),
              ],
            );
          });
        }
      });
    });
  }

  void submitScore(){
    //
  }
  void newGame(){
    setState(() {
      snakePos = [0,1,2];
      foodPos=55;
      currentDirection= SnakeDirection.RIGHT;
      gameHasStarted=false;
      currentScore=0;
    });
  }
  void eatFood(){

    // making sure the new food is not where the snake is
    while(snakePos.contains(foodPos)){
      foodPos = Random().nextInt(totalSquares);
    }
  }
  void moveSnake (){
    switch(currentDirection){
      case SnakeDirection.RIGHT:{
        // add a head
        // if snake in wall, need to re-adjust
        if(snakePos.last % rowSize == 9){
          snakePos.add(snakePos.last + 1 - rowSize);
        }else{
          snakePos.add(snakePos.last+1);
        }
      }
        break;
      case SnakeDirection.LEFT:{
        // add a head
        // if snake in wall, need to re-adjust
        if(snakePos.last % rowSize == 0){
          snakePos.add(snakePos.last - 1 + rowSize);
        }else{
          snakePos.add(snakePos.last - 1);
        }
      }
      break;
      case SnakeDirection.UP:{
        // add a head
        // if snake in wall, need to re-adjust
        if(snakePos.last < rowSize){
          snakePos.add(snakePos.last  - rowSize + totalSquares);
        }else{
          snakePos.add(snakePos.last - rowSize);
        }
      }
      break;
      case SnakeDirection.DOWN:{
        // add a head
        // if snake in wall, need to re-adjust
        if(snakePos.last + rowSize > totalSquares){
          snakePos.add(snakePos.last  + rowSize - totalSquares);
        }else{
          snakePos.add(snakePos.last + rowSize);
        }
      }
      break;
      default:
    }
    if(snakePos.last == foodPos){
      eatFood();
      currentScore++;
    }else {
      snakePos.removeAt(0);
    }
  }
  // game over
  bool gameOver(){
    // the game will be over when the snake runs into itself
    // this occurs when there's a duplicate position in the snake Position List
    // THIS LIST IS THE BODY OF THE SNAKE
    List<int> bodySnake = snakePos.sublist(0,snakePos.length-1);
    if(bodySnake.contains(snakePos.last)){
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.orange,
        body: Column(
          children: [
            // high scores
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //user current score
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('𝘾𝙪𝙧𝙧𝙚𝙣𝙩 𝙎𝙘𝙤𝙧𝙚',style:  TextStyle(color: Colors.black,fontSize: 30)),
                      Text(currentScore.toString(),style: const TextStyle(color: Colors.white,fontSize: 36,fontWeight: FontWeight.bold),),
                    ],
                  ),
                  //high score
                  // const Text('𝙃𝙞𝙜𝙝 𝙎𝙘𝙤𝙧𝙚',style:  TextStyle(color: Colors.white)),
                ],
              ),
            ),
            // game grid
            Expanded(
                flex: 3,
                child: GestureDetector(
                  onVerticalDragUpdate: (details){
                    if(details.delta.dy > 0 && currentDirection != SnakeDirection.UP){
                      currentDirection = SnakeDirection.DOWN;
                    }else if(details.delta.dy < 0 && currentDirection != SnakeDirection.DOWN){
                      currentDirection = SnakeDirection.UP;
                    }
                  },
                  onHorizontalDragUpdate: (details){
                    if(details.delta.dx > 0&& currentDirection != SnakeDirection.LEFT){
                      currentDirection = SnakeDirection.RIGHT;
                    }else if(details.delta.dx < 0 && currentDirection != SnakeDirection.RIGHT){
                      currentDirection = SnakeDirection.LEFT;
                    }
                  },
                  child: GridView.builder(
                    itemCount: totalSquares,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: rowSize),
                      itemBuilder: (context,index){
                        if(snakePos.contains(index)){
                          return const SnakePixel();
                        }else if(foodPos==index){
                          return const FoodPixel();
                        }
                        else{
                          return const BlankPixel();
                        }
                      }
                  ),
                ),
            ),
            // play Button
            Expanded(
              child: Container(
                child: Center(
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: gameHasStarted?Colors.grey:Colors.pink,
                    onPressed: gameHasStarted?(){}:startGame,
                    child: const Text('𝙋𝙡𝙖𝙮'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

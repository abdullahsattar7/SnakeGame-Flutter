<a href="https://flutter.dev/">
  <h1 align="center">
    <picture>
      <source media="(prefers-color-scheme: dark)" srcset="https://storage.googleapis.com/cms-storage-bucket/6e19fee6b47b36ca613f.png">
      <img alt="Flutter" src="https://storage.googleapis.com/cms-storage-bucket/c823e53b3a1a7b0d36a9.png">
    </picture>
  </h1>
</a>

# Snake Game

The snake game is a classic arcade-style game where the player controls a snake that moves around the screen, eating food and growing in length. The player must avoid running into walls or the snake's own tail, as this will end the game.

In this particular version of the snake game built with Flutter, the player controls the snake by swiping in the direction they want the snake to move. The game board is made up of a grid of squares, with the snake represented as a series of connected squares. Food appears randomly on the board for the snake to eat, and as the snake eats the food, it grows longer.

The game includes a scoring system, where the player earns points for eating food and can see their current score displayed on the screen. The game also includes a timer, where the speed of the snake increases over time, making the game more challenging as it progresses.

The game features a sleek, snake-themed design, with the snake and food graphics fitting the overall theme of the game. Additionally, the game includes sound effects and animations to enhance the player's experience.

# Features & Upcoming Features

✅ Snake Direction Using Gesture Detection

✅ Splash Screen

✅ Optimised For Mobile And Desktop

✅ Food randomly appears with animation and images

❌ Sound for different events

❌ Snake update with image

❌ Highscore in firebase

❌ Arrow Key Support for Desktop

❌ Introducing Different Difficulty Levels (Easy, Medium, Hard) snake speed increases

## Installation

Clone This Project

```bash
  git clone https://github.com/Smalick0478/SnakeGame-Flutter
```

Install Dependencies

```bash
  flutter pub get
```

Run

```bash
  flutter run
```

## Screenshots

<div style="display:flex; flex-direction:row;">
  <div class="flex-item" style="text-align: center;">
    <h3>Splash Screen</h3>
    <img src="https://github.com/Smalick0478/SnakeGame-Flutter/assets/20766696/d20da79b-fd41-41cd-a5af-824c2609bc83" alt="Splash Screen" style="width:33%;">
  </div>
  <div class="flex-item" style="text-align: center;">
    <h3>Game Board</h3>
    <img src="https://github.com/Smalick0478/SnakeGame-Flutter/assets/20766696/784b1049-7c60-45c8-b1ce-1d068d39af5d" alt="Game Board" style="width:33%;">
  </div>
  <div class="flex-item" style="text-align: center;">
    <h3>Game Over</h3>
    <img src="https://github.com/Smalick0478/SnakeGame-Flutter/assets/20766696/eb1e713f-57f8-47d4-9723-41b04973fa57" alt="Game Over" style="width:33%;">
  </div>
</div>

## FAQ

#### How to change snake speed direction

in Home_page.dart, startgame() function

```bash
Timer.periodic(const Duration(milliseconds: 350), (timer)
```

increase or decrease the timer according to your needs, by decreasing this timer snake speed increase and vice versa

#### How to change color of snake pixel

in Snake_pixel.dart,

```bash
BoxDecoration(
        border: Border.all(width: 2, color: Colors.black),
        color: Color.fromARGB(255, 116, 240, 121),
      ),
```

you can change the color of snake according to your needs

#### How to change images of food

in food_pixel.dart,

```bash
List<String> _foodImages = [
    'assets/food/apple.png',
    'assets/food/strawberry.png',
    'assets/food/pineapple.png',
    'assets/food/banana.png',
    'assets/food/grape.png'
  ];
```

Here you can add or remove images according to your needs

Donot forget to add - assets in pubspec.yaml

```bash
assets:
    - assets/
```

## License

[MIT](https://choosealicense.com/licenses/mit/)

## Contributing

Contributions are always welcome!

Fork This Project & let us know where we can work together

## License

MIT License

Copyright (c) [2023] [KHILJI]

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

## Authors

- [KHILJI](https://www.github.com/Smalick0478)
- [ABDULLAH SATTAR](https://www.github.com/abdullahsattar7)

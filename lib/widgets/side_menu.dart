import 'package:flutter/material.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  // Category selection flags
  bool menuPicked = false;
  bool scorePicked = false;
  bool nextTimePicked = false;
  bool favoritePicked = false;

  // Animation timing
  Duration buttonAnimationDuration = Duration(milliseconds: 900);
  Duration panelAnimationDuration = Duration(milliseconds: 600);

  // Button size
  double iconSize = 40;
  double notSelectedButtonWidth = 40;
  double selectedButtonWidth = 40 * 3;
  double buttonHeight = 40;

  // Category names
  String favoriteButtonName = '';
  String menuButtonName = '';
  String nextTimeButtonName = '';
  String scoresButtonName = '';

  @override
  Widget build(BuildContext context) {
    double sideSize = MediaQuery.of(context).size.width / 7;
    return AnimatedContainer(
      duration: panelAnimationDuration,
      curve: Curves.fastOutSlowIn,
      decoration: BoxDecoration(
        color: Color.fromRGBO(25, 0, 42, 1),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
      ),
      width: !menuPicked ? sideSize : sideSize * 3.2,
      height: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          buildMenuButton(),
          buildNextTimeButton(),
          buildScoreButton(),
          buildFavoriteButton()
        ],
      ),
    );
  }

  Widget buildMenuButton() {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: AnimatedContainer(
        duration: buttonAnimationDuration,
        curve: Curves.fastOutSlowIn,
        decoration: BoxDecoration(
          color: menuPicked ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  stringUpdater();
                  menuPicked = !menuPicked;
                  scorePicked = false;
                  favoritePicked = false;
                  nextTimePicked = false;
                });
              },
              icon: menuPicked
                  ? Icon(
                      Icons.arrow_forward_ios,
                      color: Color.fromRGBO(25, 0, 42, 1),
                    )
                  : Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
            ),
            Text(
              menuButtonName,
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: Color.fromRGBO(25, 0, 42, 1),
                  fontSize: 20),
            )
          ],
        ),
      ),
    );
  }

  Widget buildScoreButton() {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: AnimatedContainer(
        duration: buttonAnimationDuration,
        curve: Curves.fastOutSlowIn,
        decoration: BoxDecoration(
          color: scorePicked ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  scorePicked = !scorePicked;
                  nextTimePicked = false;
                  favoritePicked = false;
                });
              },
              icon: Icon(
                Icons.star,
                color: !scorePicked ? Colors.white : Color.fromRGBO(25, 0, 42, 1),
              ),
            ),
            Text(
              scoresButtonName,
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: !scorePicked
                      ? Colors.white
                      : Color.fromRGBO(25, 0, 42, 1),
                  fontSize: 20),
            )
          ],
        ),
      ),
    );
  }

  Widget buildNextTimeButton() {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: AnimatedContainer(
        duration: buttonAnimationDuration,
        curve: Curves.fastOutSlowIn,
        decoration: BoxDecoration(
          color: nextTimePicked ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  nextTimePicked = !nextTimePicked;
                  scorePicked = false;
                  favoritePicked = false;
                });
              },
              icon: Icon(
                Icons.schedule,
                color:
                    !nextTimePicked ? Colors.white : Color.fromRGBO(25, 0, 42, 1),
              ),
            ),
            Text(
              nextTimeButtonName,
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: !nextTimePicked
                      ? Colors.white
                      : Color.fromRGBO(25, 0, 42, 1),
                  fontSize: 20),
            )
          ],
        ),
      ),
    );
  }

  Widget buildFavoriteButton() {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: AnimatedContainer(
        duration: buttonAnimationDuration,
        curve: Curves.fastOutSlowIn,
        decoration: BoxDecoration(
          color: favoritePicked ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  favoritePicked = !favoritePicked;
                  scorePicked = false;
                  nextTimePicked = false;
                });
              },
              icon: Icon(
                Icons.favorite,
                color: !favoritePicked
                    ? Colors.white
                    : Color.fromRGBO(25, 0, 42, 1),
              ),
            ),
            Text(
              favoriteButtonName,
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: !favoritePicked
                      ? Colors.white
                      : Color.fromRGBO(25, 0, 42, 1),
                  fontSize: 20),
            )
          ],
        ),
      ),
    );
  }

  void stringUpdater(){
    if (!menuPicked){
      Future.delayed(panelAnimationDuration, (){
        setState(() {
          favoriteButtonName = 'избранное';
          menuButtonName = 'меню';
          nextTimeButtonName = 'посмотреть';
          scoresButtonName = 'оценки';
        });
      });
    } else {
      setState(() {
        favoriteButtonName = '';
        menuButtonName = '';
        nextTimeButtonName = '';
        scoresButtonName = '';
      });
    }

  }

}

import 'package:flutter/material.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  bool menuPicked = false;
  bool scorePicked = false;
  bool nextTimePicked = false;
  bool favoritePicked = false;

  @override
  Widget build(BuildContext context) {
    double sideSize = MediaQuery.of(context).size.width / 7;
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
      decoration: BoxDecoration(
        color: Color.fromRGBO(25, 0, 42, 1),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
      ),

      width: !menuPicked ? sideSize : sideSize * 3,
      height: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
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

  Widget buildMenuButton(){
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: menuPicked ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: IconButton(
          onPressed: (){
            setState(() {
              menuPicked = !menuPicked;
              scorePicked = false;
              favoritePicked = false;
              nextTimePicked = false;
            });
          },
          icon: Icon(Icons.menu, color: !menuPicked ? Colors.white : Color.fromRGBO(25, 0, 42, 1),),
        ),
      ),
    );
  }

  Widget buildScoreButton(){
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: scorePicked ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: IconButton(
          onPressed: (){
            setState(() {
              scorePicked = !scorePicked;
              menuPicked = false;
              nextTimePicked = false;
              favoritePicked = false;
            });
          },
          icon: Icon(Icons.star, color: !scorePicked ? Colors.white : Color.fromRGBO(25, 0, 42, 1),),
        ),
      ),
    );
  }

  Widget buildNextTimeButton(){
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: nextTimePicked ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: IconButton(
          onPressed: (){
            setState(() {
              nextTimePicked = !nextTimePicked;
              menuPicked = false;
              scorePicked = false;
              favoritePicked = false;
            });
          },
          icon: Icon(Icons.schedule, color: !nextTimePicked ? Colors.white : Color.fromRGBO(25, 0, 42, 1),),
        ),
      ),
    );
  }

  Widget buildFavoriteButton(){
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: favoritePicked ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: IconButton(
          onPressed: (){
            setState(() {
              favoritePicked = !favoritePicked;
              menuPicked = false;
              scorePicked = false;
              nextTimePicked = false;
            });
          },
          icon: Icon(Icons.favorite, color: !favoritePicked ? Colors.white : Color.fromRGBO(25, 0, 42, 1),),
        ),
      ),
    );
  }
}

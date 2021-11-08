import 'package:flutter/material.dart';
import 'package:shopify/Screen/Components/colors.dart';

class Bottomappbar extends StatefulWidget {
  const Bottomappbar({Key? key}) : super(key: key);

  @override
  _BottomappbarState createState() => _BottomappbarState();
}

class _BottomappbarState extends State<Bottomappbar> {
  double borderradius = 32;
  int isiconselected = 0;
  int midicon = 2;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.075,
      decoration: BoxDecoration(
        boxShadow: boxshadow,
        color: white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(borderradius),
            topRight: Radius.circular(borderradius)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ListView.builder(
            itemCount: icon.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return SizedBox(
                width: MediaQuery.of(context).size.width * 0.18,
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      if (isiconselected != midicon) {
                        isiconselected = index;
                      } else {
                        isiconselected = 0;
                      }
                    });
                  },
                  icon: Icon(
                    icon[index],
                    color: midicon == index
                        ? primary.withOpacity(0.0)
                        : isiconselected == index
                            ? primary
                            : grey,
                  ),
                ),
              );
            },
          ),

          // IconButton(
          //   onPressed: () {},
          //   icon: Icon(
          //     Icons.home,
          //     color: primary,
          //   ),
          // ),
          // IconButton(
          //   onPressed: () {},
          //   icon: Icon(
          //     Icons.favorite,
          //     color: primary,
          //   ),
          // ),
          // Container(
          //   width: 10,
          // ),
          // IconButton(
          //   onPressed: () {},
          //   icon: Icon(
          //     Icons.task,
          //     color: primary,
          //   ),
          // ),
          // IconButton(
          //   onPressed: () {},
          //   icon: Icon(
          //     Icons.home,
          //     color: primary,
          //   ),
          // ),
        ],
      ),
    );
  }
}

List<IconData> icon = [
  Icons.home,
  Icons.favorite,
  Icons.circle,
  Icons.task,
  Icons.person,
];

Widget floatingbutton() {
  return FloatingActionButton(
    backgroundColor: primary,
    foregroundColor: white,
    onPressed: () {},
    child: Icon(
      Icons.shopping_bag_outlined,
    ),
  );
}

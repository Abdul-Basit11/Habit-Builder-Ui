import 'package:flutter/material.dart';

import '../../../../../../configuration/front_end_config.dart';



class BookMarkContainer extends StatelessWidget {
  const BookMarkContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: 55,

      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Container(
            padding: EdgeInsets.all(6),
            height: 48,
            width: 48,

            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8)
            ),
            child: Center(
              child: Image.asset('assets/images/book_mark_logo.png'),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Container(

              height: 20,
              width: 20,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: FrontEndCngig.kHabitColor
              ),
              child: Icon(Icons.add,size:18,color: Colors.white,),
            ),
          )


        ],
      ),
    );
  }
}

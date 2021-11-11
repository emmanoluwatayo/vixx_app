import 'package:flutter/material.dart';
import 'package:vixx_app/Config/Style.dart';

class AccountWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color color;
  final String image;

  AccountWidget({
     this.onPressed,
     this.text,
     this.color,
     this.image,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Color(0xffE9E9E9)), borderRadius: BorderRadius.circular(8)),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        child: Row(
          children: <Widget>[
            Image.asset(image, height: 30,),
            SizedBox(width: 17,),
            Text(text,  style: setStyleContent(context,color,15,FontWeight.normal),),
            Spacer(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 9),
              child:Icon(Icons.arrow_forward,color: color,),
            ),
          ],
        ),
      ),
    );
  }
}
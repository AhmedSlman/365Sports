import 'package:flutter/material.dart';
import 'package:sportat/widgets/custom_text.dart';

class CommentCard extends StatelessWidget {
  final String? image,name,date,time,content;



  const CommentCard({Key? key, this.image, this.name, this.date, this.time, this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ListTile(
      minVerticalPadding: 10,
      leading:  CircleAvatar(
        backgroundImage: NetworkImage(image!),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:  [
          CustomText(
            text: name,
            fontSize: 12,
            color: Colors.black,
          ),
          CustomText(
            text: '$time   $date',
            fontSize: 12,
            color: Colors.grey,
          ),
        ],
      ),
      subtitle:  CustomText(
        text: content,
        fontSize: 12,
        color: Colors.grey,
      ),
    );
  }
}

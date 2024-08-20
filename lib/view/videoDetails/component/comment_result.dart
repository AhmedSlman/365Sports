import 'package:flutter/material.dart';
import 'package:sportat/const/base_url.dart';
import 'package:sportat/core/models/video_page_model.dart';
import 'package:sportat/view/videoDetails/widget/comment_card.dart';

// تعديل الكلاس لقبول قائمة التعليقات كخاصية
class CommentResult extends StatelessWidget {
  final List<Comment> comments; // خاصية التعليقات

  const CommentResult({
    Key? key,
    required this.comments, // تلقي قائمة التعليقات عند الإنشاء
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: comments.length, // استخدام خاصية التعليقات
            itemBuilder: (context, index) => CommentCard(
              image: comments[index].clientProfile == null
                  ? "https://fourthpyramidagcy.net/sportat/uploads/thumbnails/talent/profileImage/2022-01-24/default.jpeg-_-1643020873.jpeg"
                  : getBaseUrl + comments[index].clientProfile!,
              date: comments[index].date,
              name: comments[index].clientName,
              content: comments[index].content,
              time: comments[index].time,
            ),
          ),
        ),
      ],
    );
  }
}

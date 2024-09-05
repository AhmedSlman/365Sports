import 'package:flutter/material.dart';
import 'package:sportat/widgets/custom_text.dart';

class SearchCard extends StatelessWidget {
  const SearchCard({Key? key, this.image, this.name, this.onTap})
      : super(key: key);
  final String? image;
  final String? name;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        color: Colors.white,
        margin: const EdgeInsets.symmetric(vertical: 5),
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: image != null
                ? NetworkImage(image!)
                : const AssetImage('assets/images/default_avatar.png') as ImageProvider,
          ),
          title: CustomText(
            text: name,
            fontSize: 12,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}



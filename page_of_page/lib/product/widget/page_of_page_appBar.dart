import 'package:flutter/material.dart';
class PageOfPageAppBar extends StatefulWidget with PreferredSizeWidget{
  final String text;
  const PageOfPageAppBar({
    Key? key, required this.text,
  }) : super(key: key);

  @override
  State<PageOfPageAppBar> createState() => _PageOfPageAppBarState();
  
  @override
  
  Size get preferredSize => Size.fromHeight(56);
}

class _PageOfPageAppBarState extends State<PageOfPageAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(widget.text),
      actions: [
        IconButton(onPressed: (){}, icon: Icon(Icons.abc_rounded)),
      ],
    );
  }
  
}
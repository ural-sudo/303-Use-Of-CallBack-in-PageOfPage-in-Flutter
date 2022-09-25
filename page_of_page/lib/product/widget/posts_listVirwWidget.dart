
import 'package:flutter/material.dart';

import '../../Services/post_services/post_model.dart';

class PostDataListWidget extends StatefulWidget {
  const PostDataListWidget({
    Key? key,
    required this.size,
    required this.postItems,
  }) : super(key: key);

  final Size size;
  final List<PostModel>? postItems;

  @override
  State<PostDataListWidget> createState() => _PostDataListWidgetState();
}

class _PostDataListWidgetState extends State<PostDataListWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.size.height*0.3,
      child: GridView.builder(
              scrollDirection:Axis.vertical ,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing:2.0,
              ),
              itemBuilder: (BuildContext context, int index){
                return SizedBox(
                  height: 10,
                  width: 10,
                  child: Card(
                    color: Colors.red,
                      child: Text(widget.postItems?[index].title ?? ""),
                  ),
                );
              },
            ),
          );
  }
}
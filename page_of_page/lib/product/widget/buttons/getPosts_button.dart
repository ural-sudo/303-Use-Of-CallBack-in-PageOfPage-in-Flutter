import 'package:flutter/material.dart';

class GetPostButton extends StatefulWidget {
  const GetPostButton({Key? key, required this.onGet, required this.text}) : super(key: key);
  final Future<void> Function() onGet;
  final String text;
  @override
  State<GetPostButton> createState() => _GetPostButtonState();
}

class _GetPostButtonState extends State<GetPostButton> {

  bool isLoading = false; 
  bool isCompleted = false;
  void changeLoading(){
    setState(() {
      isLoading = !isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
              style:ElevatedButton.styleFrom(
                primary: isCompleted ? Colors.green: Colors.blue
              ),
              onPressed: () async {   
                changeLoading();
                await widget.onGet.call();
                changeLoading();
                setState(() {
                  isCompleted = true;
                });
              },
              child:isLoading ? CircularProgressIndicator(
                strokeWidth: 3.0,
                color: Colors.white,
              ) : isCompleted ? Icon(Icons.check) : Text(widget.text)
            );
  }
}
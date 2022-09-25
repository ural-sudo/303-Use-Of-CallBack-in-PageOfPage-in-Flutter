

import 'package:flutter/material.dart';
import 'package:page_of_page/Services/post_services/post_services.dart';
import 'package:page_of_page/product/widget/buttons/getPosts_button.dart';

import '../Services/post_services/post_model.dart';
import '../product/widget/page_of_page_appBar.dart';
import '../product/widget/posts_listVirwWidget.dart';

class PageOfPageView extends StatefulWidget {
  const PageOfPageView({Key? key}) : super(key: key);

  @override
  State<PageOfPageView> createState() => _PageOfPageViewState();
}

class _PageOfPageViewState extends State<PageOfPageView> {

  late final PostServices postServices;

   List<PostModel>? postItems;
   
   Future<void> getPostDatas() async {
     postItems = await postServices.getPosts();
   } 
  
  @override
  void initState() {
    super.initState();
    postServices = PostServices();
  }

  @override
  Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;
     String getPosts = "Get Posts";
     String appBarTitle = "Page Of Page";
    return Scaffold(
      appBar:  PageOfPageAppBar(text:appBarTitle,),
      body: Center(
        child: Column(
          children: [
            PostDataListWidget(size: size, postItems: postItems),
            GetPostButton(text:getPosts ,onGet:() async {
              await getPostDatas();
              setState(() {});
            })
          ]
        ),
      ),
    );
  }
}





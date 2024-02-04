import 'package:car_soare_parts_app/modules/product/comment/widgets/comment_item.dart';
import 'package:car_soare_parts_app/modules/product/controller/product_single_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommentList extends StatelessWidget {
  CommentList({
    super.key,
  });

  final ProductSingleController productSingleController =
      Get.find<ProductSingleController>();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) => CommentItem(
        index: index,
      ),
      itemCount: productSingleController.commentList.length,
    );
  }
}
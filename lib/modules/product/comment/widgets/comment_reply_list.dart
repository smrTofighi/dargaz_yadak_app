import 'package:car_soare_parts_app/modules/product/comment/widgets/comment_item_reply.dart';
import 'package:car_soare_parts_app/modules/product/controller/product_single_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommentReplyList extends StatelessWidget {
  CommentReplyList({
    super.key,
    required this.index,
  });

  final ProductSingleController productSingleController =
      Get.find<ProductSingleController>();
  final int index;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (context, towIndex) =>
          productSingleController.commentList[index].replyItems!.isNotEmpty
              ? CommentItemReply(index: index, towIndex: towIndex,)
              : Container(),
      itemCount: productSingleController.commentList[index].replyItems!.length,
    );
  }
}
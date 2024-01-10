class CommentModel {
    int id;
    String fullName;
    String email;
    String comment;
    String ip;
    String commentableId;
    String commentableType;
    String? replyId;
    dynamic like;
    dynamic unlike;
    dynamic rate;
    String status;
    DateTime createdAt;
    DateTime updatedAt;
    dynamic userId;
    List<CommentModel>? replyItems;

    CommentModel({
        required this.id,
        required this.fullName,
        required this.email,
        required this.comment,
        required this.ip,
        required this.commentableId,
        required this.commentableType,
        required this.replyId,
        required this.like,
        required this.unlike,
        required this.rate,
        required this.status,
        required this.createdAt,
        required this.updatedAt,
        required this.userId,
        this.replyItems,
    });


    factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
        id: json["id"],
        fullName: json["full_name"],
        email: json["email"],
        comment: json["comment"],
        ip: json["ip"],
        commentableId: json["commentable_id"],
        commentableType: json["commentable_type"],
        replyId: json["reply_id"],
        like: json["like"],
        unlike: json["unlike"],
        rate: json["rate"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        userId: json["user_id"],
        replyItems: json["reply_items"] == null ? [] : List<CommentModel>.from(json["reply_items"]!.map((x) => CommentModel.fromJson(x))),
    );

   
}

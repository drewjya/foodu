class User {
  final String username;
  final String email;
  String imglink;
  String bio;
  List<int> favorited;
  int followers;
  int following;
  List<int> recipe;
  User(
      {required this.username,
      required this.email,
      required this.bio,
      required this.favorited,
      required this.followers,
      required this.following,
      required this.imglink,
      required this.recipe});
  factory User.fromJson({required Map<String, dynamic> json}) => User(
        username: json['username'] as String,
        email: json['email'] as String,
        bio: json['bio'] as String,
        favorited: json['favorited'] as List<int>,
        followers: json['followers'] as int,
        following: json['following'] as int,
        recipe: json['recipe'] as List<int>,
        imglink: json['imglink'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{
        'username': username,
        'email': email,
        'bio': bio,
        'favorited': favorited,
        'followers': followers,
        'following': following,
        'recipe': recipe,
        'imglink': imglink,
      };
}

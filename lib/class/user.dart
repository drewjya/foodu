class UserData {
  String username;
  String email;
  String id;
  String? imglink;
  String bio;
  int followers;
  int following;
  UserData({
    required this.username,
    required this.id,
    required this.email,
    required this.bio,
    required this.followers,
    required this.following,
    required this.imglink,
  });
  factory UserData.fromJson({required Map<String, dynamic> json}) => UserData(
        username: json['username'] as String,
        id: json['id'] as String,
        email: json['email'] as String,
        bio: (json['bio'] == null) ? '' : json['bio'] as String,
        followers: json['followers'] as int,
        following: json['following'] as int,
        imglink: json['imglink'],
      );
  Map<String, dynamic> toJson() => <String, dynamic>{
        'username': username,
        'email': email,
        'bio': bio,
        'followers': followers,
        'following': following,
        'imglink': imglink,
        'id': id,
      };
}

import 'SocialMediaPost.dart';


class Website2PostAdapter implements SocialMediaPost {
  final Map<String, dynamic> data;

  Website2PostAdapter(this.data);

  @override
  String getTitle() {
    return data['header'];
  }

  @override
  String getContent() {
    return data['body'];
  }
}
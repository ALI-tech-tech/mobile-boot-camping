import 'SocialMediaPost.dart';


class Website1PostAdapter implements SocialMediaPost {
  final Map<String, dynamic> data;

  Website1PostAdapter(this.data);

  @override
  String getTitle() {
    return data['headline'];
  }

  @override
  String getContent() {
    return data['text'];
  }
}
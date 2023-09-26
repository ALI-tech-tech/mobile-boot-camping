import 'SocialMediaPost.dart';
import 'Website1PostAdapter.dart';
import 'Website2PostAdapter.dart';

void main() {
  
  Map<String, dynamic> ApiResponse1 = {"headline": "Title1", "text": "text"};
  Map<String, dynamic> ApiResponse2 = {"header": "Title2", "body": "text"};

  
  SocialMediaPost website1Post = Website1PostAdapter(ApiResponse1);
  SocialMediaPost website2Post = Website2PostAdapter(ApiResponse2);

  String website1Title = website1Post.getTitle();
  String website1Content = website1Post.getContent();

  String website2Title = website2Post.getTitle();
  String website2Content = website2Post.getContent();


  print("Website 1 Post:");
  print("Title: $website1Title");
  print("Content: $website1Content");

  print("Website 2 Post:");
  print("Title: $website2Title");
  print("Content: $website2Content");
}
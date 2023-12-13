import 'package:blogappwithrealapi/core/model/comment.dart';
import 'package:flutter/material.dart';

import '../../helpers/api_helper.dart';
import '../../utils/urls.dart';

class CommentViewModel with ChangeNotifier  {
  APIdp api = APIdp();

  addComment(Comments comment ,String authToken)async{
    Map<String, dynamic> result =
        (await api.sendApiwithimage(comment.toJson(), AppURL.ADDCOMMENT,authToken ))['result'];
     if (result['code'] == 1200) {
      return true;
    }else{
      return false;
    }
  }
}
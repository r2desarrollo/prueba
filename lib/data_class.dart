import 'package:flutter/cupertino.dart';
import 'package:shimmer_example/service_class.dart';

import 'data_model.dart';

class DataClass extends ChangeNotifier {

  DataModel? post;
  bool loading = false;

  getPostData() async {
    // print(post?.evidencia);
    loading = true;
    post = (await getSinglePostData())!;
    loading = false;

    notifyListeners();
  }
}
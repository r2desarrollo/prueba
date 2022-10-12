import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'service_class.dart';
import 'data_class.dart';
import 'data_model.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final postModel = Provider.of<DataClass>(context);
    return ChangeNotifierProvider(create: (context)=>DataClass(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
        home:ProviderDemoScreen()
      ),);
  }
}
class ProviderDemoScreen extends StatefulWidget {
  const ProviderDemoScreen({Key? key}) : super(key: key);

  @override
  _ProviderDemoScreenState createState() => _ProviderDemoScreenState();
}

class _ProviderDemoScreenState extends State<ProviderDemoScreen> {
  @override
  void initState() {
    super.initState();
    final postModel = Provider.of<DataClass>(context, listen: false);
    postModel.getPostData();
  }

  @override
  Widget build(BuildContext context) {
    final postModel = Provider.of<DataClass>(context);
    return Scaffold(
        appBar: AppBar(
        title: Text("Posts"),
      ),
      body: FutureBuilder(
        future: postModel.getPostData(),
        builder: (BuildContext context, AsyncSnapshot<List<DataModel>> snapshot) {
          if (snapshot.hasData) {
            List<DataModel> posts = snapshot.requireData;
            return ListView(
              children: posts
                  .map(
                    (DataModel post) => ListTile(
                      title: Text(post.evidencia),
                      subtitle: Text("${post.id}"),
                    ),
                  )
                  .toList(),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
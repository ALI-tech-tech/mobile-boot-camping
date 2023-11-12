import 'package:flutter/material.dart';
import 'package:flutter_practis/Evaluation%20Quiz/features/model/Blog.dart';
import 'package:flutter_practis/Evaluation%20Quiz/features/view/commentsview.dart';
import 'package:flutter_practis/Evaluation%20Quiz/features/viewmodel/viwmodelblog.dart';
import 'package:flutter_practis/TalkahApp/core/Theme/size.dart';

class BlogList extends StatefulWidget {
  const BlogList({super.key});

  @override
  State<BlogList> createState() => _BlogListState();
}

class _BlogListState extends State<BlogList> {
  ViewModelBlog vm = ViewModelBlog();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    vm.getBlog();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: vm.getBlog(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ComentList(blog: snapshot.data![index].id!),
                          ));
                    },
                    title: Text(snapshot.data![index].title.toString()),
                    subtitle: Text(snapshot.data![index].content.toString()),
                    trailing: Column(
                      children: [
                        IconButton(
                            onPressed: () async {
                              Blog data =
                                  await Edit(context, snapshot.data![index]);

                              if (data != null) vm.edit(data);

                              setState(() {});
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  backgroundColor: Colors.amber,
                                  content: Text(
                                      " ${snapshot.data![index].id} is Edit ")));
                            },
                            icon: Icon(Icons.edit)),
                        IconButton(
                            onPressed: () {
                              vm.delete(snapshot.data![index].id!);
                            },
                            icon: Icon(Icons.delete)),
                      ],
                    ),
                  );
                },
              );
            }
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}

Edit(BuildContext context, Blog blog) async {
  TextEditingController txt = TextEditingController();
  TextEditingController txt2 = TextEditingController();
  txt.text = blog.title!;
  txt.text = blog.content!;
  return await showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (BuildContext context, setState) {
          return AlertDialog(
            content: Form(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 200,
                    child: TextField(
                      controller: txt,
                    ),
                  ),
                  Container(
                    width: 200,
                    child: TextField(
                      controller: txt2,
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        blog.title = txt.text;
                        blog.content = txt2.text;
                        Navigator.pop(context, blog);
                      },
                      child: Text("Submit"))
                ],
              ),
            ),
          );
        },
      );
    },
  );
}

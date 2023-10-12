import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_practis/MyPackage/Extentios/MyList.dart';
import 'person.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<PersonApp> li=genratelist();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SearchBar(
                onChanged: (v){
                  if (v.isEmpty) {
                    li=genratelist();
                  }else{
                  li=li.where((element) => element.email!.contains(v)).toList();
                  
                  }
                  setState(() {
                    
                  });
                },
              ),
              Expanded(
                child: Container(
                  child: ListView.builder(
                    itemCount: li.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text("${li[index].name}"),
                        subtitle: Text("${li[index].email}"),
                        trailing: Text("${li[index].phone}"),
                      ) ;
                    },
                  ),
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}

genratelist(){
  return List.generate(20, (index) => PersonApp(
    name: faker.person.name(), id: faker.guid.guid(), email: faker.internet.email(),phone: faker.phoneNumber.de()));

}
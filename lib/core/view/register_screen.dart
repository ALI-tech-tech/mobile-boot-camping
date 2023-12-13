import 'package:blogappwithrealapi/core/model/user.dart';
import 'package:blogappwithrealapi/core/viewmodel/user_viewmodel.dart';
import 'package:blogappwithrealapi/helpers/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
   RegisterScreen({super.key});
    final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Your name',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: (){
                _registerUser(context);
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
  Future<void> _registerUser(BuildContext context) async {
    User user=User(name:_usernameController.text, email: _emailController.text,password:int.parse(_passwordController.text)  );
    bool reult= await Provider.of<UserViewModel>(context,listen: false).rgister(user);
    if (reult) {
      Navigator.pushNamed(context,AppRoutes.addartical);
    }
    else{
      showDialog(context: context, builder: (context) => AlertDialog(
        content: Text("  "),
        actions: [
          ElevatedButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text("cancle"))
        ],
      ),);
    }
  }
}

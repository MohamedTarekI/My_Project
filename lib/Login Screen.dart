import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Components dart.dart';

class LoginScreen extends StatelessWidget
{
  var emailController =TextEditingController();
  var passwordController =TextEditingController();
  var formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Form(
          key:formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Login',
                style: TextStyle(
                  fontSize: 70,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
              height: 30,
              ),
              TextFormField(
                controller:emailController ,
                keyboardType: TextInputType.emailAddress,
                onFieldSubmitted: (String value)
                {
                  print(value);
                },
                onChanged: (String value)
                {
                  print(value);
                },
                validator:(value)
                {
                  if(value!.isEmpty)
                  {
                    return 'email address must not be empty';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Email Address',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(
                    Icons.email,
                  )
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: passwordController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                onFieldSubmitted: (String value)
                {
                  print(value);
                },
                onChanged: (String value)
                {
                  print(value);
                },
                validator: (value)
                {
                  if(value!.isEmpty)
                  {
                    return('password must not be empty');
                  }
                 return null;
                },
                decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(
                      Icons.remove_red_eye,
                    )
                ),
              ),
              SizedBox(
                height: 20,
              ),
              defaultButton(
                text: 'Login',
                background: Colors.blue,
                function: ()
                {
                  if(formKey.currentState!.validate())
                  {
                    print(emailController.text);
                    print(passwordController.text);
                  }
                },
                width: double.infinity,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t Have an Account'
                  ),
                  TextButton(
                    onPressed: (){},
                    child:Text(
                    'Register Now',
                  ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}


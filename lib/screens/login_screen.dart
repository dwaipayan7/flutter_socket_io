import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/home.dart';
import '../provider/login.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  _login() {
    final provider = Provider.of<LoginProvider>(context, listen: false);
    if (_usernameController.text.trim().isNotEmpty) {
      provider.setErrorMessage('');
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
            create: (context) => HomeProvider(),
            child: HomeScreen(
              username: _usernameController.text.trim(),
            ),
          ),
        ),
      );
    } else {
      provider.setErrorMessage('Username is required!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Selector<LoginProvider, String>(
                selector: (_, provider) => provider.errorMessage,
                builder: (_, errorMessage, __) => errorMessage != ''
                    ? Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: Card(
                    color: Colors.red,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        errorMessage,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                )
                    : Container(),
              ),
              Image.asset('assets/socket_icon.png'),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Flutter Socket.IO',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 40,
              ),
              TextField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    borderSide: BorderSide(color: Colors.blue, width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    borderSide: BorderSide(color: Colors.blueAccent, width: 2.5),
                  ),
                  labelText: 'Who are you?',
                  labelStyle: TextStyle(color: Colors.blueGrey),
                  floatingLabelStyle: TextStyle(color: Colors.blue),
                ),
              ),

              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: _login,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blueAccent, // Text color
                  shadowColor: Colors.blue, // Shadow color
                  elevation: 5, // Shadow elevation
                  padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0), // Padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0), // Rounded corners
                  ),
                  textStyle: const TextStyle(
                    fontSize: 16, // Text size
                    fontWeight: FontWeight.bold, // Text weight
                  ),
                ),
                child: const Text('Start Now'),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
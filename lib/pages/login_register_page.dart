// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_firebase_auth/auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   String? errorMessage = '';
//   bool isLogin = true;

//   final TextEditingController _controllerEmail = TextEditingController();
//   final TextEditingController _controllerPassword = TextEditingController();

//   Future<User?> signInWithGoogle() async {
//     try {
//       final GoogleSignInAccount? googleSignInAccount =
//           await GoogleSignIn().signIn();
//       if (googleSignInAccount == null) {
//         // Pengguna membatalkan login
//         return null;
//       }

//       final GoogleSignInAuthentication googleSignInAuthentication =
//           await googleSignInAccount.authentication;
//       final AuthCredential credential = GoogleAuthProvider.credential(
//         accessToken: googleSignInAuthentication.accessToken,
//         idToken: googleSignInAuthentication.idToken,
//       );

//       final UserCredential authResult =
//           await FirebaseAuth.instance.signInWithCredential(credential);
//       final User? user = authResult.user;

//       return user;
//     } catch (e) {
//       print('Error during Google sign in: $e');
//       return null;
//     }
//   }

//   Future<void> signInWithEmailAndPassword() async {
//     try {
//       await Auth().signInWithEmailAndPassword(
//           email: _controllerEmail.text, password: _controllerPassword.text);
//     } on FirebaseAuthException catch (e) {
//       setState(() {
//         errorMessage = e.message;
//       });
//     }
//   }

//   Future<void> createUserWithEmailAndPassword() async {
//     try {
//       await Auth().createUserWithEmailAndPassword(
//           email: _controllerEmail.text, password: _controllerPassword.text);
//     } on FirebaseAuthException catch (e) {
//       setState(() {
//         errorMessage = e.message;
//       });
//     }
//   }

//   Widget _title() {
//     return const Text('Firebase Auth');
//   }

//   Widget _entryField(String title, TextEditingController controller) {
//     return TextField(
//       controller: controller,
//       decoration: InputDecoration(
//         labelText: title,
//       ),
//     );
//   }

//   Widget _errorMessage() {
//     return Text(errorMessage == '' ? '' : 'Humm ? $errorMessage');
//   }

//   Widget _submitButton() {
//     return ElevatedButton(
//       onPressed:
//           isLogin ? signInWithEmailAndPassword : createUserWithEmailAndPassword,
//       child: Text(isLogin ? 'Login' : 'Register'),
//     );
//   }

//   Widget _loginOrRegisterButton() {
//     return TextButton(
//       onPressed: () {
//         setState(() {
//           isLogin = !isLogin;
//         });
//       },
//       child: Text(isLogin ? 'Register' : 'Login'),
//     );
//   }

//   Widget _googleSignInButton() {
//     GoogleSignIn _googleSignIn = GoogleSignIn(
//       clientId:
//           '197268497519-62753mbeua6mf71mq1e581407u648l58.apps.googleusercontent.com', // Replace with your actual Google Sign-In client ID
//     );

//     return ElevatedButton(
//       onPressed: () async {
//         User? user = await signInWithGoogle(_googleSignIn);
//         if (user != null) {
//           print('Successfully signed in with Google: ${user.displayName}');
//         } else {
//           print('Sign in with Google failed.');
//         }
//       },
//       child: Text('Sign in with Google'),
//     );
//   }

//   Future<User?> signInWithGoogle(GoogleSignIn googleSignIn) async {
//     try {
//       final GoogleSignInAccount? googleSignInAccount =
//           await googleSignIn.signIn();
//       if (googleSignInAccount == null) {
//         // Pengguna membatalkan login
//         return null;
//       }

//       final GoogleSignInAuthentication googleSignInAuthentication =
//           await googleSignInAccount.authentication;
//       final AuthCredential credential = GoogleAuthProvider.credential(
//         accessToken: googleSignInAuthentication.accessToken,
//         idToken: googleSignInAuthentication.idToken,
//       );

//       final UserCredential authResult =
//           await FirebaseAuth.instance.signInWithCredential(credential);
//       final User? user = authResult.user;

//       return user;
//     } catch (e) {
//       print('Error during Google sign in: $e');
//       return null;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: _title(),
//       ),
//       body: Container(
//         height: double.infinity,
//         width: double.infinity,
//         padding: EdgeInsets.all(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             _entryField('email', _controllerEmail),
//             _entryField('password', _controllerPassword),
//             _errorMessage(),
//             _submitButton(),
//             _loginOrRegisterButton(),
//             _googleSignInButton(), // Tambahkan tombol Google Sign-In
//           ],
//         ),
//         // child: Column(
//         //   crossAxisAlignment: CrossAxisAlignment.center,
//         //   mainAxisAlignment: MainAxisAlignment.center,
//         //   children: <Widget>[
//         //     _entryField('email', _controllerEmail),
//         //     _entryField('password', _controllerPassword),
//         //     _errorMessage(),
//         //     _submitButton(),
//         //     _loginOrRegisterButton(),
//         //   ],
//         // ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase_auth/auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? errorMessage = '';
  bool isLogin = true;

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await GoogleSignIn().signIn();
      if (googleSignInAccount == null) {
        // User canceled login
        return null;
      }

      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final UserCredential authResult =
          await FirebaseAuth.instance.signInWithCredential(credential);
      final User? user = authResult.user;

      return user;
    } catch (e) {
      print('Error during Google sign in: $e');
      return null;
    }
  }

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
          email: _controllerEmail.text, password: _controllerPassword.text);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
          email: _controllerEmail.text, password: _controllerPassword.text);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Widget _title() {
    return const Text('Firebase Auth');
  }

  Widget _entryField(String title, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: title,
      ),
    );
  }

  Widget _errorMessage() {
    return Text(errorMessage == '' ? '' : 'Error: $errorMessage');
  }

  Widget _submitButton() {
    return ElevatedButton(
      onPressed:
          isLogin ? signInWithEmailAndPassword : createUserWithEmailAndPassword,
      child: Text(isLogin ? 'Login' : 'Register'),
    );
  }

  Widget _loginOrRegisterButton() {
    return TextButton(
      onPressed: () {
        setState(() {
          isLogin = !isLogin;
        });
      },
      child: Text(isLogin ? 'Register' : 'Login'),
    );
  }

  Widget _googleSignInButton() {
    return ElevatedButton(
      onPressed: () async {
        User? user = await signInWithGoogle();
        if (user != null) {
          print('Successfully signed in with Google: ${user.displayName}');
        } else {
          print('Sign in with Google failed.');
        }
      },
      child: Text('Sign in with Google'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _title(),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _entryField('Email', _controllerEmail),
            _entryField('Password', _controllerPassword),
            _errorMessage(),
            _submitButton(),
            _loginOrRegisterButton(),
            _googleSignInButton(),
          ],
        ),
      ),
    );
  }
}

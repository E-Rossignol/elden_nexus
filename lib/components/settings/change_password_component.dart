import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../firebase/auth/auth.dart';

class ChangePasswordComponent extends StatefulWidget {
  const ChangePasswordComponent({Key? key}) : super(key: key);

  @override
  _ChangePasswordComponentState createState() => _ChangePasswordComponentState();
}

class _ChangePasswordComponentState extends State<ChangePasswordComponent> {
  final _formKey = GlobalKey<FormState>();
  String _oldPassword = '';
  String _newPassword = '';

  Future<void> _changePassword() async {
    try {
      // Get the current user
      User currentUser = Auth().currentUser!;
      // Create a credential
      AuthCredential credential = EmailAuthProvider.credential(
        email: currentUser.email!,
        password: _oldPassword,
      );
      // Reauthenticate the user
      await currentUser.reauthenticateWithCredential(credential);
      // Update the password
      await currentUser.updatePassword(_newPassword);
      Navigator.pop(context);
      Get.snackbar('Password Changed', 'Your password has been changed successfully');
    } catch (e) {
      // Handle the error
      if (e is FirebaseAuthException && e.code == 'wrong-password') {
        Get.snackbar('Error', 'The old password is incorrect');
      } else {
        Get.snackbar('Error', 'An error occurred while changing the password');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Icon(
            color: Theme
                .of(context)
                .colorScheme
                .onPrimaryContainer,
            Icons.password),
        title: Text(
          'Change Password',
          style: TextStyle(
            color: Theme
                .of(context)
                .colorScheme
                .onPrimaryContainer,
          ),
        ),
        onTap: () {
          showDialog(context: context, builder: (context) {
            return AlertDialog(
                title: Text('Change Password'),
                content: Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: SingleChildScrollView(
                    child: Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              decoration: const InputDecoration(labelText: 'Old Password'),
                              obscureText: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your old password';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _oldPassword = value!;
                              },
                            ),
                            TextFormField(
                              decoration: const InputDecoration(labelText: 'New Password'),
                              obscureText: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your new password';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _newPassword = value!;
                              },
                            ),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          _changePassword();
                        }
                      },
                      child: const Text('Change Password'),
                    ),
                          ],
                        ),
                      ),
                  ),
                ),
                );
          },
          );
        }
    );
  }
}
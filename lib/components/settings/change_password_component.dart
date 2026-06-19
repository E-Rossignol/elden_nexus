import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../firebase/auth/auth.dart';

/// Widget that allows a user to change their password.
///
/// This widget opens a dialog with fields for old and new password and performs reauthentication before updating.
class ChangePasswordComponent extends StatefulWidget {
  const ChangePasswordComponent({super.key});

  @override
  _ChangePasswordComponentState createState() =>
      _ChangePasswordComponentState();
}

class _ChangePasswordComponentState extends State<ChangePasswordComponent> {
  final _formKey = GlobalKey<FormState>();
  String _oldPassword = '';
  String _newPassword = '';

  /// Reauthenticate the current user and update the password.
  ///
  /// @return Future<void>
  /// @throws FirebaseAuthException on authentication errors.
  Future<void> _changePassword() async {
    try {
      // Get the current user from our Auth wrapper.
      User currentUser = Auth().currentUser!;
      // Create credential from email and provided old password.
      AuthCredential credential = EmailAuthProvider.credential(
        email: currentUser.email!,
        password: _oldPassword,
      );
      // Reauthenticate to allow sensitive operation.
      await currentUser.reauthenticateWithCredential(credential);
      // Update the password after successful reauthentication.
      await currentUser.updatePassword(_newPassword);
      // Persist password locally (existing app behavior).
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('password', _newPassword);
      Navigator.pop(context);
      Get.snackbar(
        'Password Changed',
        'Your password has been changed successfully',
      );
    } catch (e) {
      // Provide user-friendly feedback for common error.
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
        color: Theme.of(context).colorScheme.onPrimaryContainer,
        Icons.password,
      ),
      title: Text(
        'Change Password',
        style: TextStyle(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
      ),
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
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
                          decoration: const InputDecoration(
                            labelText: 'Old Password',
                          ),
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
                          decoration: const InputDecoration(
                            labelText: 'New Password',
                          ),
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
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lunatrial/screen/webview_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _firstNameController =
      TextEditingController(text: '');
  final TextEditingController _lastNameController =
      TextEditingController(text: '');
  final TextEditingController _emailController =
      TextEditingController(text: '');
  final TextEditingController _phoneController =
      TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Luna Trial Example App'),
        backgroundColor: Colors.purple[100],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const SizedBox(height: 16),
            _textField('First Name', TextInputType.name, _firstNameController),
            const SizedBox(height: 16),
            _textField('Last Name', TextInputType.name, _lastNameController),
            const SizedBox(height: 16),
            _textField('Email', TextInputType.emailAddress, _emailController),
            const SizedBox(height: 16),
            _textField('Phone Number', TextInputType.phone, _phoneController),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          startLunaApplication();
        },
        label: const Text('Start Luna App'),
      ),
    );
  }

  void startLunaApplication() {
    String firstName = _firstNameController.text;
    String lastName = _lastNameController.text;
    String email = _emailController.text;
    String phone = _phoneController.text;

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => WebviewPage(
          firstName: firstName,
          lastName: lastName,
          email: email,
          phone: phone,
        ),
      ),
    );
  }

  Widget _textField(
    String label,
    TextInputType inputType,
    TextEditingController controller,
  ) {
    int length;
    if (inputType == TextInputType.phone) {
      length = 12;
    } else {
      length = 50;
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        controller: controller,
        keyboardType: inputType,
        maxLength: length,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),
      ),
    );
  }
}

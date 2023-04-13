// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final _form = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();

  void onsubmit(String name, String mobile) async {
    var headers = {
      'Content-Type': 'text/plain',
      'Authorization':
          'Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiI3MDU0NzExOTMzIiwiZXhwIjoxOTk2Mzk3NzQ0LCJpYXQiOjE2ODEwMzc3NDR9.EwEu0MySU8182IHkToGzkmilcQ7dFge5FXrjSBfnsSD15OXk9cFfcx4pJhPcms0gxaXa-SvtmOE56b0dndPQIQ'
    };
    var request = http.Request(
        'PATCH',
        Uri.parse(
            'https://b46983ef-4c49-4b91-8af8-59e11f8084a9.mock.pstmn.io/tailor/5'));
    request.body =
        '''{\r\n    "tailor_name" : name,\r\n    "phone_number" : mobile \r\n}\r\n''';
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("Details Saved!"),
      duration: Duration(seconds: 1),
    ));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Enter your details"),
        actions: [
          InkWell(
              onTap: () {
                onsubmit(_nameController.text, _phoneController.text);
              },
              child: const Icon(Icons.save)),
          const SizedBox(
            width: 5,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
            key: _form,
            child: ListView(
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration:
                      const InputDecoration(labelText: 'Enter your Name'),
                ),
                TextFormField(
                  controller: _phoneController,
                  decoration: const InputDecoration(
                      labelText: 'Enter your Mobile Number'),
                ),
              ],
            )),
      ),
    );
  }
}

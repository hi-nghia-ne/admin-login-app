import 'package:flutter/material.dart';

class NewMember extends StatefulWidget {
  final Function addMember;

  NewMember(this.addMember);

  @override
  _NewMemberState createState() => _NewMemberState();
}

class _NewMemberState extends State<NewMember> {
  final _avatarUrlController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _descriptionController = TextEditingController();

  void _submitData() {
    if (_nameController.text.isEmpty) return;
    final enteredPhoneNumber = _phoneNumberController.text;
    final enteredDescription = _descriptionController.text;
    final enteredName = _nameController.text;
    if (enteredDescription.isEmpty || enteredPhoneNumber.isEmpty) return;
    widget.addMember(
      enteredPhoneNumber,
      enteredDescription,
      enteredName,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: ''),
            )
          ],
        ),
      ),
    );
  }
}

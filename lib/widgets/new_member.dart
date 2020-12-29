import 'package:flutter/material.dart';
import 'package:flutter_project_1/widgets/primary_button.dart';

class NewMember extends StatefulWidget {
  final Function addMember;
  NewMember(this.addMember);
  @override
  _NewMemberState createState() => _NewMemberState();
}

class _NewMemberState extends State<NewMember> {
  final _nameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _descriptionController = TextEditingController();

  void _submitData() {
    final enteredName = _nameController.text;
    final enteredPhoneNumber = _phoneNumberController.text;
    final enteredDescription = _descriptionController.text;
    widget.addMember(
      enteredName,
      enteredPhoneNumber,
      enteredDescription,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Name',
                  ),
                  controller: _nameController,
                  onSubmitted: (_) => _submitData,
                  // onChanged: (value) {
                  //   titleInput = value;
                  // },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                  ),
                  controller: _phoneNumberController,
                  keyboardType: TextInputType.number,
                  onSubmitted: (_) => _submitData,
                  // onChanged: (value) => amountInput = value,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Description',
                  ),
                  controller: _descriptionController,
                  onSubmitted: (_) => _submitData,
                  // onChanged: (value) => amountInput = value,
                ),
              ),
              SizedBox(height: 120),
              PrimaryButton(
                btnText: 'Add Member',
                onCustomPressed: _submitData,
              )
            ],
          ),
        ),
      ),
    );
  }
}

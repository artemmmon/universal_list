import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universal_list/domain/bloc/data_saver_cubit.dart';
import 'package:universal_list/presentation/decoration_widget.dart';

class DataSaverWidget extends StatefulWidget {
  DataSaverWidget({super.key});

  @override
  State<DataSaverWidget> createState() => _DataSaverWidgetState();
}

class _DataSaverWidgetState extends State<DataSaverWidget> {
  final _titleController = TextEditingController();

  final _descriptionController = TextEditingController();

  final _imageController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _imageController.dispose();
    super.dispose();
  }

  Widget _buildTextField(TextEditingController controller, String labelText) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        suffixIcon: Icon(
          Icons.delete_outline,
          color: Colors.red,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
          borderSide: BorderSide(color: Colors.white, width: 2.0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecorationWidget(
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            _buildTextField(_titleController, 'Enter title'),
            const SizedBox(
              height: 20,
            ),
            _buildTextField(_descriptionController, 'Enter description'),
            const SizedBox(
              height: 20,
            ),
            _buildTextField(_imageController, 'Enter the path to the image'),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 145, vertical: 20),
        child: FloatingActionButton(
          backgroundColor: Colors.grey,
          onPressed: () {
            BlocProvider.of<DataSaverCubit>(context, listen: false).save(
                title: _titleController.text,
                description: _descriptionController.text,
                image: _imageController.text);
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.save_alt,
            color: Colors.amberAccent,
          ),
        ),
      ),
    );
  }
}

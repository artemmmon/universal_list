import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universal_list/domain/bloc/data_saver_cubit.dart';
import 'package:universal_list/presentation/decoration_widget.dart';

class DataSaverWidget extends StatefulWidget {
  const DataSaverWidget({super.key});

  @override
  State<DataSaverWidget> createState() => _DataSaverWidgetState();
}

class _DataSaverWidgetState extends State<DataSaverWidget> {

  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

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

  Widget _buildTextField(
    TextEditingController controller,
    String labelText,
    int textInputFormatter,
    int maxLines,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(color: Colors.amberAccent),
          suffixIcon: IconButton(
            onPressed: () {
              controller.clear();
            },
            icon: const Icon(
              Icons.delete_outline,
              color: Colors.red,
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
            borderSide: BorderSide(color: Colors.amberAccent, width: 2.0),
          ),
        ),
        validator: (val) => val!.isEmpty ? 'Please fill in all fields' : null,
        maxLines: maxLines,
        inputFormatters: [
          LengthLimitingTextInputFormatter(textInputFormatter),
        ],
        cursorColor: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.green.shade900,
        title: const Text(
          'Home page',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.amber,
            fontFamily: 'Lobster',
          ),
        ),
        centerTitle: true,
      ),
      body: DecorationWidget(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              _buildTextField(
                _titleController,
                'Enter title',
                20,
                1,
              ),
              const SizedBox(
                height: 20,
              ),
              _buildTextField(
                _descriptionController,
                'Enter description',
                70,
                3,
              ),
              const SizedBox(
                height: 20,
              ),
              _buildTextField(
                _imageController,
                'Enter the path to the image',
                1000,
                1,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 145, vertical: 20),
        child: FloatingActionButton(
          backgroundColor: Colors.grey,
          onPressed: () {
            if (formKey.currentState!.validate()) {
              BlocProvider.of<DataSaverCubit>(context, listen: false).save(
                  title: _titleController.text,
                  description: _descriptionController.text,
                  image: _imageController.text);
              Navigator.of(context).pop();
            } else {
              // snackBar();
            }
          },
          child: const Icon(
            Icons.save_alt,
            color: Colors.amberAccent,
          ),
        ),
      ),
    );
  }

  // void snackBar() {
  //   scaffoldKey.currentState!.showSnackBar(
  //       const SnackBar(
  //      duration: Duration(seconds: 3),
  //      backgroundColor: Colors.red,
  //      content: Text(
  //        'Please fill in all fields',
  //        style: TextStyle(
  //          fontSize: 20,
  //          fontWeight: FontWeight.w800,
  //          color: Colors.black,
  //        ),
  //      ),
  //    ),
  //   );
  // }
}

import 'package:flutter/material.dart';

class DecorationWidget extends StatelessWidget {
  const DecorationWidget({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  opacity: 0.7,
                  image: NetworkImage(
                      "https://media.istockphoto.com/id/1292699880/photo/abstract-green-paper-texture-background-naturally-lit-in-studio-as-desing-element-for.jpg?b=1&s=170667a&w=0&k=20&c=FiwUKkthEoxz2XKvU4dm5s-OVNWAqXNaax6B_AK_Qss="),
                  fit: BoxFit.cover),
            ),
      child: child,
    );
  }
}

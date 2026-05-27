import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  final Widget child;
  final String? imageUrl;

  const BackgroundImage({
    super.key,
    required this.child,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: imageUrl != null
              ? NetworkImage(imageUrl!)
              : const AssetImage('assets/images/barber_bg.jpg') as ImageProvider,
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.5),
            BlendMode.darken,
          ),
        ),
      ),
      child: child,
    );
  }
}
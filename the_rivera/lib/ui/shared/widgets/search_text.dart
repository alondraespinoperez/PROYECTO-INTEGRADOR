import 'package:flutter/material.dart';

class SearchText extends StatelessWidget {
  final Function(String)? onSearch;
  
  const SearchText({
    super.key,
    this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: const Color(0xFFFDF8F0),
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: const Color(0xFFE0D5C0),
          width: 1,
        ),
      ),
      child: TextField(
        onSubmitted: onSearch,
        decoration: const InputDecoration(
          hintText: 'Buscar servicios, cortes...',
          hintStyle: TextStyle(
            color: Color(0xFF8B7355),
            fontSize: 14,
          ),
          prefixIcon: Icon(
            Icons.search,
            color: Color(0xFF8B5A2B),
            size: 20,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
        ),
      ),
    );
  }
}
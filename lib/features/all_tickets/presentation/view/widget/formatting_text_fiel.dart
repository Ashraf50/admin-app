import 'package:flutter/material.dart';

class FormattingTextField extends StatefulWidget {
  const FormattingTextField({super.key});

  @override
  FormattingTextFieldState createState() => FormattingTextFieldState();
}

class FormattingTextFieldState extends State<FormattingTextField> {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          // Formatting Toolbar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey.shade300),
              ),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.link),
                    onPressed: () {},
                    color: Colors.grey,
                  ),
                  IconButton(
                    icon: const Icon(Icons.format_list_bulleted),
                    onPressed: () {},
                    color: Colors.grey,
                  ),
                  IconButton(
                    icon: const Icon(Icons.format_size),
                    onPressed: () {},
                    color: Colors.grey,
                  ),
                  IconButton(
                    icon: const Icon(Icons.format_strikethrough),
                    onPressed: () {},
                    color: Colors.grey,
                  ),
                  IconButton(
                    icon: const Icon(Icons.format_underline),
                    onPressed: () {},
                    color: Colors.grey,
                  ),
                  IconButton(
                    icon: const Icon(Icons.format_italic),
                    onPressed: () {},
                    color: Colors.grey,
                  ),
                  IconButton(
                    icon: const Icon(Icons.format_bold),
                    onPressed: () {},
                    color: Colors.grey,
                  ),
                  IconButton(
                    icon: const Icon(Icons.circle_outlined),
                    onPressed: () {},
                    color: Colors.grey,
                  ),
                  IconButton(
                    icon: const Icon(Icons.circle),
                    onPressed: () {},
                    color: Colors.grey,
                  ),
                  IconButton(
                    icon: const Icon(Icons.text_fields),
                    onPressed: () {},
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ),
          TextField(
            controller: _textController,
            maxLines: 5,
            decoration: const InputDecoration(
              hintText: 'Enter your text',
              contentPadding: EdgeInsets.all(16),
              border: InputBorder.none,
            ),
          ),
        ],
      ),
    );
  }
}

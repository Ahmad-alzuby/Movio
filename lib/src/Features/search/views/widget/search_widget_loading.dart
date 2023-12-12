import 'package:flutter/material.dart';
import 'package:movio/src/Features/home/views/widgets/skeelton_widget.dart';

class SearchWidgetLoading extends StatelessWidget {
  const SearchWidgetLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return   
    Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) => 
          ListTile(
        
          title: SkeltoonWidget(height: 0.02, width: 0.3),
          subtitle: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SkeltoonWidget(height: 0.02, width: 0.1),
          ),
          leading: SkeltoonWidget(height: 0.2, width: 0.2),
          
          trailing: SkeltoonWidget(height: 0.1, width: 0.1),
        ),
      ),
    );
  }
}
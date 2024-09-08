import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSideMenuItem extends StatelessWidget {
  final bool isSelected;
  final IconData iconData;
  final String title;
  final VoidCallback? onTap;

  const CustomSideMenuItem({
    super.key,
    this.isSelected = false,
    required this.iconData,
    this.onTap,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: isSelected
                ? Colors.purple.withOpacity(0.1)
                : Colors.transparent),
        height: 50,
        child: context.width < 750
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(iconData,
                    color: isSelected ? Colors.deepPurple : Colors.grey),
              )
            : ListTile(
                title: Row(
                  children: [
                    SizedBox(width: 10),
                    Icon(iconData,
                        color: isSelected ? Colors.deepPurple : Colors.grey),
                    SizedBox(width: 10),
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 15,
                        color: isSelected ? Colors.deepPurple : Colors.grey,
                      ),
                    ),
                  ],
                ),
                contentPadding: EdgeInsets.zero,
                trailing: Container(
                  height: 50,
                  width: 5,
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.deepPurple : Colors.transparent,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}

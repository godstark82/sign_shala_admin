import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfessorsWidget extends StatelessWidget {
  const ProfessorsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: context.height * 0.4,
        width: context.width > 750 ? context.width * 0.3 : context.width,
        color: Colors.white,
        margin: EdgeInsets.all(16),
        padding: EdgeInsets.all(16),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Text(
                    'Professors',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                  ),
                  Divider()
                ])),
                SliverList.builder(
                  itemCount: 5,
                  itemBuilder: (context, index){
                  return ListTile(
                    leading: CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage('https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'),
                    ),
                    title: Text('Professor #${index+1}'),
                    subtitle: Text('Available', style: TextStyle(color: Colors.blue),),
                  );
                })
          ],
        ));
  }
}

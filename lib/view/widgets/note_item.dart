import 'package:flutter/material.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const  EdgeInsets.only(top: 20,bottom: 20,left: 16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            title:Text('Flutter tips',
              style:Theme.of(context).textTheme.bodyText1!.copyWith(
                color: Colors.black
              ) ,),
            subtitle: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text('build your app with ahmed gamal',
                  style:Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: Colors.black.withOpacity(.5)
              ) ,),
            ),
            trailing: IconButton(
                onPressed: (){},
                icon:const  Icon(Icons.delete,
                size: 24,)),

          ),
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: Text('12/7/1998',
              style:TextStyle(
                 color: Colors.black.withOpacity(.5)
            ),
            ),
          )
        ],
      ),
    );
  }
}
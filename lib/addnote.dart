import'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_ref/firestore_ref.dart';
class Addnote extends StatelessWidget {

TextEditingController title=TextEditingController();
TextEditingController content=TextEditingController();

CollectionReference ref=FirebaseFirestore.instance.collection('notes');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          FlatButton(
            onPressed: (){
              ref.add({
                'title':title.text,
                'content':content.text
              }).whenComplete(() => Navigator.pop(context));

            },
            child: Text('Save')
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(7),
              decoration: BoxDecoration(border: Border.all()),
              child: TextField(
                controller: title,
                decoration: InputDecoration(hintText: 'Title'),
              ),
            ),
            SizedBox(height: 15,),
             Expanded(
               child: Container(
                 padding: EdgeInsets.all(10),
                decoration: BoxDecoration(border: Border.all()),
                child: TextField(
                  controller: content,
                  maxLines: null,
                  expands: true,
                  decoration: InputDecoration(hintText: 'Content'),
                ),
            ),
             ),

          ],
        ),
      ),
    );
  }
}
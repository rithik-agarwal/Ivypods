import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class Photo extends StatefulWidget {
  DocumentSnapshot d1;
  Photo(this.d1);
  @override
  _PhotoState createState() => _PhotoState();
}

class _PhotoState extends State<Photo> {
  DocumentSnapshot d;
  @override
  Widget build(BuildContext context) {
    d=widget.d1;
    return Container(child:Card(elevation: 10,child:GridTile(
      child:GestureDetector(child:Image .network(d['url'],fit: BoxFit.fill,),onTap: () {
       },),
      footer: GridTileBar(
        title: Text(d['caption'], textAlign: TextAlign.center,),
        backgroundColor: Colors.black54,
        leading: (d['likes']==0) ? IconButton(icon :Icon(Icons.favorite_border),color: Colors.redAccent,onPressed: () {
          Scaffold.of(context).hideCurrentSnackBar();
          d.reference.updateData({
           'likes': 1,
          });
          Scaffold.of(context).showSnackBar(
            SnackBar(content: Text('You liked this photo'),
            duration:Duration(seconds:2),
           )
          );
          setState(() {
            
          });
        },):
        IconButton(icon :Icon(Icons.favorite),color: Colors.redAccent,onPressed: () {
          Scaffold.of(context).hideCurrentSnackBar();
          d.reference.updateData({
           'likes': 0,
          });
          Scaffold.of(context).showSnackBar(
            SnackBar(content: Text('You disliked this photo'),
            duration:Duration(seconds:2),
           )
          );
          setState(() {
            
          });
        },)
        ,
        
      ),
      
    )
    )
    );
  }
}
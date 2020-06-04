import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:internship/Profilepage.dart';
import './Photo.dart';
class AllUploads extends StatefulWidget {
  @override
  _AllUploadsState createState() => _AllUploadsState();
}

class _AllUploadsState extends State<AllUploads> {
  bool isloading=true;
  List<DocumentSnapshot> snaps=[];
  @override
  void initState()
  {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('All uploads'),),
      body:  StreamBuilder(
        stream: Firestore.instance.collection('images').orderBy('timestamp',descending:true).snapshots(),
        builder: (context,snapshot)
        {
          if(!snapshot.hasData)
          return Center(child:CircularProgressIndicator());
          else
          {
            var count=snapshot.data.documents.length;
            if(count==0)
            return Center(child:Text("No Photos uploaded"));
            else
            {
             return GridView.builder(
              padding: const EdgeInsets.all(10.0),
              itemCount: count,
              itemBuilder: (ctx,i) => Photo(snapshot.data.documents[i]),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1,childAspectRatio: 3/2,crossAxisSpacing: 10,mainAxisSpacing: 10),
      );
            }
          }
        }
        ,)
        ,
        floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
          MaterialPageRoute(builder: (context) => ProfilePage()));
          },
        
        tooltip: 'Upload',
        child: Icon(Icons.file_upload),
      ),
     ); // This trailing comma makes auto-formatting nicer for build methods.,
      
    
  }
}
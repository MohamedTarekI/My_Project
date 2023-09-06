
import 'package:flutter/material.dart';


class MessnegarScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: const Row(
          children: [
            CircleAvatar(
              radius: 22.0,
              backgroundImage: NetworkImage('https://tse3.mm.bing.net/th/id/OIP.qOg9VILka_29UkdlRtnN1wHaHI?pid=ImgDet&rs=1'),
            ),
            SizedBox(
              width: 15.0,
            ),
            Text(
              'Chats',
              style: TextStyle(
                color: Colors.black,
              ),
            )
          ],
        ),
        actions: [
          IconButton(icon: const CircleAvatar(
            radius: 18.0,
            backgroundColor: Colors.black,
            child: Icon(
            Icons.camera_alt,
              size: 18.0,
              color: Colors.white,
            ),
          ),
            onPressed: (){},),
          IconButton(icon: const CircleAvatar(
            radius: 18.0,
            backgroundColor: Colors.black,
            child: Icon(
              Icons.edit,
              size: 18.0,
              color: Colors.white,
            ),
          ),
            onPressed: (){},),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(9.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration:BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.grey[200],
              ),
              padding: const EdgeInsets.all(10.0),
              child: const Row(
                children: [
                  Icon(
                    Icons.search_rounded,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    'Serach',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),// search bar
            const SizedBox(
              height: (10),
            ),
            ListView.builder(
              itemBuilder:(contxet , index)
              {

              },
              itemCount:10,
            ),
          ],
        ),
      ),
    );
  }



}

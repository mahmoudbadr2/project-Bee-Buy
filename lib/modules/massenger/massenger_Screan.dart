import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class MassengerScrean extends StatelessWidget {
  const MassengerScrean({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        titleSpacing: 20.0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 20.0,
              backgroundImage: NetworkImage('https://scontent.fcai20-6.fna.fbcdn.net/v/t39.30808-6/270423807_1957568151092613_2385976481236569492_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=zOQCkyJlhDoAX9IVYXG&_nc_ht=scontent.fcai20-6.fna&oh=00_AfAgj3pD47JIAY_rYM8O826Jbdw4Anr_v1p_A9wenxXm9Q&oe=63876CC6'),

            ),
            SizedBox(
              width: 15.0,
            ),
            Text(
              "Chats",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: (){}, icon: CircleAvatar(
            radius: 15.0,
            backgroundColor: Colors.blue,
            child: Icon(
              Icons.camera_alt,
              size: 16.0,
              color: Colors.white,
            ),
          )),
          IconButton(onPressed: (){}, icon: CircleAvatar(
            radius: 15.0,
            backgroundColor: Colors.blue,
            child: Icon(
              Icons.edit,
              size: 16.0,
              color: Colors.white,
            ),
          )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
            [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0,),
                  color: Colors.grey[300],

                ),
                padding: EdgeInsets.all(5.0,),
                child: Row(
                  children:
                  [
                    Icon(
                      Icons.search,
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Text(
                      "Search"
                    ),

                  ],
                ),
              ),
              SizedBox  (
                height: 15.0,
              ),
              Container(
                height: 100,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index ) => buildStoryItem(),
                  separatorBuilder: (context, index ) => SizedBox(width: 20.0,) ,
                  itemCount: 7,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context , index) =>  buildChatIten() ,
                separatorBuilder: (context , index) => SizedBox(height: 15.0,),
                itemCount: 15 ,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildChatIten() => Row(
    children:
    [
      Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          CircleAvatar(
            radius: 30.0,
            backgroundImage: NetworkImage('https://scontent.fcai20-6.fna.fbcdn.net/v/t39.30808-6/270423807_1957568151092613_2385976481236569492_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=zOQCkyJlhDoAX9IVYXG&_nc_ht=scontent.fcai20-6.fna&oh=00_AfAgj3pD47JIAY_rYM8O826Jbdw4Anr_v1p_A9wenxXm9Q&oe=63876CC6'),

          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(
              bottom: 3.0,
              end: 3.0,
            ),
            child: CircleAvatar(
              radius: 7.0,
              backgroundColor: Colors.green,
            ),
          ),

        ],
      ),
      SizedBox(
        width: 20.0,
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Osha badr Osha badr Osha badr Osha badr Osha badr Osha badr Osha badr",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Hello my name is osha",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                    width: 7.0,
                    height: 7.0,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Text(
                    '02:00 pm'
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  );

  Widget buildStoryItem() => Container(
    width: 60.0,
    child: Column(
      children:
      [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage('https://scontent.fcai20-6.fna.fbcdn.net/v/t39.30808-6/270423807_1957568151092613_2385976481236569492_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=zOQCkyJlhDoAX9IVYXG&_nc_ht=scontent.fcai20-6.fna&oh=00_AfAgj3pD47JIAY_rYM8O826Jbdw4Anr_v1p_A9wenxXm9Q&oe=63876CC6'),

            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                bottom: 3.0,
                end: 3.0,
              ),
              child: CircleAvatar(
                radius: 7.0,
                backgroundColor: Colors.green,
              ),
            ),

          ],
        ),
        SizedBox(
          height: 6.0,
        ),
        Text(
          "Mahmoud badr mostafa",
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),

      ],
    ),
  );

}

import 'package:akyc_chat/core/constant/color.dart';
import 'package:akyc_chat/core/constant/size.dart';
import 'package:akyc_chat/ui/pages/chat_detail_page/chat_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatListPageBody extends StatelessWidget {
  const ChatListPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> chatList = [
      {
        "picUrl": "assets/images/pic/cat.png",
        "name": "CBJasdsafsajfasfjlkasfjlkasfjlaskfjlasfjka",
        "lastChat": "멋져asdkjasldjaslkdjlasdjlasjdlasjdlasjdlajsdljasdlj",
        "time": "12:41",
      },
      {
        "picUrl": "assets/images/pic/cat.png",
        "name": "AJH",
        "lastChat": "멋져",
        "time": "13:00",
      },
      {
        "picUrl": "assets/images/pic/cat.png",
        "name": "YJM",
        "lastChat": "멋져",
        "time": "15:08",
      },
      {
        "picUrl": "assets/images/pic/cat.png",
        "name": "KYJ",
        "lastChat": "멋져",
        "time": "09:19",
      },
    ];
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.separated(
        itemCount: chatList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ChatDetailPage(),
                ),
              );
            },
            child: Container(
              height: MediaQuery.of(context).size.height * 0.1,
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset(chatList[index]["picUrl"]!),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                chatList[index]["name"]!,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: k00Color,
                                  fontSize: size18,
                                ),
                              ),
                            ),
                            Text(
                              chatList[index]["time"]!,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                        Text(
                          chatList[index]["lastChat"]!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            color: kC8Color,
            thickness: 1,
          );
        },
      ),
    );
  }
}

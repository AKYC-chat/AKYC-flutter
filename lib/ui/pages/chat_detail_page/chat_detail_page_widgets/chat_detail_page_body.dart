import 'package:akyc_chat/core/constant/color.dart';
import 'package:akyc_chat/utils/custom_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatDetailPageBody extends StatelessWidget {
  const ChatDetailPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> chatDetailList = [
      {"who": "me", "content": "Hello!"},
      {"who": "you", "content": "Hi there!ㅁㄴ이ㅓㅁ니ㅓㄹ미나러ㅣㅁ나러미ㅏㄴ러ㅣㅏㄴㅁ러ㅣㅁㄴ러ㅣㄴ러ㅣ"},
      {"who": "you", "content": "How's it going?"},
      {"who": "me", "content": "Pretty good, you?"},
      {"who": "me", "content": "Pretty good, you?"},
      {"who": "me", "content": "Pretty good, you?"},
      {"who": "me", "content": "Pretty good, you?"},
      {"who": "me", "content": "Pretty good, you?"},
      {"who": "me", "content": "Pretty good, you?"},
      {"who": "me", "content": "Pretty good, you?"},
      {"who": "me", "content": "Pretty good, you?"},
      {"who": "me", "content": "Pretty good, you?"},
      {"who": "me", "content": "Pretty good, you?"},
      {"who": "me", "content": "Pretty good, you?"},
      {"who": "me", "content": "Pretty good, you?"},
      {"who": "me", "content": "Pretty good, you?"},
      {"who": "me", "content": "Pretty good, you?"},
      {"who": "me", "content": "Pretty good, you?"},
      {"who": "me", "content": "Pretty good, you?"},
      {
        "who": "me",
        "content":
            "Pretty good, you?asdhasfjkhaskjfhaksjfhkasfhkasfhkashfkashfkashfkjashfkjashfkj"
      },
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: chatDetailList.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Align(
                    alignment: Alignment.centerLeft,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.asset(
                        "assets/images/pic/cat.png",
                        width: MediaQuery.of(context).size.width * 0.25,
                        height: MediaQuery.of(context).size.width * 0.25,
                      ),
                    ),
                  );
                }

                final chatIndex = index - 1;
                bool isMe = chatDetailList[chatIndex]['who'] == 'me';
                return Row(
                  mainAxisAlignment:
                      isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        padding: EdgeInsets.symmetric(vertical: 5),
                        margin: EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey[200],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            chatDetailList[chatIndex]['content']!,
                            maxLines: null,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: customTextFormField(
                  context: context,
                  hintText: "메세지를 입력해주세요",
                  obscureText: false,
                ),
              ),
              SizedBox(width: 10),
              InkWell(
                onTap: () {},
                child: Icon(Icons.send, size: 30),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

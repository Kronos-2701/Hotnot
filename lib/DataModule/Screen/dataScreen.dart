import 'package:flutter/material.dart';
import 'package:hotnot/DataModule/Repository/dataRepository.dart';
import 'package:hotnot/Utils/Cutom_TextStyle.dart';
import 'package:hotnot/alert_dialogue_box.dart';

class data_Screen extends StatefulWidget {
  const data_Screen({Key? key}) : super(key: key);

  @override
  State<data_Screen> createState() => _data_ScreenState();
}

int length = 15;
late int fullLength;

class _data_ScreenState extends State<data_Screen> {
  ScrollController scroller = ScrollController();
  @override
  void initState() {
    scroller.addListener(() {
      if (scroller.offset == scroller.position.maxScrollExtent) {
        if (fullLength > length) {
          setState(() {
            length += 5;
          });
        }
      }
      super.initState();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("DATA",
            style: CustomTextStyle().boldHeading(25, Colors.white)),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              AlertDialogueBoxCustom().alertDialogueBoxCustomForLogout(context);
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: Data_Repository().getdata(),
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          } else {
            fullLength = snapshot.data.length;

            return ListView.builder(
              controller: scroller,
              physics: const BouncingScrollPhysics(),
              itemCount: length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Card(
                    child: ListTile(
                      leading: Padding(
                        padding: const EdgeInsets.only(top: 4, bottom: 4),
                        child:
                            Image.network(snapshot.data![index].url.toString()),
                      ),
                      title: Text(snapshot.data![index].title.toString(),
                          style: CustomTextStyle().poppins500()),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

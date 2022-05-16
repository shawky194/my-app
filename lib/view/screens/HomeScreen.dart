import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../constant.dart';
import '../../controller/Api.dart';
import '../Widget/categoryButton.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGround,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text("Choose News Category",
                  style: TextStyle(
                    color: textColoer,
                    fontSize: fontLargTitel,
                  )),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 14,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  categoryButton(
                    textButton: 'Sports',
                    colorButton: red,
                  ),
                  categoryButton(
                    textButton: 'general',
                    colorButton: yellow2,
                  ),
                  categoryButton(
                    textButton: 'health',
                    colorButton: yellow,
                  ),
                  categoryButton(
                    textButton: 'science',
                    colorButton: yellow3,
                  ),
                  categoryButton(
                    textButton: 'technology',
                    colorButton: yellow4,
                  ),
                  categoryButton(
                    textButton: 'sources',
                    colorButton: yellow5,
                  ),
                ],
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: Api.fetchArticles(),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  return (snapshot.hasData)
                      ? ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListView(
                              children: [
                                Card(
                                  color: white,
                                  elevation: 5,
                                  shadowColor: textColoer,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                    '${snapshot.data[index].urlToImage}')),
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(25),
                                                topRight: Radius.circular(25)),
                                            color: Colors.redAccent,
                                          ),
                                          height: 200,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Text(
                                            "${snapshot.data[index].title}",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: textColoer,
                                                fontWeight: FontWeight.w800),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            IconButton(
                                                onPressed: () {


                                                },
                                                icon: Icon(
                                                  Icons.share_rounded,
                                                  size: 28,
                                                )),
                                            IconButton(
                                                onPressed: () {
                                                  Clipboard.setData(ClipboardData(text: "${snapshot.data[index].title}"));
                                                },
                                                icon: Icon(
                                                  Icons.copy_rounded,
                                                  size: 28,
                                                ))
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        )
                      : Center(child: CircularProgressIndicator());
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

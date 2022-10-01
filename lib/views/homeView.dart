import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task/repository/dataLocal.dart';
import '../repository/dataAPI.dart';
import '../viewModels/homeViewModel.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List dataAll=[];
  var data = HomeViewModel(dataRepository: DataLocal());
  @override
  void initState() {
    dataAll= data.getAllData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(data.title),
          centerTitle: true,
          backgroundColor: data.color,
        ),
        body: ListView.builder(
          itemCount: dataAll.length,
            itemBuilder: (context,index){
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: data.heightSpace,),
                Container(
                  padding: data.padding,
                  child: Text(dataAll[index].title,style: TextStyle(fontSize: data.fontSize-5),textAlign: TextAlign.center ,),
                  decoration: BoxDecoration(
                    color: data.color,
                    borderRadius: data.borderRadius,
                  ),
                ),
                Container(
                  height: 300,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 300,
                        width: 200,
                        child: Image.network(dataAll[index].image),
                      ),
                      SizedBox(width: data.widthSpace,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: data.padding,
                            child: Text(dataAll[index].category[0].toUpperCase()+dataAll[index].category.substring(1) ,style: TextStyle(fontSize: data.fontSize),),
                            decoration: BoxDecoration(
                              color: data.color,
                              borderRadius: data.borderRadius,
                            ),
                          ),
                          Container(
                            padding: data.padding,
                            child:
                            Column(
                              children: [
                                Text("The Rate : ${dataAll[index].rating.rate.toString()}",style: TextStyle(fontSize: data.fontSize),),
                                SizedBox(height: 10,),
                                Row(
                                  children : [...List.generate(int.parse(dataAll[index].rating.rate.round().toString()), (index) => Icon(Icons.star, color: Colors.yellow)),]
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                              color: data.color,
                              borderRadius: data.borderRadius,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Text("Price : ${dataAll[index].price.toString()}",style: TextStyle(fontSize: data.fontSize ),),
                            decoration: BoxDecoration(
                              color: data.color,
                              borderRadius: data.borderRadius,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Text("Count : ${dataAll[index].rating.count.toString()}",style: TextStyle(fontSize: data.fontSize ),),
                            decoration: BoxDecoration(
                              color: data.color,
                              borderRadius: data.borderRadius,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: data.heightSpace,),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text(dataAll[index].description,),
                  decoration: BoxDecoration(
                    color: data.color,
                    borderRadius: data.borderRadius,
                  ),
                ),
                Divider(
                  color: Colors.black,
                  thickness: 2,
                )

              ],
            );
            }
        )
    );
  }
}


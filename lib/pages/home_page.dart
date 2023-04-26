import 'package:flutter/material.dart';


import '../model/dishes_list_model.dart';
import '../services/api_services.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ApiService client = ApiService();
  final List<String> dishesCuisines = <String>[
    'Italian',
    'Indian',
    'Mexican',
    'Chinese',
    'Spanish',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Select Dishes",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        leading: const Icon(
          Icons.arrow_back_ios,
          color: Colors.grey,
          size: 20,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Stack(
              clipBehavior: Clip.none,
              fit: StackFit.passthrough,
              children: <Widget>[
                // Max Size Widget
                Container(
                  height: 100,
                  width: double.infinity,
                  color: Colors.black,
                ),
                Positioned(
                  top: 50,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 50,
                    color: Colors.white,
                  ),
                ),
                Positioned(
                    top: 25,
                    left: 25,
                    right: 25,
                    child: Container(
                      height: 60,
                      padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 4,
                            )
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Row(
                            children: [
                              Icon(
                                Icons.calendar_month_outlined,
                                color: Colors.black,
                                size: 20,
                              ),
                              Text(
                                " 21 May 2021",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15),
                              )
                            ],
                          ),
                          Container(
                            height: double.infinity,
                            width: 1,
                            color: Colors.grey.shade400,
                          ),
                          const Row(
                            children: [
                              Icon(
                                Icons.alarm,
                                color: Colors.black,
                                size: 20,
                              ),
                              Text(
                                " 10:30 Pm:12:30 Pm",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15),
                              )
                            ],
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ),
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: dishesCuisines.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    //  height: 30,
                    width: 80,
                    margin: const EdgeInsets.only(left: 10),
                    //  padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            color: (index == 0) ? Colors.orange : Colors.grey,
                            width: 1)),
                    child: Center(
                      child: Text(
                        dishesCuisines[index],
                        style: TextStyle(
                            color: (index == 0) ? Colors.orange : Colors.grey,
                            fontSize: 14,
                            fontWeight: (index == 0)
                                ? FontWeight.bold
                                : FontWeight.w500),
                      ),
                    ),
                  );
                }),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              "Popular Dishes",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            height: 90,
            padding: const EdgeInsets.only(left: 20),
            child: FutureBuilder<DishesListModel>(
                future: client.getDishes(),
                builder: (BuildContext context,
                    AsyncSnapshot<DishesListModel> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.popularDishes!.length,
                          itemBuilder: (context, index) {
                            var data = snapshot.data!.popularDishes![index];
                            return Container(
                              padding: const EdgeInsets.all(2),
                              margin: const EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color:(index==0) ?Colors.white : Colors.orange,
                                    width: 1
                                ),
                              ),
                              child: Container(
                                height: 70,
                                width: 70,
                                // margin: const EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.green,

                                  image: DecorationImage(
                                    image: NetworkImage(data.image!,),
                                    fit: BoxFit.cover,
                                    colorFilter:ColorFilter.mode(
                                        Colors.black.withOpacity(0.4),
                                        BlendMode.darken),
                                  ),
                                ),
                                child: Center(
                                  child: Text(data.name!,style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14
                                  ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            );
                          });
                    }
                  }

                  return const Center(
                    child: Text(''),
                  );
                }),
          ),
          Container(
            width: double.infinity,
            child:  FutureBuilder<DishesListModel>(
                future: client.getDishes(),
                builder: (BuildContext context,
                    AsyncSnapshot<DishesListModel> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data!.dishes!.length,
                          itemBuilder: (context, index) {
                            var data = snapshot.data!.dishes![index];
                            return Container(
                              //height: 500,
                              padding: const EdgeInsets.all(20),

                              child: Row(
                                children: [

                                  SizedBox(
                                    // height:100,
                                    width: MediaQuery.of(context).size.width*0.55,
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(data.name!,style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold
                                              ),),
                                              const Image(image: AssetImage("images/group.png"),),
                                              Container(padding: const EdgeInsets.symmetric(vertical: 1,horizontal: 6),
                                                decoration: BoxDecoration(
                                                    color: Colors.green,
                                                    borderRadius: BorderRadius.circular(5)
                                                ),
                                                child: Row(
                                                  children: [
                                                    Text(data.rating! .toString(),style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12
                                                    ),),
                                                    const Icon(Icons.star,color: Colors.white,size: 12,)
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                          const SizedBox(height: 10,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              Row(
                                                children: data.equipments!.map((e) {
                                                return  Column(
                                                  children: [
                                                    const Image(image: AssetImage("images/refrigerator.png")),
                                                    Padding(
                                                      padding: const EdgeInsets.symmetric(vertical:2,horizontal: 5),
                                                      child: Text(e,style: const TextStyle(
                                                        fontSize: 8
                                                      ),),
                                                    )
                                                  ],
                                                );
                                              }).toList(),),
                                              Container(
                                                height: 30,
                                                width: 1,
                                                color: Colors.grey.shade300,
                                              ),
                                              const Column(
                                                mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  Text("Ingredients",style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold
                                                  ),),
                                                  Row(
                                                    children: [
                                                      Text("View list ",style: TextStyle(
                                                        color: Colors.orange,
                                                        fontSize: 10
                                                      ),),
                                                      Icon(Icons.arrow_forward_ios,size: 8,color: Colors.orange,)
                                                    ],
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                          const SizedBox(height: 10,),
                                          Text(data.description!,style: const TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey
                                          ),textAlign: TextAlign.left,)
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width*0.35,

                                  )
                                ],
                              ),
                            );
                          });
                    }
                  }

                  return const Center(
                    child: Text(''),
                  );
                }),
          )
        ],
      ),
    );
  }
}


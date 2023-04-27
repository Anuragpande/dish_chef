import 'package:flutter/material.dart';
import 'package:star_chef/model/ingredients_model.dart';
import 'package:star_chef/services/api_services.dart';

class IngredientsScreen extends StatefulWidget {
  const IngredientsScreen({Key? key}) : super(key: key);

  @override
  State<IngredientsScreen> createState() => _IngredientsScreenState();
}

class _IngredientsScreenState extends State<IngredientsScreen> {
  ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    final setHieght = MediaQuery.of(context).size.height;
    final setWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<IngredientsModel>(
          future: apiService.getIngredients(),
          builder:
              (BuildContext context, AsyncSnapshot<IngredientsModel> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                var data = snapshot.data!;
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 370,
                        width: double.infinity,
                       // color: Colors.green,
                        child: Stack(
                          children: [
                            Positioned(
                                top: 20,
                                right: -30,
                                child: Container(
                                  height: 250,
                                  width: 250,
                                  decoration: const BoxDecoration(
                                      color: Color(0xFFFFF9F2),
                                      shape: BoxShape.circle),
                                )),
                            Positioned(
                                top: 90,
                                right: -220,
                                child: Image.asset('images/vegetable1.png',height: 250,)),
                            Positioned(
                                top: 70,
                                right: -80,
                                child: Image.asset('images/vegetable2.png',height: 250,)),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        data.name!,
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 1, horizontal: 3),
                                        decoration: BoxDecoration(
                                            color: Colors.green,
                                            borderRadius:
                                                BorderRadius.circular(2)),
                                        child: Row(
                                          children: const [
                                            Text(
                                              "4.2",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10),
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Colors.white,
                                              size: 10,
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  const Text(
                                    "Mughlai Masala is a style of cookery developed\n"
                                    " in the Indian Subcontinent by\n"
                                    " the imperial kitchens of the Mughal Empire.",
                                    style: TextStyle(
                                        color: Color(0xffa3a3a3), fontSize: 12),
                                  ),
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  Row(
                                    children: [
                                      const Image(
                                          image: AssetImage('images/time.png')),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        data.timeToPrepare!,
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 17),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  const Divider(
                                    height: 3,
                                    thickness: 3,
                                    endIndent: 220,
                                    color: Color(0xfff2f2f2),
                                  ),
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  const Text('Ingredients',style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold
                                  ),),
                                  const Text('For 2 people',style: TextStyle(
                                      color: Color(0xff8a8a8a),
                                      fontSize: 12,
                                     // fontWeight: FontWeight.bold
                                  ),),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Divider(
                                   // height: 1,
                                    thickness: 2,
                                    color: Color(0xfff2f2f2),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          children: [
                            Row(
                              children: const [
                              Text("Vegetables (05)",style: TextStyle(color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),),
                              Icon(Icons.arrow_drop_down_outlined,size: 30,),
                            ],),
                            SizedBox(
                              height: 90,
                            //  color: Colors.grey,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: data!.ingredients!.vegetables!.map((e) {
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(e.name!,style: const TextStyle(color: Color(0xff1c1c1c)),),
                                      Text(e.quantity!,style: const TextStyle(color: Color(0xff1c1c1c)),),
                                    ],
                                  );
                                } ).toList(),
                              ),
                            ),
                            SizedBox(height: 10,),
                            Row(
                              children: const [
                                Text("Spices (10)",style: TextStyle(color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),),
                                Icon(Icons.arrow_drop_down_outlined,size: 30,),
                              ],),
                            SizedBox(
                              height: 60,
                              //  color: Colors.grey,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: data!.ingredients!.spices!.map((e) {
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(e.name!,style: const TextStyle(color: Color(0xff1c1c1c)),),
                                      Text(e.quantity!,style: const TextStyle(color: Color(0xff1c1c1c)),),
                                    ],
                                  );
                                } ).toList(),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }
            }
            return const Center(
              child: Text('Please Check your Internet Connection!'),
            );
          }),
    );
  }
}

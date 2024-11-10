import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Shimmer extends StatelessWidget {
  const Shimmer({super.key});

  @override
  Widget build(BuildContext context) {
     return Column(
       children: [
        Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: TextFormField(
                maxLines: 1,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 2),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none),
                    filled: true,
                    fillColor: Colors.grey[250],
                    prefixIcon: const Icon(Icons.search),
                    hintText: 'Search...'
                    ),
              ),
            ),
         Expanded(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 0.6, crossAxisCount: 2),
         
                      //builds the gridview
                      itemBuilder: (context, index) {
                        //container returned inside the girdview
                        return Container(
                          height: 500,
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom:
                                      BorderSide(color: Colors.grey, width: 0.2),
                                  left:
                                      BorderSide(color: Colors.grey, width: 0.2),
                                  right:
                                      BorderSide(color: Colors.grey, width: 0.2),
                                  top: BorderSide.none)),
                          child: Column(
                            children: [
                              //cover picture
                              Container(
                                margin: const  EdgeInsets.only(top: 5),
                                height: 200,
                                child:  Center(
                                  child: Container(
                                    width: 150,
                                    color: Colors.grey[300],
                                  ),
                                ),
                              ),
                        
                              //book details
                              Expanded(
                                child: Align(alignment: Alignment.centerLeft,
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 15,
                                        ),
                                      textbox(200),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                       textbox(150),
                                        const SizedBox(
                                          height: 6,
                                        ),
                                       textbox(100)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      itemCount:10,
                    ),
                  ),
                ),
       ],
     );
  }
}

Widget textbox(double width){
  return Container(width: width,
  height: 20,
  color: Colors.grey[300],);
}
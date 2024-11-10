import 'package:books/core/const/grid.dart';
import 'package:books/domain/models/book_model.dart';
import 'package:books/presantation/detailedscreen/widgets/textfield.dart';
import 'package:books/presantation/homescreen/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailedView extends StatefulWidget {
  final BookModel book;
  const DetailedView({super.key, required this.book});

  @override
  State<DetailedView> createState() => _DetailedViewState();
}

class _DetailedViewState extends State<DetailedView> {
  final titlecontroller = TextEditingController();
  final descontroller = TextEditingController();
  final datecontroller = TextEditingController();
  final urlcontroller = TextEditingController();
  final pricecontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
    titlecontroller.text = widget.book.title;
    descontroller.text = widget.book.description;
    datecontroller.text = widget.book.publishedDate;
    urlcontroller.text = widget.book.coverUrl;
    pricecontroller.text = widget.book.price.toString();
  }

  @override
  void dispose() {
    super.dispose();
    titlecontroller.dispose();
    descontroller.dispose();
    datecontroller.dispose();
    urlcontroller.dispose();
    pricecontroller.dispose();
  }

  void updatetext() {
    final newtitle = titlecontroller.text.trim();
    final newdesc = descontroller.text.trim();
    final newdate = datecontroller.text.trim();
    final newurl = urlcontroller.text.trim();
    final newprce = int.parse(pricecontroller.text.trim());

    context.read<HomeBloc>().add(UpdateBook(
        id: widget.book.id,
        title: newtitle,
        description: newdesc,
        date: newdate,
        coverPictureURL: newurl,
        authorId: widget.book.authorid,
        price: newprce));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Appbar
      appBar: AppBar(
        leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back_ios)),
        actions: [
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Edit'),
                    actions: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          textfield(
                            controller: titlecontroller,
                            lines: 1,
                            hint: 'Title',
                          ),
                          Grid.grid2(context),
                          textfield(
                            controller: descontroller,
                            lines: 3,
                            hint: 'Description',
                          ),
                          Grid.grid2(context),
                          textfield(
                            controller: datecontroller,
                            lines: 1,
                            hint: 'Publised date',
                          ),
                          Grid.grid2(context),
                          textfield(
                            controller: urlcontroller,
                            lines: 2,
                            hint: 'coverpicture url',
                          ),
                          Grid.grid2(context),
                          textfield(
                            controller: pricecontroller,
                            lines: 1,
                            hint: 'price',
                          ),
                          Grid.grid2(context),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                onTap: () => Navigator.pop,
                                child: const Text(
                                  'Cancel',
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  updatetext();
                                  context.read<HomeBloc>().add(FetchBooks());
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  width: 100,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.orange,
                                  ),
                                  child: const Center(
                                    child: Text('Update'),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  );
                },
              );
            },
            child: const Icon(Icons.edit),
          )
        ],
      ),

      //Body
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //image container
            SizedBox(
              height: 300,
              child: Center(
                child: ClipRRect(
                  child: Image.network(widget.book.coverUrl),
                ),
              ),
            ),

            //Details of the book
            Expanded(
                child: Container(
              margin: const EdgeInsets.all(20),
              child: ListView(
                children: [
                  Text(
                    widget.book.title,
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.w700),
                  ),
                  Text(widget.book.authorName,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      )),
                  Grid.grid2(context),
                  Text(widget.book.publishedDate,
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w200,
                          color: Colors.grey)),
                  Grid.grid2(context),
                  Text(
                    widget.book.description,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w300),
                    textAlign: TextAlign.justify,
                  )
                ],
              ),
            ))
          ],
        ),
      ),

      //Botttom appbar
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '₹ ${widget.book.price}.00',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            Container(
              width: 100,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.orange,
              ),
              child: const Center(
                child: Text(
                  'Buy now',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w800),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

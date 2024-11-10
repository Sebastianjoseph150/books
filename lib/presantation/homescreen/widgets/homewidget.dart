import 'package:books/domain/models/book_model.dart';
import 'package:books/presantation/detailedscreen/detailedview.dart';
import 'package:books/presantation/homescreen/bloc/home_bloc.dart';
import 'package:books/presantation/homescreen/subwidgets/booksshimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return const Shimmer();
        } else if (state is HomeError) {
          return Center(
            child: Text(state.messge),
          );
        } else if (state is HomeLoaded) {
          List<BookModel> book = state.booklist;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //searchbox
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: TextFormField(
                  onChanged: (value) {
                    value.isNotEmpty
                        ? context.read<HomeBloc>().add(Search(
                              value: value,
                              book: book,
                            ))
                        : context.read<HomeBloc>().add(FetchBooks());
                  },
                  maxLines: 1,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 2),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none),
                      filled: true,
                      fillColor: Colors.grey[250],
                      prefixIcon: const Icon(Icons.search),
                      hintText: 'Search...'),
                ),
              ),

              //gridview
              Expanded(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 0.6, crossAxisCount: 2),

                    //builds the gridview
                    itemBuilder: (context, index) {
                      //container returned inside the girdview
                      return InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) => DetailedView(
                                      book: book[index],
                                    ))),
                        child: Container(
                          height: 450,
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Colors.grey, width: 0.2),
                                  left: BorderSide(
                                      color: Colors.grey, width: 0.2),
                                  right: BorderSide(
                                      color: Colors.grey, width: 0.2),
                                  top: BorderSide.none)),
                          child: Column(
                            children: [
                              //cover picture
                              Container(
                                margin: const EdgeInsets.only(top: 5),
                                height: 180,
                                child: Center(
                                  child: ClipRRect(
                                    child: Image.network(book[index].coverUrl),
                                  ),
                                ),
                              ),

                              //book details
                              Expanded(
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          book[index].title,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              fontSize: 9,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        const SizedBox(
                                          height: 1,
                                        ),
                                        Text(book[index].authorName),
                                        const SizedBox(
                                          height: 6,
                                        ),
                                        Text(
                                          '₹ ${book[index].price.toString()}.00',
                                          style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w800),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: book.length,
                  ),
                ),
              )
            ],
          );
        } else {
          return const Center(
            child: Text('"Something went wrong"'),
          );
        }
      },
    );
  }
}

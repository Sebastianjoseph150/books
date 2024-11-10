import 'dart:math';

import 'package:books/core/const/colors.dart';
import 'package:books/presantation/homescreen/bloc/author_bloc.dart';
import 'package:books/presantation/homescreen/subwidgets/authorshimmer.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthorsView extends StatefulWidget {
  const AuthorsView({super.key});

  @override
  State<AuthorsView> createState() => _AuthorsViewState();
}

class _AuthorsViewState extends State<AuthorsView> {
  @override
  void initState() {
    super.initState();
    context.read<AuthorBloc>().add(FetchAuhtors());
  }

  final random = Random();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: SizedBox(
        height: MediaQuery.of(context).size.height,

        //listview of authors
        child: BlocBuilder<AuthorBloc, AuthorState>(
          builder: (context, state) {
            if (state is AuthorLoading) {
              return const AuthorShimmer();
            } else if (state is AuthorError) {
              return Center(
                child: Text(state.messge),
              );
            } else if (state is AuthorLoaded) {
              final authors = state.authorlist;
              return ListView.separated(
                  itemBuilder: (context, index) {
                    //Details of each author
                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 80,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            width: 10,
                          ),

                          //Circleavatar
                          CircleAvatar(
                            backgroundColor: ColorClass.colorlist[
                                random.nextInt(ColorClass.colorlist.length)],
                            child: Center(
                                child: Text(
                              authors[index].name[0].toUpperCase(),
                              style: TextStyle(
                                  color: ColorClass.textcolor[random
                                      .nextInt(ColorClass.colorlist.length)],
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700),
                            )),
                          ),
                          const SizedBox(
                            width: 10,
                          ),

                          //Auhtor name and details
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  authors[index].name,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  authors[index].biography,
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.grey),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 15,
                      ),
                  itemCount: authors.length);
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}

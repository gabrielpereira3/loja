import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:transparent_image/transparent_image.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    Widget _buildBodyBack() => Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 7, 194, 215),
                Color.fromARGB(255, 162, 216, 236),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        );

    return Stack(
      children: [
        _buildBodyBack(),
        CustomScrollView(
          slivers: [
            const SliverAppBar(
              floating: true,
              snap: true,
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              flexibleSpace: FlexibleSpaceBar(
                title: Text('Novidades'),
                centerTitle: true,
              ),
            ),
            SliverToBoxAdapter(
              child: FutureBuilder<QuerySnapshot>(
                future: FirebaseFirestore.instance.collection("home").orderBy("pos").get(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return StaggeredGrid.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 4,
                      children: snapshot.data!.docs.map((doc) {
                        return StaggeredGridTile.count(
                                  crossAxisCellCount: doc["x"],
                                  mainAxisCellCount: doc["y"],
                                  child: FadeInImage.memoryNetwork(
                                    placeholder: kTransparentImage,
                                    image: doc["image"],
                                    fit: BoxFit.cover,
                                  ),
                                );
                      }).toList(),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}

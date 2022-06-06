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
                Color.fromARGB(255, 37, 149, 230),
                Color.fromARGB(255, 140, 189, 234),
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



              // StaggeredGrid.count(
              //   crossAxisCount: 2,
              //   mainAxisSpacing: 4,
              //   crossAxisSpacing: 4,
              //   children: [
              //     StaggeredGridTile.count(
              //       crossAxisCellCount: 2,
              //       mainAxisCellCount: 2,
              //       child: FadeInImage.memoryNetwork(
              //         placeholder: kTransparentImage,
              //         image:
              //             "https://cdn.mos.cms.futurecdn.net/7YrobQvFFzw8aWsAUtoYXB-970-80.jpg.webp",
              //         fit: BoxFit.cover,
              //       ),
              //     ),
              //     StaggeredGridTile.count(
              //       crossAxisCellCount: 2,
              //       mainAxisCellCount: 1,
              //       child: FadeInImage.memoryNetwork(
              //         placeholder: kTransparentImage,
              //         image:
              //             "https://www.historyhit.com/app/uploads/fly-images/5150284/Valley-of-the-Temples-788x537.jpg",
              //         fit: BoxFit.cover,
              //       ),
              //     ),
              //     StaggeredGridTile.count(
              //       crossAxisCellCount: 1,
              //       mainAxisCellCount: 2,
              //       child: FadeInImage.memoryNetwork(
              //         placeholder: kTransparentImage,
              //         image:
              //             "https://previews.123rf.com/images/rglinsky/rglinsky1201/rglinsky120100188/12336990-vertical-oriented-image-of-famous-eiffel-tower-in-paris-france-.jpg?fj=1",
              //         fit: BoxFit.cover,
              //       ),
              //     ),
              //     StaggeredGridTile.count(
              //       crossAxisCellCount: 1,
              //       mainAxisCellCount: 1,
              //       child: FadeInImage.memoryNetwork(
              //         placeholder: kTransparentImage,
              //         image:
              //             "https://www.clementoni.com/media/prod/pt/33548/thumbs/coliseum-sunrise-3000-pecas-high-quality-collection_7X2dCym.jpg.460x460_q100.jpg",
              //         fit: BoxFit.cover,
              //       ),
              //     ),
              //     StaggeredGridTile.count(
              //       crossAxisCellCount: 1,
              //       mainAxisCellCount: 1,
              //       child: FadeInImage.memoryNetwork(
              //         placeholder: kTransparentImage,
              //         image:
              //             "https://conteudo.imguol.com.br/c/entretenimento/e7/2021/09/07/big-ben-londres-1631023261553_v2_900x506.jpg.webp",
              //         fit: BoxFit.cover,
              //       ),
              //     ),
              //   ],
              // ),
            ),
          ],
        ),
      ],
    );
  }
}

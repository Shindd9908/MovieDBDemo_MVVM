import 'package:flutter/material.dart';
import 'package:newdemo/view/list_film_view_model.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../cover_loading.dart';
import '../no_result_page.dart';

class ListFilmPage extends StatefulWidget {
  const ListFilmPage({Key? key}) : super(key: key);

  @override
  State<ListFilmPage> createState() => _ListFilmPageState();
}

class _ListFilmPageState extends State<ListFilmPage> {
  final RefreshController _refreshController = RefreshController(initialRefresh: false);
  final ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ListFilmViewModel>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Back', style: TextStyle(color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.w700),),
        leading: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 18.0,),
        elevation: 0.0,
      ),
      body: Stack(
        children: [
          CoverLoading(
            showLoading: viewModel.isLoading,
            child: SmartRefresher(
              controller: _refreshController,
              scrollController: scrollController,
              enablePullUp: true,
              onRefresh: () {
                viewModel.refreshData(
                  needShowLoading: false,
                  onLoadedCallback: () {
                    _refreshController.refreshCompleted();
                  },
                );
              },
              onLoading: () {
                viewModel.loadMore(onLoadedCallback: () {
                  _refreshController.loadComplete();
                });
              },
              child: viewModel.showEmptyLayout
                  ? const NoResultPage()
                  : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Popular list',style: TextStyle(color: Colors.grey.shade600, fontSize: 18.0, fontWeight: FontWeight.w700)),
                      const SizedBox(height: 30.0,),
                      GridView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: viewModel.data.isEmpty ? 0 : viewModel.data.length - 1,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 25,
                            crossAxisSpacing: 15,
                            childAspectRatio: 180 / 240,
                          ),
                          itemBuilder: (_, index) {
                            final movie = viewModel.data[index];
                            return Container(
                              height: 180,
                              width: 90,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 3,
                                    blurRadius: 7,
                                    offset: const Offset(1.0, 9.0),
                                  ),
                                ]
                              ),
                              child: Stack(
                                children: [
                                  Column(
                                    children: [Image.network(movie.imageUrl)],
                                  ),
                                  SafeArea(
                                    bottom: true,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 6.0,bottom: 6.0),
                                      child: Column(
                                        children: [
                                          const Text('2008',
                                            style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400, color: Colors.white),
                                            maxLines: 1,
                                          ),
                                          const SizedBox(height: 6.0,),
                                          Text(movie.title?.toUpperCase() ?? '',
                                            style: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w700, color: Colors.white),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                      child: Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(60.0),
                                          color: Colors.green,
                                        ),
                                        child: Center(
                                          child: Text(movie.voteAverage.toString(),
                                            style: const TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400, color: Colors.white),
                                            maxLines: 1,
                                          ),
                                        ),
                                      ),
                                    right: 3.0,
                                    top: 3.0,
                                  ),
                                ],
                              ),
                            );
                          },
                      ),
                      const SizedBox(height: 30.0,),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

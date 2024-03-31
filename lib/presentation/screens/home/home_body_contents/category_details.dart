import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/models/news_category.dart';
import 'package:news_app/business_logic/cubit/category_details_viewmodel.dart';
import 'package:news_app/business_logic/cubit/states/source_states.dart';
import 'package:news_app/presentation/widgets/news_sourses/sourses_tab_bar.dart';

/// Localization_import
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CategoryDetails extends StatefulWidget {
  final NewsCategory category;

  const CategoryDetails({required this.category, super.key});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  var viewModel = CategoryDetailsViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.getNewsSoursesByCategoryId(widget.category.id ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryDetailsViewModel, SourceStates>(
        bloc: viewModel,
        builder: ((context, state) {
          ///* Handling the [SourceStates] here

          if (state is SourceErrorState) {
            return Center(
              child: Column(
                children: [
                  Text(state.errorMessage ?? ""),
                  ElevatedButton(
                    onPressed: () {
                      viewModel
                          .getNewsSoursesByCategoryId(widget.category.id ?? "");
                    },
                    child: const Text(
                      "Try Again",
                    ),
                  ),
                ],
              ),
            );
          }

          if (state is SourceSuccessState) {
            return SoursesTabBar(sources: state.sources ?? []);
          }

          /// (state here is SourceLoadingState)
          return const Center(
            child: CircularProgressIndicator(),
          );
        }));
  }
}

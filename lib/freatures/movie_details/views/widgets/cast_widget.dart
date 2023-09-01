import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golcoin_movies/core/views/widgets/shimmer_placeholder.dart';
import 'package:golcoin_movies/freatures/movie_details/cubit/cast_state.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/di/injection_container.dart';
import '../../cubit/cast_cubit.dart';
import 'actor_item.dart';

class CastWidget extends StatefulWidget {
  const CastWidget({super.key, required this.movieId});

  final num? movieId;

  @override
  State<CastWidget> createState() => _CastWidgetState();
}

class _CastWidgetState extends State<CastWidget> {
  late CastCubit _castCubit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _castCubit = getIt<CastCubit>();
    _getData();
  }

  void _getData() {
    _castCubit.getCredit(widget.movieId?.toInt() ?? 0);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 8.w,
            ),
            child: Text(
              'cast'.tr(),
              style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Theme.of(context).colorScheme.secondary),
            ),
          ),
          BlocBuilder<CastCubit, CastState>(
              bloc: _castCubit,
              builder: (context, state) {
                return state.maybeWhen(
                    loaded: (result) {
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w,
                        ),
                        child: Container(
                          constraints: BoxConstraints(minWidth: MediaQuery.sizeOf(context).width - 16.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: List.generate(
                                result?.cast?.length ?? 0,
                                (index) => ActorItem(
                                      cast: result?.cast?[index],
                                    )),
                          ),
                        ),
                      );
                    },
                    loading: () => CustomShimmer.creditsListShimmer(),
                    orElse: () => const SizedBox.shrink());
              }),
        ],
      ),
    );
  }
}

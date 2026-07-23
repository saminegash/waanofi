import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SkeletonLoader extends StatelessWidget {
  const SkeletonLoader({super.key, this.width, this.height, this.borderRadius = 8.0});

  final double? width;
  final double? height;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}

class ListSkeleton extends StatelessWidget {
  const ListSkeleton({super.key, this.itemCount = 5});
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemCount,
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.only(bottom: 16.0),
          child: Row(
            children: [
              SkeletonLoader(width: 48, height: 48, borderRadius: 24),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SkeletonLoader(width: double.infinity, height: 16),
                    SizedBox(height: 8),
                    SkeletonLoader(width: 100, height: 12),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

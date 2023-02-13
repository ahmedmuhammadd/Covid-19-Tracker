import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      highlightColor: Colors.grey.shade100,
      baseColor: Colors.grey.shade700,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 8,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                title: Container(
                  height: 10,
                  width: double.infinity,
                  color: Colors.white,
                ),
                subtitle: Container(
                  height: 10,
                  width: double.infinity,
                  color: Colors.white,
                ),
                leading: Container(
                  height: 50,
                  width: 50,
                  color: Colors.white,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

import 'package:bdc/presentation/rewards_screen/redeemed_rewards.dart';
import 'package:bdc/presentation/rewards_screen/rewards_screen.dart';
import 'package:flutter/material.dart';

class RewardPage extends StatefulWidget {
  const RewardPage({super.key});

  @override
  State<RewardPage> createState() => _RewardPageState();
}

class _RewardPageState extends State<RewardPage> {
  final List<Widget> _tabs = [
    RewardsScreen(),
    RedeemedRewards(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('My Rewards'),
        ),
        body: TabBarView(
          children: _tabs,
        ),
      ),
    );
  }
}

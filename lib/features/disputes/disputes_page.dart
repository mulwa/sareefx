import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sareefx/features/disputes/dispute_progress.dart';
import 'package:sareefx/features/disputes/models/dispute_model.dart';

// Main Disputes List Page
class DisputesPage extends StatefulWidget {
  const DisputesPage({super.key});

  @override
  State<DisputesPage> createState() => _DisputesPageState();
}

class _DisputesPageState extends State<DisputesPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF1E3A5F), Color(0xFF2C4F7C)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header
              Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.arrow_back, color: Colors.black),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Disputes',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Here are some of the dispute raised',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Tabs
              Container(
                color: Color(0xFF1E3A5F),
                child: TabBar(
                  controller: _tabController,
                  indicatorColor: Colors.amber,
                  indicatorWeight: 3,
                  labelColor: Colors.amber,
                  unselectedLabelColor: Colors.white,
                  tabs: [
                    Tab(text: 'All'),
                    Tab(text: 'Complete'),
                    Tab(text: 'Pending'),
                  ],
                ),
              ),
              // Content
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      _buildDisputesList(DisputeFilter.all),
                      _buildDisputesList(DisputeFilter.complete),
                      _buildDisputesList(DisputeFilter.pending),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDisputesList(DisputeFilter filter) {
    final disputes = _getFilteredDisputes(filter);

    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: disputes.length,
      itemBuilder: (context, index) {
        return DisputeCard(
          dispute: disputes[index],
          onTap: () {
            Get.to(() => DisputeProgressPage(dispute: disputes[index]));
          },
        );
      },
    );
  }

  List<Dispute> _getFilteredDisputes(DisputeFilter filter) {
    final allDisputes = [
      Dispute(
        status: DisputeStatus.pending,
        description:
            "I haven't received my exchange after i've made the payment.",
        date: DateTime(2024, 5, 28),
      ),
      Dispute(
        status: DisputeStatus.complete,
        description:
            "I haven't received my exchange after i've made the payment.",
        date: DateTime(2024, 5, 27),
      ),
      Dispute(
        status: DisputeStatus.complete,
        description:
            "I haven't received my exchange after i've made the payment.",
        date: DateTime(2024, 5, 26),
      ),
      Dispute(
        status: DisputeStatus.complete,
        description:
            "I haven't received my exchange after i've made the payment.",
        date: DateTime(2024, 5, 25),
      ),
    ];

    if (filter == DisputeFilter.all) return allDisputes;
    if (filter == DisputeFilter.pending) {
      return allDisputes
          .where((d) => d.status == DisputeStatus.pending)
          .toList();
    }
    return allDisputes
        .where((d) => d.status == DisputeStatus.complete)
        .toList();
  }
}

class DisputeCard extends StatelessWidget {
  final Dispute dispute;
  final VoidCallback onTap;

  const DisputeCard({super.key, required this.dispute, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade200),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Status: ',
                  style: TextStyle(color: Colors.grey, fontSize: 13.sp),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: dispute.status == DisputeStatus.pending
                        ? Colors.orange.shade100
                        : Colors.green.shade100,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    dispute.status == DisputeStatus.pending
                        ? 'Pending'
                        : 'Complete',
                    style: TextStyle(
                      color: dispute.status == DisputeStatus.pending
                          ? Colors.orange.shade800
                          : Colors.green.shade800,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Text(
              dispute.description,
              style: TextStyle(
                color: Color(0xFF1E3A5F),
                fontSize: 14.sp,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

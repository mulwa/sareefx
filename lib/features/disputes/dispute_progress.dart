import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sareefx/features/disputes/models/dispute_model.dart';

class DisputeProgressPage extends StatelessWidget {
  final Dispute dispute;

  const DisputeProgressPage({super.key, required this.dispute});

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
                            'Dispute Progress',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Here is your progress for the dispute raised',
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
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(24),
                    child: Column(
                      children: [
                        _buildProgressItem(
                          isCompleted: true,
                          title: 'Status: ',
                          statusText: 'Pending',
                          isPending: true,
                        ),
                        _buildTimelineConnector(true),
                        _buildProgressItem(
                          isCompleted: true,
                          title: 'Dispute raised',
                          subtitle: 'Tuesday, 28 May 2024',
                        ),
                        _buildTimelineConnector(true),
                        _buildActionItem(
                          isCompleted: true,
                          title: 'Description',
                          description:
                              "The trader didn't send me the currency to my SareeFx Account after i made the transaction to his M-Pesa wallet. Kindly assist",
                          buttonText: 'Chat',
                          buttonColor: Colors.amber,
                          tip:
                              'Tip: You can have the conversation with our customer care for SWIFT communications',
                          onButtonPressed: () {},
                        ),
                        _buildTimelineConnector(true),
                        _buildActionItem(
                          isCompleted: true,
                          title:
                              'Your dispute has been received and is being looked into. Kindly upload your proof of payment',
                          buttonText: 'Proof of Payment',
                          buttonColor: Colors.amber,
                          onButtonPressed: () {},
                        ),
                        _buildTimelineConnector(false),
                        _buildProgressItem(
                          isCompleted: false,
                          title:
                              'After uploading proof of payment we will finalize the decision and update you',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProgressItem({
    required bool isCompleted,
    required String title,
    String? subtitle,
    String? statusText,
    bool isPending = false,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: isCompleted ? Colors.amber : Colors.white,
            shape: BoxShape.circle,
            border: Border.all(
              color: isCompleted ? Colors.amber : Colors.grey.shade300,
              width: 2,
            ),
          ),
          child: isCompleted
              ? Icon(Icons.check, size: 16, color: Colors.white)
              : null,
        ),
        SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (statusText != null)
                Row(
                  children: [
                    Text(
                      title,
                      style: TextStyle(color: Colors.grey, fontSize: 13.sp),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.orange.shade100,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        statusText,
                        style: TextStyle(
                          color: Colors.orange.shade800,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                )
              else
                Text(
                  title,
                  style: TextStyle(
                    color: Color(0xFF1E3A5F),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              if (subtitle != null) ...[
                SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(color: Colors.grey, fontSize: 12.sp),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActionItem({
    required bool isCompleted,
    required String title,
    String? description,
    required String buttonText,
    required Color buttonColor,
    String? tip,
    required VoidCallback onButtonPressed,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: isCompleted ? Colors.amber : Colors.white,
            shape: BoxShape.circle,
            border: Border.all(
              color: isCompleted ? Colors.amber : Colors.grey.shade300,
              width: 2,
            ),
          ),
          child: isCompleted
              ? Icon(Icons.check, size: 16, color: Colors.white)
              : null,
        ),
        SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (description != null) ...[
                Text(
                  title,
                  style: TextStyle(
                    color: Color(0xFF1E3A5F),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 13.sp,
                    height: 1.5,
                  ),
                ),
              ] else
                Text(
                  title,
                  style: TextStyle(
                    color: Color(0xFF1E3A5F),
                    fontSize: 13.sp,
                    height: 1.5,
                  ),
                ),
              SizedBox(height: 12),
              ElevatedButton(
                onPressed: onButtonPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: buttonColor,
                  foregroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  buttonText,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                  ),
                ),
              ),
              if (tip != null) ...[
                SizedBox(height: 8),
                Text(
                  tip,
                  style: TextStyle(color: Colors.blue, fontSize: 11.sp),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTimelineConnector(bool isActive) {
    return Row(
      children: [
        SizedBox(width: 11),
        Container(
          width: 2,
          height: 40,
          color: isActive ? Colors.amber : Colors.grey.shade300,
        ),
      ],
    );
  }
}

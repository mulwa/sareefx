import 'package:flutter/material.dart';

// ProgressStepper Widget with tap navigation
class ProgressStepper extends StatelessWidget {
  final int currentStep; // 1 to 3
  final Function(int)? onStepTapped;

  const ProgressStepper({
    super.key,
    required this.currentStep,
    this.onStepTapped,
  });

  @override
  Widget build(BuildContext context) {
    final steps = ['Type & Price', 'Amount & Method', 'Conditions'];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(steps.length * 2 - 1, (index) {
          if (index.isOdd) {
            // dots between steps
            final connectorIndex = (index ~/ 2) + 1;
            final isGreen = connectorIndex < currentStep;
            return Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(4, (i) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    width: 4,
                    height: 4,
                    decoration: BoxDecoration(
                      color: isGreen ? Colors.green : Colors.grey[300],
                      shape: BoxShape.circle,
                    ),
                  );
                }),
              ),
            );
          }

          final stepIndex = index ~/ 2;
          final stepNumber = stepIndex + 1;
          final isCompleted = stepNumber < currentStep;
          final isCurrent = stepNumber == currentStep;

          return GestureDetector(
            onTap: () {
              // Allow navigation to completed steps or current step
              if (stepNumber <= currentStep && onStepTapped != null) {
                onStepTapped!(stepNumber);
              }
            },
            child: _buildStep(
              label: steps[stepIndex],
              number: stepNumber,
              isCompleted: isCompleted,
              isCurrent: isCurrent,
              canNavigate: stepNumber <= currentStep,
            ),
          );
        }),
      ),
    );
  }

  Widget _buildStep({
    required String label,
    required int number,
    required bool isCompleted,
    required bool isCurrent,
    required bool canNavigate,
  }) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: isCurrent ? FontWeight.w600 : FontWeight.w400,
            color: canNavigate ? Colors.black87 : Colors.grey.shade400,
            decoration: isCurrent
                ? TextDecoration.underline
                : TextDecoration.none,
            decorationColor: isCurrent ? Colors.deepPurpleAccent : null,
          ),
        ),
        const SizedBox(height: 6),
        Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: isCompleted || isCurrent
                  ? Colors.green
                  : Colors.grey.shade400,
              width: 1.5,
            ),
            color: isCompleted ? Colors.green : Colors.white,
          ),
          child: Center(
            child: isCompleted
                ? const Icon(Icons.check, color: Colors.white, size: 16)
                : isCurrent
                ? Container(
                    width: 10,
                    height: 10,
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                  )
                : Text(
                    number.toString(),
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                  ),
          ),
        ),
      ],
    );
  }
}

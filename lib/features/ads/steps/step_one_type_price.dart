import 'package:flutter/material.dart';
import 'package:sareefx/features/controllers/postAd_controller.dart';

class Step1TypeAndPrice extends StatefulWidget {
  final PostAdController controller;

  const Step1TypeAndPrice({super.key, required this.controller});

  @override
  State<Step1TypeAndPrice> createState() => _Step1TypeAndPriceState();
}

class _Step1TypeAndPriceState extends State<Step1TypeAndPrice> {
  bool isBuy = true;
  String asset = 'USD';
  String fiat = 'KES';
  String priceType = 'Fixed';
  final fixedPriceController = TextEditingController(text: '134.00');

  @override
  void dispose() {
    fixedPriceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'I want to',
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[800],
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          _buildBuySellToggle(),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: _buildLabeledDropdown('Asset', asset, [
                  'USD',
                  'BTC',
                  'ETH',
                ], (v) => setState(() => asset = v!)),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: _buildLabeledDropdown('With Fiat', fiat, [
                  'KES',
                  'USD',
                  'EUR',
                ], (v) => setState(() => fiat = v!)),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildCard(
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Price type', style: TextStyle(fontSize: 13)),
                const SizedBox(height: 8),
                _buildDropdownRow(
                  value: priceType,
                  items: ['Fixed', 'Floating'],
                  onChanged: (v) => setState(() => priceType = v ?? 'Fixed'),
                ),
                const SizedBox(height: 12),
                const Text('Fixed', style: TextStyle(fontSize: 12)),
                const SizedBox(height: 8),
                TextField(
                  controller: fixedPriceController,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  decoration: InputDecoration(
                    hintText: '134.00',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 14,
                      horizontal: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          _buildPriceSummary(),
          const SizedBox(height: 28),
          _buildContinueButton(),
        ],
      ),
    );
  }

  Widget _buildBuySellToggle() {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () => setState(() => isBuy = true),
            child: Container(
              height: 46,
              decoration: BoxDecoration(
                color: isBuy ? const Color(0xFFFFC400) : Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              alignment: Alignment.center,
              child: Text('Buy', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: GestureDetector(
            onTap: () => setState(() => isBuy = false),
            child: Container(
              height: 46,
              decoration: BoxDecoration(
                color: !isBuy ? const Color(0xFFFFC400) : Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              alignment: Alignment.center,
              child: Text(
                'Sell',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLabeledDropdown(
    String label,
    String value,
    List<String> items,
    ValueChanged<String?> onChanged,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 13)),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: DropdownButton<String>(
            value: value,
            isExpanded: true,
            underline: const SizedBox(),
            items: items
                .map((it) => DropdownMenuItem(value: it, child: Text(it)))
                .toList(),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }

  Widget _buildCard(Widget child) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: child,
    );
  }

  Widget _buildDropdownRow({
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: DropdownButton<String>(
        value: value,
        isExpanded: true,
        underline: const SizedBox(),
        items: items
            .map((it) => DropdownMenuItem(value: it, child: Text(it)))
            .toList(),
        onChanged: onChanged,
      ),
    );
  }

  Widget _buildPriceSummary() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Your Price', style: TextStyle(fontSize: 12)),
              SizedBox(height: 4),
              Text('KES 134.00', style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              Text('Highest AD price', style: TextStyle(fontSize: 12)),
              SizedBox(height: 4),
              Text('KES 135.62', style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContinueButton() {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: () => widget.controller.nextStep(),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFFFC400),
          foregroundColor: Colors.black87,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: const Text(
          'Continue',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

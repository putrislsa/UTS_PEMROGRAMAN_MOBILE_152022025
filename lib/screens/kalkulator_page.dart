import 'package:flutter/material.dart';
import '../config/app_colors.dart';
import '../widgets/common_widgets.dart';

/// ===========================
/// 5) KALKULATOR — sederhana
/// ===========================
class KalkulatorPage extends StatefulWidget {
  const KalkulatorPage({super.key});

  @override
  State<KalkulatorPage> createState() => _KalkulatorPageState();
}

class _KalkulatorPageState extends State<KalkulatorPage> {
  String _display = '0';
  String _expression = ''; // Menyimpan ekspresi lengkap
  double? _acc;
  String? _op; // + - × ÷
  bool _resetOnNext = false;

  void _input(String v) {
    setState(() {
      if (_resetOnNext) {
        _display = (v == '.') ? '0.' : v;
        _resetOnNext = false;
        return;
      }
      if (v == '.') {
        if (_display.contains('.')) return;
        _display += '.';
      } else {
        _display = (_display == '0') ? v : _display + v;
      }
    });
  }

  void _operate(String op) {
    setState(() {
      _acc = double.tryParse(_display) ?? 0.0;
      _expression = '$_display $op '; // Simpan ekspresi
      _op = op;
      _resetOnNext = true;
    });
  }

  void _equals() {
    setState(() {
      final b = double.tryParse(_display) ?? 0.0;
      final a = _acc ?? 0.0;
      double res = b;
      switch (_op) {
        case '+':
          res = a + b;
          break;
        case '-':
          res = a - b;
          break;
        case '×':
          res = a * b;
          break;
        case '÷':
          res = b == 0 ? double.nan : a / b;
          break;
      }
      _expression = '$_expression$_display = '; // Tambahkan hasil
      _display = _fmt(res);
      _acc = null;
      _op = null;
      _resetOnNext = true;
    });
  }

  void _percent() {
    setState(() {
      final x = double.tryParse(_display) ?? 0.0;
      _display = _fmt(x / 100);
      _resetOnNext = true;
    });
  }

  void _clear() {
    setState(() {
      _display = '0';
      _expression = '';
      _acc = null;
      _op = null;
      _resetOnNext = false;
    });
  }

  void _clearDisplay() {
    setState(() {
      _display = '0';
      _expression = '';
    });
  }

  void _backspace() {
    setState(() {
      if (_resetOnNext) {
        _display = '0';
        _resetOnNext = false;
      } else {
        _display = _display.length <= 1
            ? '0'
            : _display.substring(0, _display.length - 1);
      }
    });
  }

  String _fmt(double v) {
    if (v.isNaN || v.isInfinite) return v.toString();
    final s = v.toStringAsFixed(12);
    return RegExp(r'\.?0+$').hasMatch(s)
        ? s.replaceAll(RegExp(r'\.?0+$'), '')
        : s;
  }

  Widget _numBtn(String label) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => _input(label),
        borderRadius: BorderRadius.circular(12),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.border, width: 1),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 4,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Center(
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _opBtn(String label, {required VoidCallback onTap}) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [const Color(0xFFFFA500), const Color(0xFFFF8C00)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFFFA500).withOpacity(0.3),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Center(
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _funcBtn(
    String label, {
    required VoidCallback onTap,
    bool isSmall = true,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFE8E8E8),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.border, width: 1),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 4,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontSize: isSmall ? 14 : 16,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const SectionHeader(
            title: 'Kalkulator',
            subtitle:
                'Kalkulator profesional dengan desain modern dan intuitif.',
          ),
          const SizedBox(height: 20),
          // Display - No Box/Border
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Expression
              if (_expression.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    _expression,
                    style: t.bodyMedium!.copyWith(
                      color: AppColors.textSecondary,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
              // Display Result
              Text(
                _display,
                key: const ValueKey('display'),
                style: t.headlineLarge!.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w800,
                  fontSize: 56,
                ),
                textAlign: TextAlign.right,
              ),
            ],
          ),
          const SizedBox(height: 32),
          // Calculator Buttons
          Column(
            children: [
              // Row 1: Function buttons
              Row(
                children: [
                  Expanded(
                    child: _funcBtn('AC', onTap: _clear, isSmall: false),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _funcBtn('C', onTap: _clearDisplay, isSmall: false),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _funcBtn('%', onTap: _percent, isSmall: false),
                  ),
                  const SizedBox(width: 10),
                  Expanded(child: _opBtn('÷', onTap: () => _operate('÷'))),
                ],
              ),
              const SizedBox(height: 10),
              // Rows 2-4: Number and operation buttons
              GridView.count(
                crossAxisCount: 4,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _numBtn('7'),
                  _numBtn('8'),
                  _numBtn('9'),
                  _opBtn('×', onTap: () => _operate('×')),
                  _numBtn('4'),
                  _numBtn('5'),
                  _numBtn('6'),
                  _opBtn('-', onTap: () => _operate('-')),
                  _numBtn('1'),
                  _numBtn('2'),
                  _numBtn('3'),
                  _opBtn('+', onTap: () => _operate('+')),
                  _numBtn('0'),
                  _numBtn('.'),
                  _funcBtn('⌫', onTap: _backspace, isSmall: true),
                  _opBtn('=', onTap: _equals),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

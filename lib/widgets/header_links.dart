import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HeaderLinks extends StatelessWidget {
  const HeaderLinks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextButton(
            onPressed: () => context.go('/'),
            child: const Text('Home', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600)),
          ),
          const SizedBox(width: 12),
          TextButton(
            onPressed: () => context.push('/collections'),
            child: const Text('Collections', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600)),
          ),
          const SizedBox(width: 12),
          TextButton(
            onPressed: () => context.push('/The Print Shack'),
            child: const Text('The Print Shack', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600)),
          ),
          TextButton(
            onPressed: () => context.push('/sale'),
            child: const Text('Sale', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600)),
          ),
          const SizedBox(width: 12),
          TextButton(
            onPressed: () => context.push('/about'),
            child: const Text('About', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600)),
          ),
        ],
      ),
    );
  }
}

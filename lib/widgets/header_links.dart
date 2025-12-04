import 'package:flutter/material.dart';

class HeaderLinks extends StatelessWidget {
  const HeaderLinks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
              onPressed: () => Navigator.pushNamed(context, '/'),
              child: const Text('Home', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600)),
            ),
            const SizedBox(width: 12),
            TextButton(
              onPressed: () => Navigator.pushNamed(context, '/collections'),
              child: const Text('Collections', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600)),
            ),
            const SizedBox(width: 12),
            TextButton(
              onPressed: () => Navigator.pushNamed(context, '/The Print Shack'),
              child: const Text('The Print Shack', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600)),
            ),
            TextButton(
              onPressed: () => Navigator.pushNamed(context, '/sale'),
              child: const Text('Sale', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600)),
            ),
            const SizedBox(width: 12),
            TextButton(
              onPressed: () => Navigator.pushNamed(context, '/about'),
              child: const Text('About', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600)),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ResponsiveView extends StatelessWidget {
  const ResponsiveView({
    super.key,
    this.pc1024,
    this.tablet768,
    this.smallTablet600,
    this.mobileLandscape480,
    required this.mobile,
  });

  final Widget? pc1024;            
  final Widget? tablet768;         
  final Widget? smallTablet600;    
  final Widget? mobileLandscape480; 
  final Widget   mobile;          

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width >= 1024 && pc1024 != null) return pc1024!;
    if (width >= 768 && tablet768 != null) return tablet768!;
    if (width >= 600 && smallTablet600 != null) return smallTablet600!;
    if (width >= 480 && mobileLandscape480 != null) return mobileLandscape480!;

    return mobile;
  }
}

import 'dart:async';
import 'package:flutter_hooks/flutter_hooks.dart';

typedef ThrottleCallback = void Function();

ThrottleCallback useThrottle({
  required Duration duration,
  required void Function() onThrottle,
}) {
  final isThrottling = useRef(false);

  void run() {
    // 지금 쓰로틀링이 진행 중이면 무시  
    if (isThrottling.value) return;

    // 콜백 바로 실행  
    onThrottle();

    // 쓰로틀링 시작  
    isThrottling.value = true;

    Timer(duration, () {
      isThrottling.value = false;
    });
  }

  return run;
}

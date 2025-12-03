import 'dart:async';
import 'package:flutter_hooks/flutter_hooks.dart';

typedef DebounceCallback = void Function();

DebounceCallback useDebounce({
  required Duration duration,
  required void Function() onDebounce,
}) {
  final timer = useRef<Timer?>(null);

  void run() {
    timer.value?.cancel();

    timer.value = Timer(duration, onDebounce);
  }

  useEffect(() {
    return () {
      timer.value?.cancel();
    };
  }, []);

  return run;
}

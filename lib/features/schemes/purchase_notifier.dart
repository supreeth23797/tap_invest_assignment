import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tapinvest/core/data/repository.dart';

class PurchaseNotifier extends StateNotifier<AsyncValue<int?>> {
  final Repository repo;

  PurchaseNotifier(this.repo) : super(const AsyncValue.data(null));

  Future<int?> makePurchase(double amount) async {
    state = const AsyncValue.loading();
    final value = await AsyncValue.guard(() => repo.makePurchase(amount));
    if (mounted) {
      state = value;
    }
    return value.value;
  }
}

final purchaseNotifierProvider =
    StateNotifierProvider.autoDispose<PurchaseNotifier, AsyncValue<int?>>(
  (ref) => PurchaseNotifier(ref.watch(repoProvider)),
);

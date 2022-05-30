enum OrderType { onSite, takeAway }

enum BreadType { simple, omelette }

class OrderBuilderImpl implements OrderBuilder {
  late final OrderType _orderType;
  late final BreadType _breadType;

  @override
  OrderBuilder breadType(BreadType breadType) {
    _breadType = breadType;
    return this;
  }

  @override
  OrderBuilder orderType(OrderType orderType) {
    _orderType = orderType;
    return this;
  }

  @override
  Order build() {
    return Order(_orderType, _breadType);
  }
}

abstract class OrderBuilder {
  OrderBuilder orderType(OrderType orderType);
  OrderBuilder breadType(BreadType breadType);
  Order build();
}

class Order {
  final OrderType? _orderType;
  final BreadType? _breadType;

  Order(this._orderType, this._breadType);

  @override
  String toString() {
    return 'Order [order= $_orderType, bread= $_breadType]';
  }
}

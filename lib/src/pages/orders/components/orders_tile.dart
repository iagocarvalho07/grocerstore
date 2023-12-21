import 'package:flutter/material.dart';
import 'package:grocerstore/src/models/order_model.dart';
import 'package:grocerstore/src/pages/orders/components/order_state.dart';
import 'package:grocerstore/src/services/utils_services.dart';

class OrderTile extends StatelessWidget {
  final OrderModel orders;
  final UtilsServices utilsServices = UtilsServices();

  OrderTile({super.key, required this.orders});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          title: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Pedido: ${orders.id}"),
              Text(
                utilsServices.DateFormatTime(orders.createdDateTime),
                style: const TextStyle(fontSize: 12, color: Colors.black),
              ),
            ],
          ),
          childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            IntrinsicHeight(
              child: Row(
                children: [
                  // lista de produtos
                  Expanded(
                      flex: 3,
                      child: _orderItenWidgts(
                          orders: orders, utilsServices: utilsServices)),

                  // divider
                  VerticalDivider(
                    color: Colors.grey.shade300,
                    thickness: 2,
                  ),
                  // status do pedido
                  Expanded(
                    flex: 2,
                    child: OrderStateFullWidgts(status: orders.status,
                      isouverDue: orders.overdueDateTime.isBefore(
                          DateTime.now()),),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _orderItenWidgts extends StatelessWidget {
  const _orderItenWidgts({
    super.key,
    required this.orders,
    required this.utilsServices,
  });

  final OrderModel orders;
  final UtilsServices utilsServices;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: orders.items.map((orderItem) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "${orderItem.quantity}${orderItem.itemModel.unit} ",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(orderItem.itemModel.itemName),
            Expanded(
              child: Text(
                utilsServices.priceToCurrency(orderItem.totalPrice()),
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}

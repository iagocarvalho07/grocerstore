import 'package:flutter/material.dart';
import 'package:grocerstore/src/config/custom_color.dart';
import 'package:grocerstore/src/models/order_model.dart';
import 'package:grocerstore/src/pages/orders/components/order_state.dart';
import 'package:grocerstore/src/services/utils_services.dart';

import '../../components/payment_dialog_widgts.dart';

class OrderTile extends StatelessWidget {
  final OrderModel order;

  OrderTile({
    Key? key,
    required this.order,
  }) : super(key: key);

  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          initiallyExpanded: order.status == 'pending_payment',
          title: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Pedido: ${order.id}'),
              Text(
                utilsServices.formatDateTime(order.createdDateTime),
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            IntrinsicHeight(
              child: Row(
                children: [
                  // Lista de produtos
                  Expanded(
                    flex: 3,
                    child: SizedBox(
                      height: 150,
                      child: ListView(
                        children: order.items.map((orderItem) {
                          return _orderItenWidgts(
                            utilsServices: utilsServices,
                            orders: order,
                          );
                        }).toList(),
                      ),
                    ),
                  ),

                  // Divisão
                  VerticalDivider(
                    color: Colors.grey.shade300,
                    thickness: 2,
                    width: 8,
                  ),

                  // Status do pedido
                  Expanded(
                    flex: 2,
                    child: OrderStateFullWidgts(
                      status: order.status,
                      isouverDue: order.overdueDateTime.isBefore(DateTime.now()),
                    ),
                  ),
                ],
              ),
            ),

            // Total
            Text.rich(
              TextSpan(
                style: const TextStyle(
                  fontSize: 20,
                ),
                children: [
                  const TextSpan(
                    text: 'Total ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: utilsServices.priceToCurrency(order.total),
                  ),
                ],
              ),
            ),

            // Botão pagamento
            Visibility(
              visible: order.status == 'pending_payment',
              child: ElevatedButton.icon(

                style: ElevatedButton.styleFrom(
                  backgroundColor: CustomColor.customSwatColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) {
                      return PaymentDialog(
                        order: order,
                      );
                    },
                  );
                },
                icon: const Icon(Icons.pix, color: Colors.white,),
                label: const Text('Ver QR Code Pix', style: TextStyle(color: Colors.white),),
              ),
            ),
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

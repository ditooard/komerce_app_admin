class OrderModel {
  final String status;
  final int code;
  final OrderData data;

  OrderModel({
    required this.status,
    required this.code,
    required this.data,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      status: json['status'],
      code: json['code'],
      data: OrderData.fromJson(json['data']),
    );
  }
}

class OrderData {
  final int orderId;
  final int partnerAddressId;
  final String paymentMethod;
  final int partnerId;
  final String orderStatus;
  final int serviceFee;
  final int customLabelId;
  final String orderDate;
  final String orderNo;
  final String shipping;
  final String shippingType;
  final String tariffCode;
  final int isKomship;
  final int isMassOrder;
  final String airwayBill;
  final String userFullname;
  final String customerName;
  final String customerPhone;
  final int serviceFeeTo;
  final int isRetur;
  final int isProblem;
  final int shippingCost;
  final String shipmentImagePath;
  final int discount;
  final int grandtotal;
  final int oldGrandtotal;
  final int isEdited;
  final int shippingCashback;
  final int additionalCost;
  final int netProfit;
  final String orderNotes;
  final int subtotal;
  final String customerAddress;
  final dynamic userIdEdited;
  final dynamic userNameEdited;
  final dynamic orderEditedDate;
  final int trackingSalesId;
  final int cashbackTo;
  final int totalWeight;
  final int percentageCostRetur;
  final int shippingRetur;
  final String notes;
  final int isCnoteScan;
  final Ticket ticket;
  final dynamic customLabel;
  final List<AddressPartner> addressPartner;
  final List<SenderBrand> senderBrand;
  final List<Product> product;

  OrderData({
    required this.orderId,
    required this.partnerAddressId,
    required this.paymentMethod,
    required this.partnerId,
    required this.orderStatus,
    required this.serviceFee,
    required this.customLabelId,
    required this.orderDate,
    required this.orderNo,
    required this.shipping,
    required this.shippingType,
    required this.tariffCode,
    required this.isKomship,
    required this.isMassOrder,
    required this.airwayBill,
    required this.userFullname,
    required this.customerName,
    required this.customerPhone,
    required this.serviceFeeTo,
    required this.isRetur,
    required this.isProblem,
    required this.shippingCost,
    required this.shipmentImagePath,
    required this.discount,
    required this.grandtotal,
    required this.oldGrandtotal,
    required this.isEdited,
    required this.shippingCashback,
    required this.additionalCost,
    required this.netProfit,
    required this.orderNotes,
    required this.subtotal,
    required this.customerAddress,
    required this.userIdEdited,
    required this.userNameEdited,
    required this.orderEditedDate,
    required this.trackingSalesId,
    required this.cashbackTo,
    required this.totalWeight,
    required this.percentageCostRetur,
    required this.shippingRetur,
    required this.notes,
    required this.isCnoteScan,
    required this.ticket,
    required this.customLabel,
    required this.addressPartner,
    required this.senderBrand,
    required this.product,
  });

  factory OrderData.fromJson(Map<String, dynamic> json) {
    return OrderData(
      orderId: json['order_id'],
      partnerAddressId: json['partner_address_id'],
      paymentMethod: json['payment_method'],
      partnerId: json['partner_id'],
      orderStatus: json['order_status'],
      serviceFee: json['service_fee'],
      customLabelId: json['custom_label_id'],
      orderDate: json['order_date'],
      orderNo: json['order_no'],
      shipping: json['shipping'],
      shippingType: json['shipping_type'],
      tariffCode: json['tariff_code'],
      isKomship: json['is_komship'],
      isMassOrder: json['is_mass_order'],
      airwayBill: json['airway_bill'],
      userFullname: json['user_fullname'],
      customerName: json['customer_name'],
      customerPhone: json['customer_phone'],
      serviceFeeTo: json['service_fee_to'],
      isRetur: json['is_retur'],
      isProblem: json['is_problem'],
      shippingCost: json['shipping_cost'],
      shipmentImagePath: json['shipment_image_path'],
      discount: json['discount'],
      grandtotal: json['grandtotal'],
      oldGrandtotal: json['old_grandtotal'],
      isEdited: json['is_edited'],
      shippingCashback: json['shipping_cashback'],
      additionalCost: json['additional_cost'],
      netProfit: json['net_profit'],
      orderNotes: json['order_notes'],
      subtotal: json['subtotal'],
      customerAddress: json['customer_address'],
      userIdEdited: json['user_id_edited'],
      userNameEdited: json['user_name_edited'],
      orderEditedDate: json['order_edited_date'],
      trackingSalesId: json['tracking_sales_id'],
      cashbackTo: json['cashback_to'],
      totalWeight: json['total_weight'],
      percentageCostRetur: json['percentage_cost_retur'],
      shippingRetur: json['shipping_retur'],
      notes: json['notes'],
      isCnoteScan: json['is_cnote_scan'],
      ticket: Ticket.fromJson(json['ticket']),
      customLabel: json['custom_label'],
      addressPartner: (json['address_partner'] as List)
          .map((address) => AddressPartner.fromJson(address))
          .toList(),
      senderBrand: (json['sender_brand'] as List)
          .map((sender) => SenderBrand.fromJson(sender))
          .toList(),
      product: (json['product'] as List)
          .map((product) => Product.fromJson(product))
          .toList(),
    );
  }
}

class Ticket {
  final int id;
  final int orderId;
  final String ticketNo;
  final String noResi;
  final String ticketTypeName;
  final int ticketTypeId;
  final dynamic description;
  final int status;

  Ticket({
    required this.id,
    required this.orderId,
    required this.ticketNo,
    required this.noResi,
    required this.ticketTypeName,
    required this.ticketTypeId,
    required this.description,
    required this.status,
  });

  factory Ticket.fromJson(Map<String, dynamic> json) {
    return Ticket(
      id: json['id'],
      orderId: json['order_id'],
      ticketNo: json['ticket_no'],
      noResi: json['no_resi'],
      ticketTypeName: json['ticket_type_name'],
      ticketTypeId: json['ticket_type_id'],
      description: json['description'],
      status: json['status'],
    );
  }
}

class AddressPartner {
  final int id;
  final int partnerId;
  final String name;
  final String detailAddress;
  final int destinationId;
  final String originCode;
  final String zipCode;
  final String picName;
  final String picPhone;
  final int isDefault;
  final int isDelete;
  final String createdAt;
  final String updatedAt;

  AddressPartner({
    required this.id,
    required this.partnerId,
    required this.name,
    required this.detailAddress,
    required this.destinationId,
    required this.originCode,
    required this.zipCode,
    required this.picName,
    required this.picPhone,
    required this.isDefault,
    required this.isDelete,
    required this.createdAt,
    required this.updatedAt,
  });

  factory AddressPartner.fromJson(Map<String, dynamic> json) {
    return AddressPartner(
      id: json['id'],
      partnerId: json['partner_id'],
      name: json['name'],
      detailAddress: json['detail_address'],
      destinationId: json['destination_id'],
      originCode: json['origin_code'],
      zipCode: json['zip_code'],
      picName: json['pic_name'],
      picPhone: json['pic_phone'],
      isDefault: json['is_default'],
      isDelete: json['is_delete'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}

class SenderBrand {
  final int partnerId;
  final String nameLabel;
  final String noHp;

  SenderBrand({
    required this.partnerId,
    required this.nameLabel,
    required this.noHp,
  });

  factory SenderBrand.fromJson(Map<String, dynamic> json) {
    return SenderBrand(
      partnerId: json['partner_id'],
      nameLabel: json['name_label'],
      noHp: json['no_hp'],
    );
  }
}

class Product {
  final int detailId;
  final String productSku;
  final int detailOrderId;
  final int productId;
  final String productName;
  final int productVariantId;
  final String variantName;
  final int price;
  final int weight;
  final int qty;
  final String productImage;

  Product({
    required this.detailId,
    required this.productSku,
    required this.detailOrderId,
    required this.productId,
    required this.productName,
    required this.productVariantId,
    required this.variantName,
    required this.price,
    required this.weight,
    required this.qty,
    required this.productImage,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      detailId: json['detail_id'],
      productSku: json['product_sku'],
      detailOrderId: json['detail_order_id'],
      productId: json['product_id'],
      productName: json['product_name'],
      productVariantId: json['product_variant_id'],
      variantName: json['variant_name'],
      price: json['price'],
      weight: json['weight'],
      qty: json['qty'],
      productImage: json['product_image'],
    );
  }
}

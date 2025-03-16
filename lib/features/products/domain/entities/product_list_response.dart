import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'product_list_response.freezed.dart';
part 'product_list_response.g.dart';

ProductListResponse productListResponseFromJson(String str) => ProductListResponse.fromJson(json.decode(str));

String productListResponseToJson(ProductListResponse data) => json.encode(data.toJson());

@freezed
class ProductListResponse with _$ProductListResponse {
  const factory ProductListResponse({
    @JsonKey(name: "products")
    List<Product>? products,
    @JsonKey(name: "total")
    int? total,
    @JsonKey(name: "skip")
    int? skip,
    @JsonKey(name: "limit")
    int? limit,
  }) = _ProductListResponse;

  factory ProductListResponse.fromJson(Map<String, dynamic> json) => _$ProductListResponseFromJson(json);
}

@freezed
class Product with _$Product {
  const factory Product({
    @JsonKey(name: "id")
    int? id,
    @JsonKey(name: "title")
    String? title,
    @JsonKey(name: "description")
    String? description,
    @JsonKey(name: "category")
    Category? category,
    @JsonKey(name: "price")
    double? price,
    @JsonKey(name: "discountPercentage")
    double? discountPercentage,
    @JsonKey(name: "rating")
    double? rating,
    @JsonKey(name: "stock")
    int? stock,
    @JsonKey(name: "tags")
    List<String>? tags,
    @JsonKey(name: "brand")
    String? brand,
    @JsonKey(name: "sku")
    String? sku,
    @JsonKey(name: "weight")
    int? weight,
    @JsonKey(name: "dimensions")
    Dimensions? dimensions,
    @JsonKey(name: "warrantyInformation")
    String? warrantyInformation,
    @JsonKey(name: "shippingInformation")
    String? shippingInformation,
    @JsonKey(name: "availabilityStatus")
    AvailabilityStatus? availabilityStatus,
    @JsonKey(name: "reviews")
    List<Review>? reviews,
    @JsonKey(name: "returnPolicy")
    ReturnPolicy? returnPolicy,
    @JsonKey(name: "minimumOrderQuantity")
    int? minimumOrderQuantity,
    @JsonKey(name: "meta")
    Meta? meta,
    @JsonKey(name: "images")
    List<String>? images,
    @JsonKey(name: "thumbnail")
    String? thumbnail,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
}

enum AvailabilityStatus {
  @JsonValue("In Stock")
  IN_STOCK,
  @JsonValue("Low Stock")
  LOW_STOCK
}

final availabilityStatusValues = EnumValues({
  "In Stock": AvailabilityStatus.IN_STOCK,
  "Low Stock": AvailabilityStatus.LOW_STOCK
});

enum Category {
  @JsonValue("beauty")
  BEAUTY,
  @JsonValue("fragrances")
  FRAGRANCES,
  @JsonValue("furniture")
  FURNITURE,
  @JsonValue("groceries")
  GROCERIES
}

final categoryValues = EnumValues({
  "beauty": Category.BEAUTY,
  "fragrances": Category.FRAGRANCES,
  "furniture": Category.FURNITURE,
  "groceries": Category.GROCERIES
});

@freezed
class Dimensions with _$Dimensions {
  const factory Dimensions({
    @JsonKey(name: "width")
    double? width,
    @JsonKey(name: "height")
    double? height,
    @JsonKey(name: "depth")
    double? depth,
  }) = _Dimensions;

  factory Dimensions.fromJson(Map<String, dynamic> json) => _$DimensionsFromJson(json);
}

@freezed
class Meta with _$Meta {
  const factory Meta({
    @JsonKey(name: "createdAt")
    DateTime? createdAt,
    @JsonKey(name: "updatedAt")
    DateTime? updatedAt,
    @JsonKey(name: "barcode")
    String? barcode,
    @JsonKey(name: "qrCode")
    String? qrCode,
  }) = _Meta;

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
}

enum ReturnPolicy {
  @JsonValue("No return policy")
  NO_RETURN_POLICY,
  @JsonValue("30 days return policy")
  THE_30_DAYS_RETURN_POLICY,
  @JsonValue("60 days return policy")
  THE_60_DAYS_RETURN_POLICY,
  @JsonValue("7 days return policy")
  THE_7_DAYS_RETURN_POLICY,
  @JsonValue("90 days return policy")
  THE_90_DAYS_RETURN_POLICY
}

final returnPolicyValues = EnumValues({
  "No return policy": ReturnPolicy.NO_RETURN_POLICY,
  "30 days return policy": ReturnPolicy.THE_30_DAYS_RETURN_POLICY,
  "60 days return policy": ReturnPolicy.THE_60_DAYS_RETURN_POLICY,
  "7 days return policy": ReturnPolicy.THE_7_DAYS_RETURN_POLICY,
  "90 days return policy": ReturnPolicy.THE_90_DAYS_RETURN_POLICY
});

@freezed
class Review with _$Review {
  const factory Review({
    @JsonKey(name: "rating")
    int? rating,
    @JsonKey(name: "comment")
    String? comment,
    @JsonKey(name: "date")
    DateTime? date,
    @JsonKey(name: "reviewerName")
    String? reviewerName,
    @JsonKey(name: "reviewerEmail")
    String? reviewerEmail,
  }) = _Review;

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

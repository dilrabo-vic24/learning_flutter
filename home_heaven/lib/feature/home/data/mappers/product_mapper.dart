import 'package:home_heaven/feature/home/data/models/product_model.dart';
import 'package:home_heaven/feature/home/domain/entities/product_entity.dart';

class ProductMapper {
  static ProductEntity fromModel(ProductModel? model) {
    return ProductEntity(
        data: model?.data?.map((e) => fromProductDataModel(e)).toList(),
        pagination: fromProductPaginationModel(model?.productPagination));
  }

  static ProductDataEntity fromProductDataModel(ProductData model) {
    return ProductDataEntity(
      id: model.id,
      name: model.name,
      description: model.description,
      shortDescription: model.shortDescription,
      icon: model.icon,
      image: model.image,
      quintity: model.quintity,
      price: model.price,
      discount: model.discount,
      rating: model.rating,
      ratingCount: model.ratingCount,
      colors: model.colors != null ? fromColorsModel(model.colors!) : null,
      size: model.size != null ? fromSizeModel(model.size!) : null,
      category: model.category,
    );
  }

  static ProductPaginationEntity fromProductPaginationModel(
      ProductPagination? model) {
    return ProductPaginationEntity(
      totalRecords: model?.totalRecords,
      currentPage: model?.currentPage,
      totalPages: model?.totalPages,
      nextPage: model?.nextPage,
      prevPage: model?.prevPage,
    );
  }

  static ColorsEntity fromColorsModel(Colors model) {
    return ColorsEntity(
      name: model.name,
      colorHexFlutter: model.colorHexFlutter,
    );
  }

  static SizeEntity fromSizeModel(Size model) {
    return SizeEntity(
      width: model.width,
      depth: model.depth,
      heigth: model.heigth,
      seatWidth: model.seatWidth,
      seatDepth: model.seatDepth,
      seatHeigth: model.seatHeigth,
    );
  }

  static ProductModel toModel(ProductEntity entity) {
    return ProductModel(
      data: entity.data?.map((e) => toProductDataModel(e)).toList(),
      productPagination: entity.pagination != null
          ? toProductPaginationModel(entity.pagination!)
          : null,
    );
  }

  static ProductData toProductDataModel(ProductDataEntity entity) {
    return ProductData(
      id: entity.id,
      name: entity.name,
      description: entity.description,
      shortDescription: entity.shortDescription,
      icon: entity.icon,
      image: entity.image,
      quintity: entity.quintity,
      price: entity.price,
      discount: entity.discount,
      rating: entity.rating,
      ratingCount: entity.ratingCount,
      colors: entity.colors != null ? toColorsModel(entity.colors!) : null,
      size: entity.size != null ? toSizeModel(entity.size!) : null,
      category: entity.category,
    );
  }

  static ProductPagination toProductPaginationModel(
      ProductPaginationEntity entity) {
    return ProductPagination(
      totalRecords: entity.totalRecords,
      currentPage: entity.currentPage,
      totalPages: entity.totalPages,
      nextPage: entity.nextPage,
      prevPage: entity.prevPage,
    );
  }

  static Colors toColorsModel(ColorsEntity entity) {
    return Colors(
      name: entity.name,
      colorHexFlutter: entity.colorHexFlutter,
    );
  }

  static Size toSizeModel(SizeEntity entity) {
    return Size(
      width: entity.width,
      depth: entity.depth,
      heigth: entity.heigth,
      seatWidth: entity.seatWidth,
      seatDepth: entity.seatDepth,
      seatHeigth: entity.seatHeigth,
    );
  }
}

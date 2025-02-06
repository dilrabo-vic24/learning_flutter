import 'package:home_heaven/feature/home/data/models/banner_model.dart';
import 'package:home_heaven/feature/home/domain/entities/banner_entity.dart';

class BannerMapper {
  static BannerEntity fromModel(BannerModel? model) {
    return BannerEntity(
        data: model?.data?.map((e) => fromBannerDataModel(e)).toList(),
        pagination: fromBannerPaginationModel(model?.bannerPagination));
  }

  static BannerDataEntity fromBannerDataModel(BannerData model) {
    return BannerDataEntity(
      id: model.id,
      title: model.title,
      category: model.category,
      shortDescription: model.shortDescription,
      image: model.image,
      date: model.date,
    );
  }

  static BannerPaginationEntity fromBannerPaginationModel(
      BannerPaginationModel? model) {
    return BannerPaginationEntity(
      totalRecords: model?.totalRecords,
      currentPage: model?.currentPage,
      totalPages: model?.totalPages,
      nextPage: model?.nextPage,
      prevPage: model?.prevPage,
    );
  }

  // Optional: Mapping in the other direction (from entity to model)

  static BannerModel toModel(BannerEntity entity) {
    return BannerModel(
      data: entity.data?.map((e) => toBannerDataModel(e)).toList(),
      bannerPagination: entity.pagination != null
          ? toBannerPaginationModel(entity.pagination!)
          : null,
    );
  }

  static BannerData toBannerDataModel(BannerDataEntity entity) {
    return BannerData(
      id: entity.id,
      title: entity.title,
      category: entity.category,
      shortDescription: entity.shortDescription,
      image: entity.image,
      date: entity.date,
    );
  }

  static BannerPaginationModel toBannerPaginationModel(
      BannerPaginationEntity entity) {
    return BannerPaginationModel(
      totalRecords: entity.totalRecords,
      currentPage: entity.currentPage,
      totalPages: entity.totalPages,
      nextPage: entity.nextPage,
      prevPage: entity.prevPage,
    );
  }
}

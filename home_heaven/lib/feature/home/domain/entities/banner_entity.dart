class BannerEntity {
  final List<BannerDataEntity>? data;
  final BannerPaginationEntity? pagination;

  BannerEntity({
    this.data,
    this.pagination,
  });
}

class BannerDataEntity {
  final String? id;
  final String? title;
  final String? category;
  final String? shortDescription;
  final String? image;
  final String? date;

  BannerDataEntity({
    this.id,
    this.title,
    this.category,
    this.shortDescription,
    this.image,
    this.date,
  });
}

class BannerPaginationEntity {
  final int? totalRecords;
  final int? currentPage;
  final int? totalPages;
  final dynamic nextPage;
  final dynamic prevPage;

  BannerPaginationEntity({
    this.totalRecords,
    this.currentPage,
    this.totalPages,
    this.nextPage,
    this.prevPage,
  });
}

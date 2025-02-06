class ProductEntity {
    final List<ProductDataEntity>? data;
    final ProductPaginationEntity? pagination;

    ProductEntity({
        this.data,
        this.pagination,
    });

}

class ProductDataEntity {
    final String? id;
    final String? name;
    final String? description;
    final String? shortDescription;
    final String? icon;
    final List<String>? image;
    final int? quintity;
    final double? price;
    final int? discount;
    final double? rating;
    final int? ratingCount;
    final ColorsEntity? colors;
    final SizeEntity? size;
    final String? category;

    ProductDataEntity({
        this.id,
        this.name,
        this.description,
        this.shortDescription,
        this.icon,
        this.image,
        this.quintity,
        this.price,
        this.discount,
        this.rating,
        this.ratingCount,
        this.colors,
        this.size,
        this.category,
    });

}

class ColorsEntity {
    final String? name;
    final String? colorHexFlutter;

    ColorsEntity({
        this.name,
        this.colorHexFlutter,
    });

}

class SizeEntity {
    final int? width;
    final int? depth;
    final int? heigth;
    final int? seatWidth;
    final int? seatDepth;
    final int? seatHeigth;

    SizeEntity({
        this.width,
        this.depth,
        this.heigth,
        this.seatWidth,
        this.seatDepth,
        this.seatHeigth,
    });

}

class ProductPaginationEntity {
    final int? totalRecords;
    final int? currentPage;
    final int? totalPages;
    final dynamic nextPage;
    final dynamic prevPage;

    ProductPaginationEntity({
        this.totalRecords,
        this.currentPage,
        this.totalPages,
        this.nextPage,
        this.prevPage,
    });

}

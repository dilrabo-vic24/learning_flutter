part of 'image_upload_bloc.dart';

@freezed
class ImageUploadState with _$ImageUploadState {
  const factory ImageUploadState({
    @Default(Statuses.Initial) Statuses status,
    GetPredictDto? imageData,
    String? imagePath,
    Bool? hasPredict,
    String? errorMessage,
    @Default([]) List<Map<String, dynamic>>? messages, // Messages ro'yxatini qo'shish
  }) = _GetUploadState;
}
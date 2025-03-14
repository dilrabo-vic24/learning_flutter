part of 'image_upload_bloc.dart';


@freezed
class ImageUploadEvent with _$ImageUploadEvent {
  const factory ImageUploadEvent.getImagePath({required File imagefile}) =
      _GetUploadEvent;
  const factory ImageUploadEvent.getPredict({required String imagePath}) =
      _GetPredict;
}

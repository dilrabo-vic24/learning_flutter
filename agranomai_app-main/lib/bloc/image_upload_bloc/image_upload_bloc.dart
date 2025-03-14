// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ffi';
import 'dart:io';

import 'package:agranom_ai/common/utils/enums/statuses.dart';
import 'package:agranom_ai/data/models/get_predict_dto.dart';
import 'package:agranom_ai/data/repositories/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_upload_bloc.freezed.dart';
part 'image_upload_event.dart';
part 'image_upload_state.dart';

class ImageUploadBloc extends Bloc<ImageUploadEvent, ImageUploadState> {
  final HomeRepo imageRepository;

  ImageUploadBloc(this.imageRepository) : super(const ImageUploadState()) {
    on<_GetUploadEvent>(_onGetImagePath);
    on<_GetPredict>(_onGetPredict);
  }

  Future<void> _onGetImagePath(
      _GetUploadEvent event, Emitter<ImageUploadState> emit) async {
    emit(state.copyWith(status: Statuses.Loading, imagePath: null, messages: [
      ...state.messages!,
      {'type': 'image', 'content': event.imagefile, 'isUser': true}
    ]));

    try {
      final imagePath =
          await imageRepository.getImageUrl(imageFile: event.imagefile);
      emit(state.copyWith(status: Statuses.Success, imagePath: imagePath));
    } catch (e) {
      emit(state.copyWith(status: Statuses.Error, errorMessage: e.toString()));
    }
  }

  Future<void> _onGetPredict(
      _GetPredict event, Emitter<ImageUploadState> emit) async {
    emit(state.copyWith(status: Statuses.Loading, imagePath: null));

    try {
      final prediction =
          await imageRepository.getPredict(imagePath: event.imagePath);
      emit(state
          .copyWith(status: Statuses.Success, imageData: prediction, messages: [
        ...state.messages!,
        {'type': 'response', 'content': prediction?.data, 'isUser': false}
      ]));
    } catch (e) {
      emit(state.copyWith(status: Statuses.Error, errorMessage: e.toString()));
    }
  }
}

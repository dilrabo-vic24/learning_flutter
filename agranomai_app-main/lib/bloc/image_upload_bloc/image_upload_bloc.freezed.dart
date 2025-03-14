// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_upload_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ImageUploadEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(File imagefile) getImagePath,
    required TResult Function(String imagePath) getPredict,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(File imagefile)? getImagePath,
    TResult? Function(String imagePath)? getPredict,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(File imagefile)? getImagePath,
    TResult Function(String imagePath)? getPredict,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUploadEvent value) getImagePath,
    required TResult Function(_GetPredict value) getPredict,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetUploadEvent value)? getImagePath,
    TResult? Function(_GetPredict value)? getPredict,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUploadEvent value)? getImagePath,
    TResult Function(_GetPredict value)? getPredict,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageUploadEventCopyWith<$Res> {
  factory $ImageUploadEventCopyWith(
          ImageUploadEvent value, $Res Function(ImageUploadEvent) then) =
      _$ImageUploadEventCopyWithImpl<$Res, ImageUploadEvent>;
}

/// @nodoc
class _$ImageUploadEventCopyWithImpl<$Res, $Val extends ImageUploadEvent>
    implements $ImageUploadEventCopyWith<$Res> {
  _$ImageUploadEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ImageUploadEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetUploadEventImplCopyWith<$Res> {
  factory _$$GetUploadEventImplCopyWith(_$GetUploadEventImpl value,
          $Res Function(_$GetUploadEventImpl) then) =
      __$$GetUploadEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({File imagefile});
}

/// @nodoc
class __$$GetUploadEventImplCopyWithImpl<$Res>
    extends _$ImageUploadEventCopyWithImpl<$Res, _$GetUploadEventImpl>
    implements _$$GetUploadEventImplCopyWith<$Res> {
  __$$GetUploadEventImplCopyWithImpl(
      _$GetUploadEventImpl _value, $Res Function(_$GetUploadEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of ImageUploadEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imagefile = null,
  }) {
    return _then(_$GetUploadEventImpl(
      imagefile: null == imagefile
          ? _value.imagefile
          : imagefile // ignore: cast_nullable_to_non_nullable
              as File,
    ));
  }
}

/// @nodoc

class _$GetUploadEventImpl implements _GetUploadEvent {
  const _$GetUploadEventImpl({required this.imagefile});

  @override
  final File imagefile;

  @override
  String toString() {
    return 'ImageUploadEvent.getImagePath(imagefile: $imagefile)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetUploadEventImpl &&
            (identical(other.imagefile, imagefile) ||
                other.imagefile == imagefile));
  }

  @override
  int get hashCode => Object.hash(runtimeType, imagefile);

  /// Create a copy of ImageUploadEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetUploadEventImplCopyWith<_$GetUploadEventImpl> get copyWith =>
      __$$GetUploadEventImplCopyWithImpl<_$GetUploadEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(File imagefile) getImagePath,
    required TResult Function(String imagePath) getPredict,
  }) {
    return getImagePath(imagefile);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(File imagefile)? getImagePath,
    TResult? Function(String imagePath)? getPredict,
  }) {
    return getImagePath?.call(imagefile);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(File imagefile)? getImagePath,
    TResult Function(String imagePath)? getPredict,
    required TResult orElse(),
  }) {
    if (getImagePath != null) {
      return getImagePath(imagefile);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUploadEvent value) getImagePath,
    required TResult Function(_GetPredict value) getPredict,
  }) {
    return getImagePath(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetUploadEvent value)? getImagePath,
    TResult? Function(_GetPredict value)? getPredict,
  }) {
    return getImagePath?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUploadEvent value)? getImagePath,
    TResult Function(_GetPredict value)? getPredict,
    required TResult orElse(),
  }) {
    if (getImagePath != null) {
      return getImagePath(this);
    }
    return orElse();
  }
}

abstract class _GetUploadEvent implements ImageUploadEvent {
  const factory _GetUploadEvent({required final File imagefile}) =
      _$GetUploadEventImpl;

  File get imagefile;

  /// Create a copy of ImageUploadEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetUploadEventImplCopyWith<_$GetUploadEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetPredictImplCopyWith<$Res> {
  factory _$$GetPredictImplCopyWith(
          _$GetPredictImpl value, $Res Function(_$GetPredictImpl) then) =
      __$$GetPredictImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String imagePath});
}

/// @nodoc
class __$$GetPredictImplCopyWithImpl<$Res>
    extends _$ImageUploadEventCopyWithImpl<$Res, _$GetPredictImpl>
    implements _$$GetPredictImplCopyWith<$Res> {
  __$$GetPredictImplCopyWithImpl(
      _$GetPredictImpl _value, $Res Function(_$GetPredictImpl) _then)
      : super(_value, _then);

  /// Create a copy of ImageUploadEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imagePath = null,
  }) {
    return _then(_$GetPredictImpl(
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetPredictImpl implements _GetPredict {
  const _$GetPredictImpl({required this.imagePath});

  @override
  final String imagePath;

  @override
  String toString() {
    return 'ImageUploadEvent.getPredict(imagePath: $imagePath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetPredictImpl &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath));
  }

  @override
  int get hashCode => Object.hash(runtimeType, imagePath);

  /// Create a copy of ImageUploadEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetPredictImplCopyWith<_$GetPredictImpl> get copyWith =>
      __$$GetPredictImplCopyWithImpl<_$GetPredictImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(File imagefile) getImagePath,
    required TResult Function(String imagePath) getPredict,
  }) {
    return getPredict(imagePath);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(File imagefile)? getImagePath,
    TResult? Function(String imagePath)? getPredict,
  }) {
    return getPredict?.call(imagePath);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(File imagefile)? getImagePath,
    TResult Function(String imagePath)? getPredict,
    required TResult orElse(),
  }) {
    if (getPredict != null) {
      return getPredict(imagePath);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUploadEvent value) getImagePath,
    required TResult Function(_GetPredict value) getPredict,
  }) {
    return getPredict(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetUploadEvent value)? getImagePath,
    TResult? Function(_GetPredict value)? getPredict,
  }) {
    return getPredict?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUploadEvent value)? getImagePath,
    TResult Function(_GetPredict value)? getPredict,
    required TResult orElse(),
  }) {
    if (getPredict != null) {
      return getPredict(this);
    }
    return orElse();
  }
}

abstract class _GetPredict implements ImageUploadEvent {
  const factory _GetPredict({required final String imagePath}) =
      _$GetPredictImpl;

  String get imagePath;

  /// Create a copy of ImageUploadEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetPredictImplCopyWith<_$GetPredictImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ImageUploadState {
  Statuses get status => throw _privateConstructorUsedError;
  GetPredictDto? get imageData => throw _privateConstructorUsedError;
  String? get imagePath => throw _privateConstructorUsedError;
  Bool? get hasPredict => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  List<Map<String, dynamic>>? get messages =>
      throw _privateConstructorUsedError;

  /// Create a copy of ImageUploadState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ImageUploadStateCopyWith<ImageUploadState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageUploadStateCopyWith<$Res> {
  factory $ImageUploadStateCopyWith(
          ImageUploadState value, $Res Function(ImageUploadState) then) =
      _$ImageUploadStateCopyWithImpl<$Res, ImageUploadState>;
  @useResult
  $Res call(
      {Statuses status,
      GetPredictDto? imageData,
      String? imagePath,
      Bool? hasPredict,
      String? errorMessage,
      List<Map<String, dynamic>>? messages});

  $GetPredictDtoCopyWith<$Res>? get imageData;
}

/// @nodoc
class _$ImageUploadStateCopyWithImpl<$Res, $Val extends ImageUploadState>
    implements $ImageUploadStateCopyWith<$Res> {
  _$ImageUploadStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ImageUploadState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? imageData = freezed,
    Object? imagePath = freezed,
    Object? hasPredict = freezed,
    Object? errorMessage = freezed,
    Object? messages = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Statuses,
      imageData: freezed == imageData
          ? _value.imageData
          : imageData // ignore: cast_nullable_to_non_nullable
              as GetPredictDto?,
      imagePath: freezed == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      hasPredict: freezed == hasPredict
          ? _value.hasPredict
          : hasPredict // ignore: cast_nullable_to_non_nullable
              as Bool?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      messages: freezed == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>?,
    ) as $Val);
  }

  /// Create a copy of ImageUploadState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GetPredictDtoCopyWith<$Res>? get imageData {
    if (_value.imageData == null) {
      return null;
    }

    return $GetPredictDtoCopyWith<$Res>(_value.imageData!, (value) {
      return _then(_value.copyWith(imageData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GetUploadStateImplCopyWith<$Res>
    implements $ImageUploadStateCopyWith<$Res> {
  factory _$$GetUploadStateImplCopyWith(_$GetUploadStateImpl value,
          $Res Function(_$GetUploadStateImpl) then) =
      __$$GetUploadStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Statuses status,
      GetPredictDto? imageData,
      String? imagePath,
      Bool? hasPredict,
      String? errorMessage,
      List<Map<String, dynamic>>? messages});

  @override
  $GetPredictDtoCopyWith<$Res>? get imageData;
}

/// @nodoc
class __$$GetUploadStateImplCopyWithImpl<$Res>
    extends _$ImageUploadStateCopyWithImpl<$Res, _$GetUploadStateImpl>
    implements _$$GetUploadStateImplCopyWith<$Res> {
  __$$GetUploadStateImplCopyWithImpl(
      _$GetUploadStateImpl _value, $Res Function(_$GetUploadStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ImageUploadState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? imageData = freezed,
    Object? imagePath = freezed,
    Object? hasPredict = freezed,
    Object? errorMessage = freezed,
    Object? messages = freezed,
  }) {
    return _then(_$GetUploadStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Statuses,
      imageData: freezed == imageData
          ? _value.imageData
          : imageData // ignore: cast_nullable_to_non_nullable
              as GetPredictDto?,
      imagePath: freezed == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      hasPredict: freezed == hasPredict
          ? _value.hasPredict
          : hasPredict // ignore: cast_nullable_to_non_nullable
              as Bool?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      messages: freezed == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>?,
    ));
  }
}

/// @nodoc

class _$GetUploadStateImpl implements _GetUploadState {
  const _$GetUploadStateImpl(
      {this.status = Statuses.Initial,
      this.imageData,
      this.imagePath,
      this.hasPredict,
      this.errorMessage,
      final List<Map<String, dynamic>>? messages = const []})
      : _messages = messages;

  @override
  @JsonKey()
  final Statuses status;
  @override
  final GetPredictDto? imageData;
  @override
  final String? imagePath;
  @override
  final Bool? hasPredict;
  @override
  final String? errorMessage;
  final List<Map<String, dynamic>>? _messages;
  @override
  @JsonKey()
  List<Map<String, dynamic>>? get messages {
    final value = _messages;
    if (value == null) return null;
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ImageUploadState(status: $status, imageData: $imageData, imagePath: $imagePath, hasPredict: $hasPredict, errorMessage: $errorMessage, messages: $messages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetUploadStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.imageData, imageData) ||
                other.imageData == imageData) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.hasPredict, hasPredict) ||
                other.hasPredict == hasPredict) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality().equals(other._messages, _messages));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, imageData, imagePath,
      hasPredict, errorMessage, const DeepCollectionEquality().hash(_messages));

  /// Create a copy of ImageUploadState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetUploadStateImplCopyWith<_$GetUploadStateImpl> get copyWith =>
      __$$GetUploadStateImplCopyWithImpl<_$GetUploadStateImpl>(
          this, _$identity);
}

abstract class _GetUploadState implements ImageUploadState {
  const factory _GetUploadState(
      {final Statuses status,
      final GetPredictDto? imageData,
      final String? imagePath,
      final Bool? hasPredict,
      final String? errorMessage,
      final List<Map<String, dynamic>>? messages}) = _$GetUploadStateImpl;

  @override
  Statuses get status;
  @override
  GetPredictDto? get imageData;
  @override
  String? get imagePath;
  @override
  Bool? get hasPredict;
  @override
  String? get errorMessage;
  @override
  List<Map<String, dynamic>>? get messages;

  /// Create a copy of ImageUploadState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetUploadStateImplCopyWith<_$GetUploadStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

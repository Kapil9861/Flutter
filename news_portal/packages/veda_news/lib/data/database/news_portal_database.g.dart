// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_portal_database.dart';

// ignore_for_file: type=lint
class $FavouritesTable extends Favourites
    with TableInfo<$FavouritesTable, Favourite> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FavouritesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _sourceIdMeta =
      const VerificationMeta('sourceId');
  @override
  late final GeneratedColumn<String> sourceId = GeneratedColumn<String>(
      'source_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _sourceNameMeta =
      const VerificationMeta('sourceName');
  @override
  late final GeneratedColumn<String> sourceName = GeneratedColumn<String>(
      'source_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _authorMeta = const VerificationMeta('author');
  @override
  late final GeneratedColumn<String> author = GeneratedColumn<String>(
      'author', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
      'url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _urlToImageMeta =
      const VerificationMeta('urlToImage');
  @override
  late final GeneratedColumn<String> urlToImage = GeneratedColumn<String>(
      'url_to_image', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _publishedAtMeta =
      const VerificationMeta('publishedAt');
  @override
  late final GeneratedColumn<String> publishedAt = GeneratedColumn<String>(
      'published_at', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _contentMeta =
      const VerificationMeta('content');
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'content', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        sourceId,
        sourceName,
        author,
        title,
        description,
        url,
        urlToImage,
        publishedAt,
        content
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'favourites';
  @override
  VerificationContext validateIntegrity(Insertable<Favourite> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('source_id')) {
      context.handle(_sourceIdMeta,
          sourceId.isAcceptableOrUnknown(data['source_id']!, _sourceIdMeta));
    }
    if (data.containsKey('source_name')) {
      context.handle(
          _sourceNameMeta,
          sourceName.isAcceptableOrUnknown(
              data['source_name']!, _sourceNameMeta));
    }
    if (data.containsKey('author')) {
      context.handle(_authorMeta,
          author.isAcceptableOrUnknown(data['author']!, _authorMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('url')) {
      context.handle(
          _urlMeta, url.isAcceptableOrUnknown(data['url']!, _urlMeta));
    }
    if (data.containsKey('url_to_image')) {
      context.handle(
          _urlToImageMeta,
          urlToImage.isAcceptableOrUnknown(
              data['url_to_image']!, _urlToImageMeta));
    }
    if (data.containsKey('published_at')) {
      context.handle(
          _publishedAtMeta,
          publishedAt.isAcceptableOrUnknown(
              data['published_at']!, _publishedAtMeta));
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Favourite map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Favourite(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      sourceId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}source_id']),
      sourceName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}source_name']),
      author: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}author']),
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title']),
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      url: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}url']),
      urlToImage: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}url_to_image']),
      publishedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}published_at']),
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content']),
    );
  }

  @override
  $FavouritesTable createAlias(String alias) {
    return $FavouritesTable(attachedDatabase, alias);
  }
}

class Favourite extends DataClass implements Insertable<Favourite> {
  final int id;
  final String? sourceId;
  final String? sourceName;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;
  const Favourite(
      {required this.id,
      this.sourceId,
      this.sourceName,
      this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || sourceId != null) {
      map['source_id'] = Variable<String>(sourceId);
    }
    if (!nullToAbsent || sourceName != null) {
      map['source_name'] = Variable<String>(sourceName);
    }
    if (!nullToAbsent || author != null) {
      map['author'] = Variable<String>(author);
    }
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || url != null) {
      map['url'] = Variable<String>(url);
    }
    if (!nullToAbsent || urlToImage != null) {
      map['url_to_image'] = Variable<String>(urlToImage);
    }
    if (!nullToAbsent || publishedAt != null) {
      map['published_at'] = Variable<String>(publishedAt);
    }
    if (!nullToAbsent || content != null) {
      map['content'] = Variable<String>(content);
    }
    return map;
  }

  FavouritesCompanion toCompanion(bool nullToAbsent) {
    return FavouritesCompanion(
      id: Value(id),
      sourceId: sourceId == null && nullToAbsent
          ? const Value.absent()
          : Value(sourceId),
      sourceName: sourceName == null && nullToAbsent
          ? const Value.absent()
          : Value(sourceName),
      author:
          author == null && nullToAbsent ? const Value.absent() : Value(author),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      url: url == null && nullToAbsent ? const Value.absent() : Value(url),
      urlToImage: urlToImage == null && nullToAbsent
          ? const Value.absent()
          : Value(urlToImage),
      publishedAt: publishedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(publishedAt),
      content: content == null && nullToAbsent
          ? const Value.absent()
          : Value(content),
    );
  }

  factory Favourite.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Favourite(
      id: serializer.fromJson<int>(json['id']),
      sourceId: serializer.fromJson<String?>(json['sourceId']),
      sourceName: serializer.fromJson<String?>(json['sourceName']),
      author: serializer.fromJson<String?>(json['author']),
      title: serializer.fromJson<String?>(json['title']),
      description: serializer.fromJson<String?>(json['description']),
      url: serializer.fromJson<String?>(json['url']),
      urlToImage: serializer.fromJson<String?>(json['urlToImage']),
      publishedAt: serializer.fromJson<String?>(json['publishedAt']),
      content: serializer.fromJson<String?>(json['content']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'sourceId': serializer.toJson<String?>(sourceId),
      'sourceName': serializer.toJson<String?>(sourceName),
      'author': serializer.toJson<String?>(author),
      'title': serializer.toJson<String?>(title),
      'description': serializer.toJson<String?>(description),
      'url': serializer.toJson<String?>(url),
      'urlToImage': serializer.toJson<String?>(urlToImage),
      'publishedAt': serializer.toJson<String?>(publishedAt),
      'content': serializer.toJson<String?>(content),
    };
  }

  Favourite copyWith(
          {int? id,
          Value<String?> sourceId = const Value.absent(),
          Value<String?> sourceName = const Value.absent(),
          Value<String?> author = const Value.absent(),
          Value<String?> title = const Value.absent(),
          Value<String?> description = const Value.absent(),
          Value<String?> url = const Value.absent(),
          Value<String?> urlToImage = const Value.absent(),
          Value<String?> publishedAt = const Value.absent(),
          Value<String?> content = const Value.absent()}) =>
      Favourite(
        id: id ?? this.id,
        sourceId: sourceId.present ? sourceId.value : this.sourceId,
        sourceName: sourceName.present ? sourceName.value : this.sourceName,
        author: author.present ? author.value : this.author,
        title: title.present ? title.value : this.title,
        description: description.present ? description.value : this.description,
        url: url.present ? url.value : this.url,
        urlToImage: urlToImage.present ? urlToImage.value : this.urlToImage,
        publishedAt: publishedAt.present ? publishedAt.value : this.publishedAt,
        content: content.present ? content.value : this.content,
      );
  Favourite copyWithCompanion(FavouritesCompanion data) {
    return Favourite(
      id: data.id.present ? data.id.value : this.id,
      sourceId: data.sourceId.present ? data.sourceId.value : this.sourceId,
      sourceName:
          data.sourceName.present ? data.sourceName.value : this.sourceName,
      author: data.author.present ? data.author.value : this.author,
      title: data.title.present ? data.title.value : this.title,
      description:
          data.description.present ? data.description.value : this.description,
      url: data.url.present ? data.url.value : this.url,
      urlToImage:
          data.urlToImage.present ? data.urlToImage.value : this.urlToImage,
      publishedAt:
          data.publishedAt.present ? data.publishedAt.value : this.publishedAt,
      content: data.content.present ? data.content.value : this.content,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Favourite(')
          ..write('id: $id, ')
          ..write('sourceId: $sourceId, ')
          ..write('sourceName: $sourceName, ')
          ..write('author: $author, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('url: $url, ')
          ..write('urlToImage: $urlToImage, ')
          ..write('publishedAt: $publishedAt, ')
          ..write('content: $content')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, sourceId, sourceName, author, title,
      description, url, urlToImage, publishedAt, content);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Favourite &&
          other.id == this.id &&
          other.sourceId == this.sourceId &&
          other.sourceName == this.sourceName &&
          other.author == this.author &&
          other.title == this.title &&
          other.description == this.description &&
          other.url == this.url &&
          other.urlToImage == this.urlToImage &&
          other.publishedAt == this.publishedAt &&
          other.content == this.content);
}

class FavouritesCompanion extends UpdateCompanion<Favourite> {
  final Value<int> id;
  final Value<String?> sourceId;
  final Value<String?> sourceName;
  final Value<String?> author;
  final Value<String?> title;
  final Value<String?> description;
  final Value<String?> url;
  final Value<String?> urlToImage;
  final Value<String?> publishedAt;
  final Value<String?> content;
  const FavouritesCompanion({
    this.id = const Value.absent(),
    this.sourceId = const Value.absent(),
    this.sourceName = const Value.absent(),
    this.author = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.url = const Value.absent(),
    this.urlToImage = const Value.absent(),
    this.publishedAt = const Value.absent(),
    this.content = const Value.absent(),
  });
  FavouritesCompanion.insert({
    this.id = const Value.absent(),
    this.sourceId = const Value.absent(),
    this.sourceName = const Value.absent(),
    this.author = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.url = const Value.absent(),
    this.urlToImage = const Value.absent(),
    this.publishedAt = const Value.absent(),
    this.content = const Value.absent(),
  });
  static Insertable<Favourite> custom({
    Expression<int>? id,
    Expression<String>? sourceId,
    Expression<String>? sourceName,
    Expression<String>? author,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? url,
    Expression<String>? urlToImage,
    Expression<String>? publishedAt,
    Expression<String>? content,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sourceId != null) 'source_id': sourceId,
      if (sourceName != null) 'source_name': sourceName,
      if (author != null) 'author': author,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (url != null) 'url': url,
      if (urlToImage != null) 'url_to_image': urlToImage,
      if (publishedAt != null) 'published_at': publishedAt,
      if (content != null) 'content': content,
    });
  }

  FavouritesCompanion copyWith(
      {Value<int>? id,
      Value<String?>? sourceId,
      Value<String?>? sourceName,
      Value<String?>? author,
      Value<String?>? title,
      Value<String?>? description,
      Value<String?>? url,
      Value<String?>? urlToImage,
      Value<String?>? publishedAt,
      Value<String?>? content}) {
    return FavouritesCompanion(
      id: id ?? this.id,
      sourceId: sourceId ?? this.sourceId,
      sourceName: sourceName ?? this.sourceName,
      author: author ?? this.author,
      title: title ?? this.title,
      description: description ?? this.description,
      url: url ?? this.url,
      urlToImage: urlToImage ?? this.urlToImage,
      publishedAt: publishedAt ?? this.publishedAt,
      content: content ?? this.content,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (sourceId.present) {
      map['source_id'] = Variable<String>(sourceId.value);
    }
    if (sourceName.present) {
      map['source_name'] = Variable<String>(sourceName.value);
    }
    if (author.present) {
      map['author'] = Variable<String>(author.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (urlToImage.present) {
      map['url_to_image'] = Variable<String>(urlToImage.value);
    }
    if (publishedAt.present) {
      map['published_at'] = Variable<String>(publishedAt.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavouritesCompanion(')
          ..write('id: $id, ')
          ..write('sourceId: $sourceId, ')
          ..write('sourceName: $sourceName, ')
          ..write('author: $author, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('url: $url, ')
          ..write('urlToImage: $urlToImage, ')
          ..write('publishedAt: $publishedAt, ')
          ..write('content: $content')
          ..write(')'))
        .toString();
  }
}

class $FollowedSourceTable extends FollowedSource
    with TableInfo<$FollowedSourceTable, FollowedSourceData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FollowedSourceTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _sourceIdMeta =
      const VerificationMeta('sourceId');
  @override
  late final GeneratedColumn<String> sourceId = GeneratedColumn<String>(
      'source_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sourceNameMeta =
      const VerificationMeta('sourceName');
  @override
  late final GeneratedColumn<String> sourceName = GeneratedColumn<String>(
      'source_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, sourceId, sourceName];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'followedSource';
  @override
  VerificationContext validateIntegrity(Insertable<FollowedSourceData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('source_id')) {
      context.handle(_sourceIdMeta,
          sourceId.isAcceptableOrUnknown(data['source_id']!, _sourceIdMeta));
    } else if (isInserting) {
      context.missing(_sourceIdMeta);
    }
    if (data.containsKey('source_name')) {
      context.handle(
          _sourceNameMeta,
          sourceName.isAcceptableOrUnknown(
              data['source_name']!, _sourceNameMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FollowedSourceData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FollowedSourceData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      sourceId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}source_id'])!,
      sourceName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}source_name']),
    );
  }

  @override
  $FollowedSourceTable createAlias(String alias) {
    return $FollowedSourceTable(attachedDatabase, alias);
  }
}

class FollowedSourceData extends DataClass
    implements Insertable<FollowedSourceData> {
  final int id;
  final String sourceId;
  final String? sourceName;
  const FollowedSourceData(
      {required this.id, required this.sourceId, this.sourceName});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['source_id'] = Variable<String>(sourceId);
    if (!nullToAbsent || sourceName != null) {
      map['source_name'] = Variable<String>(sourceName);
    }
    return map;
  }

  FollowedSourceCompanion toCompanion(bool nullToAbsent) {
    return FollowedSourceCompanion(
      id: Value(id),
      sourceId: Value(sourceId),
      sourceName: sourceName == null && nullToAbsent
          ? const Value.absent()
          : Value(sourceName),
    );
  }

  factory FollowedSourceData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FollowedSourceData(
      id: serializer.fromJson<int>(json['id']),
      sourceId: serializer.fromJson<String>(json['sourceId']),
      sourceName: serializer.fromJson<String?>(json['sourceName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'sourceId': serializer.toJson<String>(sourceId),
      'sourceName': serializer.toJson<String?>(sourceName),
    };
  }

  FollowedSourceData copyWith(
          {int? id,
          String? sourceId,
          Value<String?> sourceName = const Value.absent()}) =>
      FollowedSourceData(
        id: id ?? this.id,
        sourceId: sourceId ?? this.sourceId,
        sourceName: sourceName.present ? sourceName.value : this.sourceName,
      );
  FollowedSourceData copyWithCompanion(FollowedSourceCompanion data) {
    return FollowedSourceData(
      id: data.id.present ? data.id.value : this.id,
      sourceId: data.sourceId.present ? data.sourceId.value : this.sourceId,
      sourceName:
          data.sourceName.present ? data.sourceName.value : this.sourceName,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FollowedSourceData(')
          ..write('id: $id, ')
          ..write('sourceId: $sourceId, ')
          ..write('sourceName: $sourceName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, sourceId, sourceName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FollowedSourceData &&
          other.id == this.id &&
          other.sourceId == this.sourceId &&
          other.sourceName == this.sourceName);
}

class FollowedSourceCompanion extends UpdateCompanion<FollowedSourceData> {
  final Value<int> id;
  final Value<String> sourceId;
  final Value<String?> sourceName;
  const FollowedSourceCompanion({
    this.id = const Value.absent(),
    this.sourceId = const Value.absent(),
    this.sourceName = const Value.absent(),
  });
  FollowedSourceCompanion.insert({
    this.id = const Value.absent(),
    required String sourceId,
    this.sourceName = const Value.absent(),
  }) : sourceId = Value(sourceId);
  static Insertable<FollowedSourceData> custom({
    Expression<int>? id,
    Expression<String>? sourceId,
    Expression<String>? sourceName,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sourceId != null) 'source_id': sourceId,
      if (sourceName != null) 'source_name': sourceName,
    });
  }

  FollowedSourceCompanion copyWith(
      {Value<int>? id, Value<String>? sourceId, Value<String?>? sourceName}) {
    return FollowedSourceCompanion(
      id: id ?? this.id,
      sourceId: sourceId ?? this.sourceId,
      sourceName: sourceName ?? this.sourceName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (sourceId.present) {
      map['source_id'] = Variable<String>(sourceId.value);
    }
    if (sourceName.present) {
      map['source_name'] = Variable<String>(sourceName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FollowedSourceCompanion(')
          ..write('id: $id, ')
          ..write('sourceId: $sourceId, ')
          ..write('sourceName: $sourceName')
          ..write(')'))
        .toString();
  }
}

abstract class _$NewsPortalDatabase extends GeneratedDatabase {
  _$NewsPortalDatabase(QueryExecutor e) : super(e);
  $NewsPortalDatabaseManager get managers => $NewsPortalDatabaseManager(this);
  late final $FavouritesTable favourites = $FavouritesTable(this);
  late final $FollowedSourceTable followedSource = $FollowedSourceTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [favourites, followedSource];
}

typedef $$FavouritesTableCreateCompanionBuilder = FavouritesCompanion Function({
  Value<int> id,
  Value<String?> sourceId,
  Value<String?> sourceName,
  Value<String?> author,
  Value<String?> title,
  Value<String?> description,
  Value<String?> url,
  Value<String?> urlToImage,
  Value<String?> publishedAt,
  Value<String?> content,
});
typedef $$FavouritesTableUpdateCompanionBuilder = FavouritesCompanion Function({
  Value<int> id,
  Value<String?> sourceId,
  Value<String?> sourceName,
  Value<String?> author,
  Value<String?> title,
  Value<String?> description,
  Value<String?> url,
  Value<String?> urlToImage,
  Value<String?> publishedAt,
  Value<String?> content,
});

class $$FavouritesTableFilterComposer
    extends FilterComposer<_$NewsPortalDatabase, $FavouritesTable> {
  $$FavouritesTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get sourceId => $state.composableBuilder(
      column: $state.table.sourceId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get sourceName => $state.composableBuilder(
      column: $state.table.sourceName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get author => $state.composableBuilder(
      column: $state.table.author,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get url => $state.composableBuilder(
      column: $state.table.url,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get urlToImage => $state.composableBuilder(
      column: $state.table.urlToImage,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get publishedAt => $state.composableBuilder(
      column: $state.table.publishedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get content => $state.composableBuilder(
      column: $state.table.content,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$FavouritesTableOrderingComposer
    extends OrderingComposer<_$NewsPortalDatabase, $FavouritesTable> {
  $$FavouritesTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get sourceId => $state.composableBuilder(
      column: $state.table.sourceId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get sourceName => $state.composableBuilder(
      column: $state.table.sourceName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get author => $state.composableBuilder(
      column: $state.table.author,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get url => $state.composableBuilder(
      column: $state.table.url,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get urlToImage => $state.composableBuilder(
      column: $state.table.urlToImage,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get publishedAt => $state.composableBuilder(
      column: $state.table.publishedAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get content => $state.composableBuilder(
      column: $state.table.content,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$FavouritesTableTableManager extends RootTableManager<
    _$NewsPortalDatabase,
    $FavouritesTable,
    Favourite,
    $$FavouritesTableFilterComposer,
    $$FavouritesTableOrderingComposer,
    $$FavouritesTableCreateCompanionBuilder,
    $$FavouritesTableUpdateCompanionBuilder,
    (
      Favourite,
      BaseReferences<_$NewsPortalDatabase, $FavouritesTable, Favourite>
    ),
    Favourite,
    PrefetchHooks Function()> {
  $$FavouritesTableTableManager(_$NewsPortalDatabase db, $FavouritesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$FavouritesTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$FavouritesTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> sourceId = const Value.absent(),
            Value<String?> sourceName = const Value.absent(),
            Value<String?> author = const Value.absent(),
            Value<String?> title = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<String?> url = const Value.absent(),
            Value<String?> urlToImage = const Value.absent(),
            Value<String?> publishedAt = const Value.absent(),
            Value<String?> content = const Value.absent(),
          }) =>
              FavouritesCompanion(
            id: id,
            sourceId: sourceId,
            sourceName: sourceName,
            author: author,
            title: title,
            description: description,
            url: url,
            urlToImage: urlToImage,
            publishedAt: publishedAt,
            content: content,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> sourceId = const Value.absent(),
            Value<String?> sourceName = const Value.absent(),
            Value<String?> author = const Value.absent(),
            Value<String?> title = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<String?> url = const Value.absent(),
            Value<String?> urlToImage = const Value.absent(),
            Value<String?> publishedAt = const Value.absent(),
            Value<String?> content = const Value.absent(),
          }) =>
              FavouritesCompanion.insert(
            id: id,
            sourceId: sourceId,
            sourceName: sourceName,
            author: author,
            title: title,
            description: description,
            url: url,
            urlToImage: urlToImage,
            publishedAt: publishedAt,
            content: content,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$FavouritesTableProcessedTableManager = ProcessedTableManager<
    _$NewsPortalDatabase,
    $FavouritesTable,
    Favourite,
    $$FavouritesTableFilterComposer,
    $$FavouritesTableOrderingComposer,
    $$FavouritesTableCreateCompanionBuilder,
    $$FavouritesTableUpdateCompanionBuilder,
    (
      Favourite,
      BaseReferences<_$NewsPortalDatabase, $FavouritesTable, Favourite>
    ),
    Favourite,
    PrefetchHooks Function()>;
typedef $$FollowedSourceTableCreateCompanionBuilder = FollowedSourceCompanion
    Function({
  Value<int> id,
  required String sourceId,
  Value<String?> sourceName,
});
typedef $$FollowedSourceTableUpdateCompanionBuilder = FollowedSourceCompanion
    Function({
  Value<int> id,
  Value<String> sourceId,
  Value<String?> sourceName,
});

class $$FollowedSourceTableFilterComposer
    extends FilterComposer<_$NewsPortalDatabase, $FollowedSourceTable> {
  $$FollowedSourceTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get sourceId => $state.composableBuilder(
      column: $state.table.sourceId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get sourceName => $state.composableBuilder(
      column: $state.table.sourceName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$FollowedSourceTableOrderingComposer
    extends OrderingComposer<_$NewsPortalDatabase, $FollowedSourceTable> {
  $$FollowedSourceTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get sourceId => $state.composableBuilder(
      column: $state.table.sourceId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get sourceName => $state.composableBuilder(
      column: $state.table.sourceName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$FollowedSourceTableTableManager extends RootTableManager<
    _$NewsPortalDatabase,
    $FollowedSourceTable,
    FollowedSourceData,
    $$FollowedSourceTableFilterComposer,
    $$FollowedSourceTableOrderingComposer,
    $$FollowedSourceTableCreateCompanionBuilder,
    $$FollowedSourceTableUpdateCompanionBuilder,
    (
      FollowedSourceData,
      BaseReferences<_$NewsPortalDatabase, $FollowedSourceTable,
          FollowedSourceData>
    ),
    FollowedSourceData,
    PrefetchHooks Function()> {
  $$FollowedSourceTableTableManager(
      _$NewsPortalDatabase db, $FollowedSourceTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$FollowedSourceTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$FollowedSourceTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> sourceId = const Value.absent(),
            Value<String?> sourceName = const Value.absent(),
          }) =>
              FollowedSourceCompanion(
            id: id,
            sourceId: sourceId,
            sourceName: sourceName,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String sourceId,
            Value<String?> sourceName = const Value.absent(),
          }) =>
              FollowedSourceCompanion.insert(
            id: id,
            sourceId: sourceId,
            sourceName: sourceName,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$FollowedSourceTableProcessedTableManager = ProcessedTableManager<
    _$NewsPortalDatabase,
    $FollowedSourceTable,
    FollowedSourceData,
    $$FollowedSourceTableFilterComposer,
    $$FollowedSourceTableOrderingComposer,
    $$FollowedSourceTableCreateCompanionBuilder,
    $$FollowedSourceTableUpdateCompanionBuilder,
    (
      FollowedSourceData,
      BaseReferences<_$NewsPortalDatabase, $FollowedSourceTable,
          FollowedSourceData>
    ),
    FollowedSourceData,
    PrefetchHooks Function()>;

class $NewsPortalDatabaseManager {
  final _$NewsPortalDatabase _db;
  $NewsPortalDatabaseManager(this._db);
  $$FavouritesTableTableManager get favourites =>
      $$FavouritesTableTableManager(_db, _db.favourites);
  $$FollowedSourceTableTableManager get followedSource =>
      $$FollowedSourceTableTableManager(_db, _db.followedSource);
}

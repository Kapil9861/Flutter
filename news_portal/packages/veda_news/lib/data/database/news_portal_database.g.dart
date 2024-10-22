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

class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _userNameMeta =
      const VerificationMeta('userName');
  @override
  late final GeneratedColumn<String> userName = GeneratedColumn<String>(
      'user_name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 3, maxTextLength: 30),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _fullNameMeta =
      const VerificationMeta('fullName');
  @override
  late final GeneratedColumn<String> fullName = GeneratedColumn<String>(
      'full_name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 3, maxTextLength: 30),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _passwordMeta =
      const VerificationMeta('password');
  @override
  late final GeneratedColumn<String> password = GeneratedColumn<String>(
      'password', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 6, maxTextLength: 20),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _phoneNumberMeta =
      const VerificationMeta('phoneNumber');
  @override
  late final GeneratedColumn<String> phoneNumber = GeneratedColumn<String>(
      'phone_number', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 10, maxTextLength: 15),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 11, maxTextLength: 32),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _resetPasswordExpirationMeta =
      const VerificationMeta('resetPasswordExpiration');
  @override
  late final GeneratedColumn<String> resetPasswordExpiration =
      GeneratedColumn<String>('reset_password_expiration', aliasedName, true,
          additionalChecks: GeneratedColumn.checkTextLength(
              minTextLength: 3, maxTextLength: 30),
          type: DriftSqlType.string,
          requiredDuringInsert: false);
  static const VerificationMeta _rememberTokenMeta =
      const VerificationMeta('rememberToken');
  @override
  late final GeneratedColumn<String> rememberToken = GeneratedColumn<String>(
      'remember_token', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 3, maxTextLength: 30),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _sessionIdMeta =
      const VerificationMeta('sessionId');
  @override
  late final GeneratedColumn<String> sessionId = GeneratedColumn<String>(
      'session_id', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 3, maxTextLength: 30),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _isDeletedMeta =
      const VerificationMeta('isDeleted');
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
      'is_deleted', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_deleted" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        userName,
        fullName,
        password,
        phoneNumber,
        email,
        resetPasswordExpiration,
        rememberToken,
        sessionId,
        isDeleted
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(Insertable<User> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_name')) {
      context.handle(_userNameMeta,
          userName.isAcceptableOrUnknown(data['user_name']!, _userNameMeta));
    } else if (isInserting) {
      context.missing(_userNameMeta);
    }
    if (data.containsKey('full_name')) {
      context.handle(_fullNameMeta,
          fullName.isAcceptableOrUnknown(data['full_name']!, _fullNameMeta));
    } else if (isInserting) {
      context.missing(_fullNameMeta);
    }
    if (data.containsKey('password')) {
      context.handle(_passwordMeta,
          password.isAcceptableOrUnknown(data['password']!, _passwordMeta));
    } else if (isInserting) {
      context.missing(_passwordMeta);
    }
    if (data.containsKey('phone_number')) {
      context.handle(
          _phoneNumberMeta,
          phoneNumber.isAcceptableOrUnknown(
              data['phone_number']!, _phoneNumberMeta));
    } else if (isInserting) {
      context.missing(_phoneNumberMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    }
    if (data.containsKey('reset_password_expiration')) {
      context.handle(
          _resetPasswordExpirationMeta,
          resetPasswordExpiration.isAcceptableOrUnknown(
              data['reset_password_expiration']!,
              _resetPasswordExpirationMeta));
    }
    if (data.containsKey('remember_token')) {
      context.handle(
          _rememberTokenMeta,
          rememberToken.isAcceptableOrUnknown(
              data['remember_token']!, _rememberTokenMeta));
    }
    if (data.containsKey('session_id')) {
      context.handle(_sessionIdMeta,
          sessionId.isAcceptableOrUnknown(data['session_id']!, _sessionIdMeta));
    }
    if (data.containsKey('is_deleted')) {
      context.handle(_isDeletedMeta,
          isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return User(
      userName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_name'])!,
      fullName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}full_name'])!,
      password: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}password'])!,
      phoneNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone_number'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email']),
      resetPasswordExpiration: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}reset_password_expiration']),
      rememberToken: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}remember_token']),
      sessionId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}session_id']),
      isDeleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_deleted'])!,
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class User extends DataClass implements Insertable<User> {
  final String userName;
  final String fullName;
  final String password;
  final String phoneNumber;
  final String? email;
  final String? resetPasswordExpiration;
  final String? rememberToken;
  final String? sessionId;
  final bool isDeleted;
  const User(
      {required this.userName,
      required this.fullName,
      required this.password,
      required this.phoneNumber,
      this.email,
      this.resetPasswordExpiration,
      this.rememberToken,
      this.sessionId,
      required this.isDeleted});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_name'] = Variable<String>(userName);
    map['full_name'] = Variable<String>(fullName);
    map['password'] = Variable<String>(password);
    map['phone_number'] = Variable<String>(phoneNumber);
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || resetPasswordExpiration != null) {
      map['reset_password_expiration'] =
          Variable<String>(resetPasswordExpiration);
    }
    if (!nullToAbsent || rememberToken != null) {
      map['remember_token'] = Variable<String>(rememberToken);
    }
    if (!nullToAbsent || sessionId != null) {
      map['session_id'] = Variable<String>(sessionId);
    }
    map['is_deleted'] = Variable<bool>(isDeleted);
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      userName: Value(userName),
      fullName: Value(fullName),
      password: Value(password),
      phoneNumber: Value(phoneNumber),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      resetPasswordExpiration: resetPasswordExpiration == null && nullToAbsent
          ? const Value.absent()
          : Value(resetPasswordExpiration),
      rememberToken: rememberToken == null && nullToAbsent
          ? const Value.absent()
          : Value(rememberToken),
      sessionId: sessionId == null && nullToAbsent
          ? const Value.absent()
          : Value(sessionId),
      isDeleted: Value(isDeleted),
    );
  }

  factory User.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return User(
      userName: serializer.fromJson<String>(json['userName']),
      fullName: serializer.fromJson<String>(json['fullName']),
      password: serializer.fromJson<String>(json['password']),
      phoneNumber: serializer.fromJson<String>(json['phoneNumber']),
      email: serializer.fromJson<String?>(json['email']),
      resetPasswordExpiration:
          serializer.fromJson<String?>(json['resetPasswordExpiration']),
      rememberToken: serializer.fromJson<String?>(json['rememberToken']),
      sessionId: serializer.fromJson<String?>(json['sessionId']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'userName': serializer.toJson<String>(userName),
      'fullName': serializer.toJson<String>(fullName),
      'password': serializer.toJson<String>(password),
      'phoneNumber': serializer.toJson<String>(phoneNumber),
      'email': serializer.toJson<String?>(email),
      'resetPasswordExpiration':
          serializer.toJson<String?>(resetPasswordExpiration),
      'rememberToken': serializer.toJson<String?>(rememberToken),
      'sessionId': serializer.toJson<String?>(sessionId),
      'isDeleted': serializer.toJson<bool>(isDeleted),
    };
  }

  User copyWith(
          {String? userName,
          String? fullName,
          String? password,
          String? phoneNumber,
          Value<String?> email = const Value.absent(),
          Value<String?> resetPasswordExpiration = const Value.absent(),
          Value<String?> rememberToken = const Value.absent(),
          Value<String?> sessionId = const Value.absent(),
          bool? isDeleted}) =>
      User(
        userName: userName ?? this.userName,
        fullName: fullName ?? this.fullName,
        password: password ?? this.password,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        email: email.present ? email.value : this.email,
        resetPasswordExpiration: resetPasswordExpiration.present
            ? resetPasswordExpiration.value
            : this.resetPasswordExpiration,
        rememberToken:
            rememberToken.present ? rememberToken.value : this.rememberToken,
        sessionId: sessionId.present ? sessionId.value : this.sessionId,
        isDeleted: isDeleted ?? this.isDeleted,
      );
  User copyWithCompanion(UsersCompanion data) {
    return User(
      userName: data.userName.present ? data.userName.value : this.userName,
      fullName: data.fullName.present ? data.fullName.value : this.fullName,
      password: data.password.present ? data.password.value : this.password,
      phoneNumber:
          data.phoneNumber.present ? data.phoneNumber.value : this.phoneNumber,
      email: data.email.present ? data.email.value : this.email,
      resetPasswordExpiration: data.resetPasswordExpiration.present
          ? data.resetPasswordExpiration.value
          : this.resetPasswordExpiration,
      rememberToken: data.rememberToken.present
          ? data.rememberToken.value
          : this.rememberToken,
      sessionId: data.sessionId.present ? data.sessionId.value : this.sessionId,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
    );
  }

  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('userName: $userName, ')
          ..write('fullName: $fullName, ')
          ..write('password: $password, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('email: $email, ')
          ..write('resetPasswordExpiration: $resetPasswordExpiration, ')
          ..write('rememberToken: $rememberToken, ')
          ..write('sessionId: $sessionId, ')
          ..write('isDeleted: $isDeleted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(userName, fullName, password, phoneNumber,
      email, resetPasswordExpiration, rememberToken, sessionId, isDeleted);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.userName == this.userName &&
          other.fullName == this.fullName &&
          other.password == this.password &&
          other.phoneNumber == this.phoneNumber &&
          other.email == this.email &&
          other.resetPasswordExpiration == this.resetPasswordExpiration &&
          other.rememberToken == this.rememberToken &&
          other.sessionId == this.sessionId &&
          other.isDeleted == this.isDeleted);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<String> userName;
  final Value<String> fullName;
  final Value<String> password;
  final Value<String> phoneNumber;
  final Value<String?> email;
  final Value<String?> resetPasswordExpiration;
  final Value<String?> rememberToken;
  final Value<String?> sessionId;
  final Value<bool> isDeleted;
  final Value<int> rowid;
  const UsersCompanion({
    this.userName = const Value.absent(),
    this.fullName = const Value.absent(),
    this.password = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    this.email = const Value.absent(),
    this.resetPasswordExpiration = const Value.absent(),
    this.rememberToken = const Value.absent(),
    this.sessionId = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UsersCompanion.insert({
    required String userName,
    required String fullName,
    required String password,
    required String phoneNumber,
    this.email = const Value.absent(),
    this.resetPasswordExpiration = const Value.absent(),
    this.rememberToken = const Value.absent(),
    this.sessionId = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : userName = Value(userName),
        fullName = Value(fullName),
        password = Value(password),
        phoneNumber = Value(phoneNumber);
  static Insertable<User> custom({
    Expression<String>? userName,
    Expression<String>? fullName,
    Expression<String>? password,
    Expression<String>? phoneNumber,
    Expression<String>? email,
    Expression<String>? resetPasswordExpiration,
    Expression<String>? rememberToken,
    Expression<String>? sessionId,
    Expression<bool>? isDeleted,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (userName != null) 'user_name': userName,
      if (fullName != null) 'full_name': fullName,
      if (password != null) 'password': password,
      if (phoneNumber != null) 'phone_number': phoneNumber,
      if (email != null) 'email': email,
      if (resetPasswordExpiration != null)
        'reset_password_expiration': resetPasswordExpiration,
      if (rememberToken != null) 'remember_token': rememberToken,
      if (sessionId != null) 'session_id': sessionId,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UsersCompanion copyWith(
      {Value<String>? userName,
      Value<String>? fullName,
      Value<String>? password,
      Value<String>? phoneNumber,
      Value<String?>? email,
      Value<String?>? resetPasswordExpiration,
      Value<String?>? rememberToken,
      Value<String?>? sessionId,
      Value<bool>? isDeleted,
      Value<int>? rowid}) {
    return UsersCompanion(
      userName: userName ?? this.userName,
      fullName: fullName ?? this.fullName,
      password: password ?? this.password,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      resetPasswordExpiration:
          resetPasswordExpiration ?? this.resetPasswordExpiration,
      rememberToken: rememberToken ?? this.rememberToken,
      sessionId: sessionId ?? this.sessionId,
      isDeleted: isDeleted ?? this.isDeleted,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userName.present) {
      map['user_name'] = Variable<String>(userName.value);
    }
    if (fullName.present) {
      map['full_name'] = Variable<String>(fullName.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    if (phoneNumber.present) {
      map['phone_number'] = Variable<String>(phoneNumber.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (resetPasswordExpiration.present) {
      map['reset_password_expiration'] =
          Variable<String>(resetPasswordExpiration.value);
    }
    if (rememberToken.present) {
      map['remember_token'] = Variable<String>(rememberToken.value);
    }
    if (sessionId.present) {
      map['session_id'] = Variable<String>(sessionId.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('userName: $userName, ')
          ..write('fullName: $fullName, ')
          ..write('password: $password, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('email: $email, ')
          ..write('resetPasswordExpiration: $resetPasswordExpiration, ')
          ..write('rememberToken: $rememberToken, ')
          ..write('sessionId: $sessionId, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $FilesStorageTable extends FilesStorage
    with TableInfo<$FilesStorageTable, FilesStorageData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FilesStorageTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _mediaMeta = const VerificationMeta('media');
  @override
  late final GeneratedColumn<Uint8List> media = GeneratedColumn<Uint8List>(
      'media', aliasedName, false,
      type: DriftSqlType.blob, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, media];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'files';
  @override
  VerificationContext validateIntegrity(Insertable<FilesStorageData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('media')) {
      context.handle(
          _mediaMeta, media.isAcceptableOrUnknown(data['media']!, _mediaMeta));
    } else if (isInserting) {
      context.missing(_mediaMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FilesStorageData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FilesStorageData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      media: attachedDatabase.typeMapping
          .read(DriftSqlType.blob, data['${effectivePrefix}media'])!,
    );
  }

  @override
  $FilesStorageTable createAlias(String alias) {
    return $FilesStorageTable(attachedDatabase, alias);
  }
}

class FilesStorageData extends DataClass
    implements Insertable<FilesStorageData> {
  final int id;
  final Uint8List media;
  const FilesStorageData({required this.id, required this.media});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['media'] = Variable<Uint8List>(media);
    return map;
  }

  FilesStorageCompanion toCompanion(bool nullToAbsent) {
    return FilesStorageCompanion(
      id: Value(id),
      media: Value(media),
    );
  }

  factory FilesStorageData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FilesStorageData(
      id: serializer.fromJson<int>(json['id']),
      media: serializer.fromJson<Uint8List>(json['media']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'media': serializer.toJson<Uint8List>(media),
    };
  }

  FilesStorageData copyWith({int? id, Uint8List? media}) => FilesStorageData(
        id: id ?? this.id,
        media: media ?? this.media,
      );
  FilesStorageData copyWithCompanion(FilesStorageCompanion data) {
    return FilesStorageData(
      id: data.id.present ? data.id.value : this.id,
      media: data.media.present ? data.media.value : this.media,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FilesStorageData(')
          ..write('id: $id, ')
          ..write('media: $media')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, $driftBlobEquality.hash(media));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FilesStorageData &&
          other.id == this.id &&
          $driftBlobEquality.equals(other.media, this.media));
}

class FilesStorageCompanion extends UpdateCompanion<FilesStorageData> {
  final Value<int> id;
  final Value<Uint8List> media;
  const FilesStorageCompanion({
    this.id = const Value.absent(),
    this.media = const Value.absent(),
  });
  FilesStorageCompanion.insert({
    this.id = const Value.absent(),
    required Uint8List media,
  }) : media = Value(media);
  static Insertable<FilesStorageData> custom({
    Expression<int>? id,
    Expression<Uint8List>? media,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (media != null) 'media': media,
    });
  }

  FilesStorageCompanion copyWith({Value<int>? id, Value<Uint8List>? media}) {
    return FilesStorageCompanion(
      id: id ?? this.id,
      media: media ?? this.media,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (media.present) {
      map['media'] = Variable<Uint8List>(media.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FilesStorageCompanion(')
          ..write('id: $id, ')
          ..write('media: $media')
          ..write(')'))
        .toString();
  }
}

abstract class _$NewsPortalDatabase extends GeneratedDatabase {
  _$NewsPortalDatabase(QueryExecutor e) : super(e);
  $NewsPortalDatabaseManager get managers => $NewsPortalDatabaseManager(this);
  late final $FavouritesTable favourites = $FavouritesTable(this);
  late final $FollowedSourceTable followedSource = $FollowedSourceTable(this);
  late final $UsersTable users = $UsersTable(this);
  late final $FilesStorageTable filesStorage = $FilesStorageTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [favourites, followedSource, users, filesStorage];
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
    extends Composer<_$NewsPortalDatabase, $FavouritesTable> {
  $$FavouritesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sourceId => $composableBuilder(
      column: $table.sourceId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sourceName => $composableBuilder(
      column: $table.sourceName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get author => $composableBuilder(
      column: $table.author, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get url => $composableBuilder(
      column: $table.url, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get urlToImage => $composableBuilder(
      column: $table.urlToImage, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get publishedAt => $composableBuilder(
      column: $table.publishedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get content => $composableBuilder(
      column: $table.content, builder: (column) => ColumnFilters(column));
}

class $$FavouritesTableOrderingComposer
    extends Composer<_$NewsPortalDatabase, $FavouritesTable> {
  $$FavouritesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sourceId => $composableBuilder(
      column: $table.sourceId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sourceName => $composableBuilder(
      column: $table.sourceName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get author => $composableBuilder(
      column: $table.author, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get url => $composableBuilder(
      column: $table.url, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get urlToImage => $composableBuilder(
      column: $table.urlToImage, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get publishedAt => $composableBuilder(
      column: $table.publishedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get content => $composableBuilder(
      column: $table.content, builder: (column) => ColumnOrderings(column));
}

class $$FavouritesTableAnnotationComposer
    extends Composer<_$NewsPortalDatabase, $FavouritesTable> {
  $$FavouritesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get sourceId =>
      $composableBuilder(column: $table.sourceId, builder: (column) => column);

  GeneratedColumn<String> get sourceName => $composableBuilder(
      column: $table.sourceName, builder: (column) => column);

  GeneratedColumn<String> get author =>
      $composableBuilder(column: $table.author, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get url =>
      $composableBuilder(column: $table.url, builder: (column) => column);

  GeneratedColumn<String> get urlToImage => $composableBuilder(
      column: $table.urlToImage, builder: (column) => column);

  GeneratedColumn<String> get publishedAt => $composableBuilder(
      column: $table.publishedAt, builder: (column) => column);

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);
}

class $$FavouritesTableTableManager extends RootTableManager<
    _$NewsPortalDatabase,
    $FavouritesTable,
    Favourite,
    $$FavouritesTableFilterComposer,
    $$FavouritesTableOrderingComposer,
    $$FavouritesTableAnnotationComposer,
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
          createFilteringComposer: () =>
              $$FavouritesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FavouritesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FavouritesTableAnnotationComposer($db: db, $table: table),
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
    $$FavouritesTableAnnotationComposer,
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
    extends Composer<_$NewsPortalDatabase, $FollowedSourceTable> {
  $$FollowedSourceTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sourceId => $composableBuilder(
      column: $table.sourceId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sourceName => $composableBuilder(
      column: $table.sourceName, builder: (column) => ColumnFilters(column));
}

class $$FollowedSourceTableOrderingComposer
    extends Composer<_$NewsPortalDatabase, $FollowedSourceTable> {
  $$FollowedSourceTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sourceId => $composableBuilder(
      column: $table.sourceId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sourceName => $composableBuilder(
      column: $table.sourceName, builder: (column) => ColumnOrderings(column));
}

class $$FollowedSourceTableAnnotationComposer
    extends Composer<_$NewsPortalDatabase, $FollowedSourceTable> {
  $$FollowedSourceTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get sourceId =>
      $composableBuilder(column: $table.sourceId, builder: (column) => column);

  GeneratedColumn<String> get sourceName => $composableBuilder(
      column: $table.sourceName, builder: (column) => column);
}

class $$FollowedSourceTableTableManager extends RootTableManager<
    _$NewsPortalDatabase,
    $FollowedSourceTable,
    FollowedSourceData,
    $$FollowedSourceTableFilterComposer,
    $$FollowedSourceTableOrderingComposer,
    $$FollowedSourceTableAnnotationComposer,
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
          createFilteringComposer: () =>
              $$FollowedSourceTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FollowedSourceTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FollowedSourceTableAnnotationComposer($db: db, $table: table),
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
    $$FollowedSourceTableAnnotationComposer,
    $$FollowedSourceTableCreateCompanionBuilder,
    $$FollowedSourceTableUpdateCompanionBuilder,
    (
      FollowedSourceData,
      BaseReferences<_$NewsPortalDatabase, $FollowedSourceTable,
          FollowedSourceData>
    ),
    FollowedSourceData,
    PrefetchHooks Function()>;
typedef $$UsersTableCreateCompanionBuilder = UsersCompanion Function({
  required String userName,
  required String fullName,
  required String password,
  required String phoneNumber,
  Value<String?> email,
  Value<String?> resetPasswordExpiration,
  Value<String?> rememberToken,
  Value<String?> sessionId,
  Value<bool> isDeleted,
  Value<int> rowid,
});
typedef $$UsersTableUpdateCompanionBuilder = UsersCompanion Function({
  Value<String> userName,
  Value<String> fullName,
  Value<String> password,
  Value<String> phoneNumber,
  Value<String?> email,
  Value<String?> resetPasswordExpiration,
  Value<String?> rememberToken,
  Value<String?> sessionId,
  Value<bool> isDeleted,
  Value<int> rowid,
});

class $$UsersTableFilterComposer
    extends Composer<_$NewsPortalDatabase, $UsersTable> {
  $$UsersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get userName => $composableBuilder(
      column: $table.userName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get fullName => $composableBuilder(
      column: $table.fullName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get password => $composableBuilder(
      column: $table.password, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get phoneNumber => $composableBuilder(
      column: $table.phoneNumber, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get resetPasswordExpiration => $composableBuilder(
      column: $table.resetPasswordExpiration,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get rememberToken => $composableBuilder(
      column: $table.rememberToken, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sessionId => $composableBuilder(
      column: $table.sessionId, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnFilters(column));
}

class $$UsersTableOrderingComposer
    extends Composer<_$NewsPortalDatabase, $UsersTable> {
  $$UsersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get userName => $composableBuilder(
      column: $table.userName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get fullName => $composableBuilder(
      column: $table.fullName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get password => $composableBuilder(
      column: $table.password, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get phoneNumber => $composableBuilder(
      column: $table.phoneNumber, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get resetPasswordExpiration => $composableBuilder(
      column: $table.resetPasswordExpiration,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get rememberToken => $composableBuilder(
      column: $table.rememberToken,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sessionId => $composableBuilder(
      column: $table.sessionId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnOrderings(column));
}

class $$UsersTableAnnotationComposer
    extends Composer<_$NewsPortalDatabase, $UsersTable> {
  $$UsersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get userName =>
      $composableBuilder(column: $table.userName, builder: (column) => column);

  GeneratedColumn<String> get fullName =>
      $composableBuilder(column: $table.fullName, builder: (column) => column);

  GeneratedColumn<String> get password =>
      $composableBuilder(column: $table.password, builder: (column) => column);

  GeneratedColumn<String> get phoneNumber => $composableBuilder(
      column: $table.phoneNumber, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get resetPasswordExpiration => $composableBuilder(
      column: $table.resetPasswordExpiration, builder: (column) => column);

  GeneratedColumn<String> get rememberToken => $composableBuilder(
      column: $table.rememberToken, builder: (column) => column);

  GeneratedColumn<String> get sessionId =>
      $composableBuilder(column: $table.sessionId, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);
}

class $$UsersTableTableManager extends RootTableManager<
    _$NewsPortalDatabase,
    $UsersTable,
    User,
    $$UsersTableFilterComposer,
    $$UsersTableOrderingComposer,
    $$UsersTableAnnotationComposer,
    $$UsersTableCreateCompanionBuilder,
    $$UsersTableUpdateCompanionBuilder,
    (User, BaseReferences<_$NewsPortalDatabase, $UsersTable, User>),
    User,
    PrefetchHooks Function()> {
  $$UsersTableTableManager(_$NewsPortalDatabase db, $UsersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UsersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UsersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UsersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> userName = const Value.absent(),
            Value<String> fullName = const Value.absent(),
            Value<String> password = const Value.absent(),
            Value<String> phoneNumber = const Value.absent(),
            Value<String?> email = const Value.absent(),
            Value<String?> resetPasswordExpiration = const Value.absent(),
            Value<String?> rememberToken = const Value.absent(),
            Value<String?> sessionId = const Value.absent(),
            Value<bool> isDeleted = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UsersCompanion(
            userName: userName,
            fullName: fullName,
            password: password,
            phoneNumber: phoneNumber,
            email: email,
            resetPasswordExpiration: resetPasswordExpiration,
            rememberToken: rememberToken,
            sessionId: sessionId,
            isDeleted: isDeleted,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String userName,
            required String fullName,
            required String password,
            required String phoneNumber,
            Value<String?> email = const Value.absent(),
            Value<String?> resetPasswordExpiration = const Value.absent(),
            Value<String?> rememberToken = const Value.absent(),
            Value<String?> sessionId = const Value.absent(),
            Value<bool> isDeleted = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UsersCompanion.insert(
            userName: userName,
            fullName: fullName,
            password: password,
            phoneNumber: phoneNumber,
            email: email,
            resetPasswordExpiration: resetPasswordExpiration,
            rememberToken: rememberToken,
            sessionId: sessionId,
            isDeleted: isDeleted,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$UsersTableProcessedTableManager = ProcessedTableManager<
    _$NewsPortalDatabase,
    $UsersTable,
    User,
    $$UsersTableFilterComposer,
    $$UsersTableOrderingComposer,
    $$UsersTableAnnotationComposer,
    $$UsersTableCreateCompanionBuilder,
    $$UsersTableUpdateCompanionBuilder,
    (User, BaseReferences<_$NewsPortalDatabase, $UsersTable, User>),
    User,
    PrefetchHooks Function()>;
typedef $$FilesStorageTableCreateCompanionBuilder = FilesStorageCompanion
    Function({
  Value<int> id,
  required Uint8List media,
});
typedef $$FilesStorageTableUpdateCompanionBuilder = FilesStorageCompanion
    Function({
  Value<int> id,
  Value<Uint8List> media,
});

class $$FilesStorageTableFilterComposer
    extends Composer<_$NewsPortalDatabase, $FilesStorageTable> {
  $$FilesStorageTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<Uint8List> get media => $composableBuilder(
      column: $table.media, builder: (column) => ColumnFilters(column));
}

class $$FilesStorageTableOrderingComposer
    extends Composer<_$NewsPortalDatabase, $FilesStorageTable> {
  $$FilesStorageTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<Uint8List> get media => $composableBuilder(
      column: $table.media, builder: (column) => ColumnOrderings(column));
}

class $$FilesStorageTableAnnotationComposer
    extends Composer<_$NewsPortalDatabase, $FilesStorageTable> {
  $$FilesStorageTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<Uint8List> get media =>
      $composableBuilder(column: $table.media, builder: (column) => column);
}

class $$FilesStorageTableTableManager extends RootTableManager<
    _$NewsPortalDatabase,
    $FilesStorageTable,
    FilesStorageData,
    $$FilesStorageTableFilterComposer,
    $$FilesStorageTableOrderingComposer,
    $$FilesStorageTableAnnotationComposer,
    $$FilesStorageTableCreateCompanionBuilder,
    $$FilesStorageTableUpdateCompanionBuilder,
    (
      FilesStorageData,
      BaseReferences<_$NewsPortalDatabase, $FilesStorageTable, FilesStorageData>
    ),
    FilesStorageData,
    PrefetchHooks Function()> {
  $$FilesStorageTableTableManager(
      _$NewsPortalDatabase db, $FilesStorageTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FilesStorageTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FilesStorageTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FilesStorageTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<Uint8List> media = const Value.absent(),
          }) =>
              FilesStorageCompanion(
            id: id,
            media: media,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required Uint8List media,
          }) =>
              FilesStorageCompanion.insert(
            id: id,
            media: media,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$FilesStorageTableProcessedTableManager = ProcessedTableManager<
    _$NewsPortalDatabase,
    $FilesStorageTable,
    FilesStorageData,
    $$FilesStorageTableFilterComposer,
    $$FilesStorageTableOrderingComposer,
    $$FilesStorageTableAnnotationComposer,
    $$FilesStorageTableCreateCompanionBuilder,
    $$FilesStorageTableUpdateCompanionBuilder,
    (
      FilesStorageData,
      BaseReferences<_$NewsPortalDatabase, $FilesStorageTable, FilesStorageData>
    ),
    FilesStorageData,
    PrefetchHooks Function()>;

class $NewsPortalDatabaseManager {
  final _$NewsPortalDatabase _db;
  $NewsPortalDatabaseManager(this._db);
  $$FavouritesTableTableManager get favourites =>
      $$FavouritesTableTableManager(_db, _db.favourites);
  $$FollowedSourceTableTableManager get followedSource =>
      $$FollowedSourceTableTableManager(_db, _db.followedSource);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db, _db.users);
  $$FilesStorageTableTableManager get filesStorage =>
      $$FilesStorageTableTableManager(_db, _db.filesStorage);
}

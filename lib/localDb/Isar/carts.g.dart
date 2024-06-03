// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carts.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCartIsarCollection on Isar {
  IsarCollection<CartIsar> get cartIsars => this.collection();
}

const CartIsarSchema = CollectionSchema(
  name: r'CartIsar',
  id: 2776682965114414571,
  properties: {
    r'menuId': PropertySchema(
      id: 0,
      name: r'menuId',
      type: IsarType.long,
    ),
    r'quantity': PropertySchema(
      id: 1,
      name: r'quantity',
      type: IsarType.long,
    )
  },
  estimateSize: _cartIsarEstimateSize,
  serialize: _cartIsarSerialize,
  deserialize: _cartIsarDeserialize,
  deserializeProp: _cartIsarDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _cartIsarGetId,
  getLinks: _cartIsarGetLinks,
  attach: _cartIsarAttach,
  version: '3.1.0+1',
);

int _cartIsarEstimateSize(
  CartIsar object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _cartIsarSerialize(
  CartIsar object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.menuId);
  writer.writeLong(offsets[1], object.quantity);
}

CartIsar _cartIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CartIsar(
    menuId: reader.readLong(offsets[0]),
    quantity: reader.readLongOrNull(offsets[1]),
  );
  object.id = id;
  return object;
}

P _cartIsarDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _cartIsarGetId(CartIsar object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _cartIsarGetLinks(CartIsar object) {
  return [];
}

void _cartIsarAttach(IsarCollection<dynamic> col, Id id, CartIsar object) {
  object.id = id;
}

extension CartIsarQueryWhereSort on QueryBuilder<CartIsar, CartIsar, QWhere> {
  QueryBuilder<CartIsar, CartIsar, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CartIsarQueryWhere on QueryBuilder<CartIsar, CartIsar, QWhereClause> {
  QueryBuilder<CartIsar, CartIsar, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<CartIsar, CartIsar, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<CartIsar, CartIsar, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<CartIsar, CartIsar, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<CartIsar, CartIsar, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension CartIsarQueryFilter
    on QueryBuilder<CartIsar, CartIsar, QFilterCondition> {
  QueryBuilder<CartIsar, CartIsar, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CartIsar, CartIsar, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CartIsar, CartIsar, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CartIsar, CartIsar, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CartIsar, CartIsar, QAfterFilterCondition> menuIdEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'menuId',
        value: value,
      ));
    });
  }

  QueryBuilder<CartIsar, CartIsar, QAfterFilterCondition> menuIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'menuId',
        value: value,
      ));
    });
  }

  QueryBuilder<CartIsar, CartIsar, QAfterFilterCondition> menuIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'menuId',
        value: value,
      ));
    });
  }

  QueryBuilder<CartIsar, CartIsar, QAfterFilterCondition> menuIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'menuId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CartIsar, CartIsar, QAfterFilterCondition> quantityIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'quantity',
      ));
    });
  }

  QueryBuilder<CartIsar, CartIsar, QAfterFilterCondition> quantityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'quantity',
      ));
    });
  }

  QueryBuilder<CartIsar, CartIsar, QAfterFilterCondition> quantityEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quantity',
        value: value,
      ));
    });
  }

  QueryBuilder<CartIsar, CartIsar, QAfterFilterCondition> quantityGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'quantity',
        value: value,
      ));
    });
  }

  QueryBuilder<CartIsar, CartIsar, QAfterFilterCondition> quantityLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'quantity',
        value: value,
      ));
    });
  }

  QueryBuilder<CartIsar, CartIsar, QAfterFilterCondition> quantityBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'quantity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension CartIsarQueryObject
    on QueryBuilder<CartIsar, CartIsar, QFilterCondition> {}

extension CartIsarQueryLinks
    on QueryBuilder<CartIsar, CartIsar, QFilterCondition> {}

extension CartIsarQuerySortBy on QueryBuilder<CartIsar, CartIsar, QSortBy> {
  QueryBuilder<CartIsar, CartIsar, QAfterSortBy> sortByMenuId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'menuId', Sort.asc);
    });
  }

  QueryBuilder<CartIsar, CartIsar, QAfterSortBy> sortByMenuIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'menuId', Sort.desc);
    });
  }

  QueryBuilder<CartIsar, CartIsar, QAfterSortBy> sortByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.asc);
    });
  }

  QueryBuilder<CartIsar, CartIsar, QAfterSortBy> sortByQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.desc);
    });
  }
}

extension CartIsarQuerySortThenBy
    on QueryBuilder<CartIsar, CartIsar, QSortThenBy> {
  QueryBuilder<CartIsar, CartIsar, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<CartIsar, CartIsar, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<CartIsar, CartIsar, QAfterSortBy> thenByMenuId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'menuId', Sort.asc);
    });
  }

  QueryBuilder<CartIsar, CartIsar, QAfterSortBy> thenByMenuIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'menuId', Sort.desc);
    });
  }

  QueryBuilder<CartIsar, CartIsar, QAfterSortBy> thenByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.asc);
    });
  }

  QueryBuilder<CartIsar, CartIsar, QAfterSortBy> thenByQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.desc);
    });
  }
}

extension CartIsarQueryWhereDistinct
    on QueryBuilder<CartIsar, CartIsar, QDistinct> {
  QueryBuilder<CartIsar, CartIsar, QDistinct> distinctByMenuId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'menuId');
    });
  }

  QueryBuilder<CartIsar, CartIsar, QDistinct> distinctByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quantity');
    });
  }
}

extension CartIsarQueryProperty
    on QueryBuilder<CartIsar, CartIsar, QQueryProperty> {
  QueryBuilder<CartIsar, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<CartIsar, int, QQueryOperations> menuIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'menuId');
    });
  }

  QueryBuilder<CartIsar, int?, QQueryOperations> quantityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quantity');
    });
  }
}

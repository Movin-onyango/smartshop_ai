import 'package:flutter/material.dart';

/// ---------------------------------------------------------------------------
/// Category
/// ---------------------------------------------------------------------------
///
/// Represents a product category.
///
/// Notes:
/// • icon is stored as a Material icon code point.
/// • color is stored as an ARGB integer value.
/// • UI widgets should use [iconData] and [colorValue].
/// ---------------------------------------------------------------------------
class Category {
  const Category({
    this.id,
    required this.name,
    this.description,
    this.icon,
    this.color,
    this.createdAt,
    this.updatedAt,
  });

  /// Unique category identifier.
  final String? id;

  /// Category name.
  final String name;

  /// Optional description.
  final String? description;

  /// Material icon code point.
  ///
  /// Stored as an integer so it can easily be persisted.
  final int? icon;

  /// ARGB color value.
  ///
  /// Stored as an integer so it can easily be persisted.
  final int? color;

  /// Creation timestamp.
  final DateTime? createdAt;

  /// Last update timestamp.
  final DateTime? updatedAt;

  //--------------------------------------------------------------------------
  // Convenience Getters
  //--------------------------------------------------------------------------

  bool get hasDescription =>
      description != null && description!.trim().isNotEmpty;

  bool get hasIcon => icon != null;

  bool get hasColor => color != null;

  /// Flutter IconData used by the UI.
  IconData get iconData => IconData(
        icon ?? Icons.category.codePoint,
        fontFamily: 'MaterialIcons',
      );

  /// Flutter Color used by the UI.
  Color get colorValue => Color(
        color ?? Colors.blue.toARGB32(),
      );

  //--------------------------------------------------------------------------
  // Copy
  //--------------------------------------------------------------------------

  Category copyWith({
    String? id,
    String? name,
    String? description,
    int? icon,
    int? color,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Category(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      icon: icon ?? this.icon,
      color: color ?? this.color,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
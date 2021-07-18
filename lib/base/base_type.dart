enum BaseType { vanilla, basic }

extension BaseTypeExtension on BaseType {
  String get name {
    switch (this) {
      case BaseType.vanilla:
        return 'Vanilla';
      case BaseType.basic:
        return 'Basic';
    }
  }
}

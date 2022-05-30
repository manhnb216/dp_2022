import 'dart:developer';

class FileComposite implements FileComponent {
  static final FileComposite _instance = FileComposite._init();
  final List<FileComponent> _files = [];

  factory FileComposite(List<FileComponent> files) {
    _instance._files.clear();
    _instance._files.addAll(files);
    return _instance;
  }

  FileComposite._init();

  @override
  void showProperty() {
    log(_files.length.toString());
    for (FileComponent fileComponent in _files) {
      fileComponent.showProperty();
    }
  }

  @override
  int totalSize() {
    int total = 0;
    for (FileComponent fileComponent in _files) {
      total += fileComponent.totalSize();
    }

    return total;
  }
}

class FileLeafImpl extends FileLeaf {
  FileLeafImpl(String name, int size) : super(name, size);
  FileLeafImpl.init() : super('test', 1);
  FileLeafImpl.clone(FileLeaf fileLeaf) : super.clone(fileLeaf);

  @override
  void showProperty() {
    log('Fileleaf [name= $_name, size= $_size]');
  }

  @override
  int totalSize() {
    return _size;
  }

  @override
  FileLeaf clone() {
    return FileLeafImpl.clone(this);
  }

  @override
  void setName(String newName) {
    _name = newName;
  }

  @override
  void setSize(int newSize) {
    _size = newSize;
  }
}

abstract class FileLeaf implements FileComponent {
  String _name = '';
  int _size = 1;

  FileLeaf(this._name, this._size);

  FileLeaf.clone(FileLeaf fileLeaf) {
    _name = fileLeaf._name;
    _size = fileLeaf._size;
  }

  FileLeaf clone();

  void setName(String newName);
  void setSize(int newSize);
}

abstract class FileComponent {
  void showProperty();
  int totalSize();
}

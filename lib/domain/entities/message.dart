enum FromWho{mine, her}

extension FromWhoExtension on FromWho {
  String toReadableString() {
    switch (this) {
      case FromWho.mine:
        return 'Mine';
      case FromWho.her:
        return 'Her';
      default:
        return '';
    }
  }
}

class Message{
  final String text;
  final String? imageUrl;
  final FromWho fromWho;

  Message({required this.text, this.imageUrl, required this.fromWho});

  @override
  String toString() {
    return 'Message(text: $text, imageUrl: $imageUrl, fromWho: ${fromWho.toReadableString()})';
  }


}
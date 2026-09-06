final class ContactStructure {
  const ContactStructure({required this.name, required this.number});

  final String name;
  final String number;

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "number": number
    };
  }
}
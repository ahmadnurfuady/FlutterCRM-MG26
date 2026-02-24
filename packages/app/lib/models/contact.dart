
class Contact {
  final String id;
  final String name;
  final String role;
  final String company;
  final String time;
  final String? avatarUrl;
  final String? initials;
  final bool isOnline; // Represented by the green dot in design

  const Contact({
    required this.id,
    required this.name,
    required this.role,
    required this.company,
    required this.time,
    this.avatarUrl,
    this.initials,
    this.isOnline = false,
    this.email,
    this.phone,
    this.address,
    this.tags,
  });

  final String? email;
  final String? phone;
  final String? address;
  final List<String>? tags;
}

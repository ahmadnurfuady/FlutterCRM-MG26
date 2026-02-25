class Company {
  final String id;
  final String name;
  final String industry;
  final String city;
  final String country;
  final int employeeCount;
  final String? logoUrl; // opsional, jika ingin pakai gambar

  Company({
    required this.id,
    required this.name,
    required this.industry,
    required this.city,
    required this.country,
    required this.employeeCount,
    this.logoUrl,
  });

  // Untuk memudahkan, tambahkan metode getInitials
  String getInitials() {
    List<String> words = name.split(' ');
    if (words.length > 1) {
      return words[0][0] + words[1][0];
    } else {
      return name.substring(0, 1);
    }
  }
}

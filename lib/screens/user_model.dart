class User {
  final int id;
  final String name;
  final String imageUrl;
  final bool isOnline;

  User({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.isOnline,
  });
}

// YOU - current user
final User currentUser = User(
  id: 0,
  name: 'User',
  imageUrl: 'assets/user.png',
  isOnline: true,
);

// USERS
final User support = User(
  id: 1,
  name: 'Customer support',
  imageUrl: 'assets/support.png',
  isOnline: true,
);

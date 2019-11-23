part of spotify.models;

@JsonSerializable()
class SpotifyDevice {
  SpotifyDevice({
    this.id,
    this.name,
    this.type,
    this.isActive,
    this.isPrivate,
    this.isRestricted,
    this.volume,
  });

  SpotifyDevice.fromSpotify(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        type = _parseType(json['type']),
        isActive = json['is_active'],
        isPrivate = json['is_private_session'],
        isRestricted = json['is_restricted'],
        volume = json['volume_percent'];

  final String id;
  final String name;
  final DeviceType type;
  final bool isActive;
  final bool isPrivate;
  final bool isRestricted;

  /// Out of 100.
  final int volume;

  factory SpotifyDevice.fromJson(Map<String, dynamic> json) =>
      _$SpotifyDeviceFromJson(json);
  Map<String, dynamic> toJson() => _$SpotifyDeviceToJson(this);

  static DeviceType _parseType(String type) => DeviceType.values.firstWhere(
      (t) => type.toLowerCase() == t.toString().split('.').last,
      orElse: null);
}

/// See https://developer.spotify.com/documentation/web-api/reference/player/get-a-users-available-devices/#device-types
enum DeviceType {
  computer,
  tablet,
  smartphone,
  speaker,
  tv,
  avr,
  stb,
  audiodongle,
  gameconsole,
  castvideo,
  castaudio,
  automobile,
  unknown,
}

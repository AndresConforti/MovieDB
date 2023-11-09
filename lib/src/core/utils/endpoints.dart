import './strings.dart';

enum Endpoints {
  topRated(
    Strings.topRatedEndpoint,
  ),
  nowPlaying(
    Strings.nowPlayingEndpoint,
  ),
  upcoming(
    Strings.upcomingEndpoint,
  );

  const Endpoints(
    this.endpointName,
  );

  final String endpointName;
}

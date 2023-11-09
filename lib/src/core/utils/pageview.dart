import './strings.dart';

enum Pages {
  topRated(
    1,
    Strings.topRatedPVTitle,
  ),
  nowPlaying(
    2,
    Strings.nowPlayingPVTitle,
  ),
  upcoming(
    3,
    Strings.upcomingPVTitle,
  );

  const Pages(
    this.pageIndex,
    this.pageName,
  );

  final int pageIndex;
  final String pageName;
}

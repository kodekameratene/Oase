
import 'package:oase/assets/mock_data/ContentPost.dart';

/// Collect all helper methods here for
/// getting and setting content related stuff...
///
/// Consider this as your middleware for getting and setting stuff
////// Todo: Setup Firebase Database as back-end
// Henry, 26/5/2019
class ContentHelper {
  static getContentWithID(id) {
    print(id);
    Iterable<ContentPost> result =
        content.where((contentPost) => contentPost.id == id);
    print("result:");
    print(result.toString());
    return result;
  }

  static getEvents() => events;

  static getInfo() => infoPosts;

  static getNews() => newsPosts;

  static getLocations() => locations;
}

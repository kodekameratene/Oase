import 'package:oase/styles.dart';

mapCategoryToStartColor(String category) {
  switch (category) {
    case 'mat':
      return Styles.colorAccentCategoryFoodStart;
      break;
    case 'møte':
      return Styles.colorAccentCategoryMeetingStart;
      break;
    case 'seminar':
      return Styles.colorAccentCategorySeminarStart;
      break;
    case 'samling':
      return Styles.colorAccentCategoryGatheringStart;
      break;
    case 'konsert':
      return Styles.colorAccentCategoryConcertStart;
      break;
    case 'forestilling':
      return Styles.colorAccentCategoryPerformanceStart;
      break;
  }
}

mapCategoryToEndColor(String category) {
  switch (category) {
    case 'mat':
      return Styles.colorAccentCategoryFoodEnd;
      break;
    case 'møte':
      return Styles.colorAccentCategoryMeetingEnd;
      break;
    case 'seminar':
      return Styles.colorAccentCategorySeminarEnd;
      break;
    case 'samling':
      return Styles.colorAccentCategoryGatheringEnd;
      break;
    case 'konsert':
      return Styles.colorAccentCategoryConcertEnd;
      break;
    case 'forestilling':
      return Styles.colorAccentCategoryPerformanceEnd;
      break;
  }
}

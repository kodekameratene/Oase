class ContentPost {
  final String title;
  final String content;
  final String img;
  final List<String> showCategories;
  final DateTime startTime;
  final DateTime endTime;
  final String number;
  final String url;
  final String location;
  final String category;
  final int importance;
  final bool hidden;

  ContentPost(
      {this.title,
      this.content = "",
      this.img = "",
      this.showCategories,
      this.startTime,
      this.endTime,
      this.number,
      this.url,
      this.location,
      this.category,
      this.importance,
      this.hidden});
}

final events = [
  new ContentPost(
    title: "Registreringen åpner",
    startTime: DateTime(2019, 01, 25, 17, 00),
  ),
  new ContentPost(
    title: "Skolene er åpne",
    content:
        "Etter at du har registrert deg kan du legge fra deg bagasjen din der du skal sove.",
    startTime: DateTime(2019, 01, 25, 18, 00),
    endTime: DateTime(2019, 01, 25, 19, 33),
  ),
  new ContentPost(
    title: "Bønnemøte i Living Room",
    startTime: DateTime(2019, 01, 25, 18, 30),
  ),
  new ContentPost(
    title: "Celebration",
    content:
        "Møtene på Impuls kalles Celebration. Her bruker vi god tid til lovsang, tale og det er også mulighet for forbønn.",
    startTime: DateTime(2019, 01, 25, 20, 00),
    img: "http://kodekameraten.no/img/hello.jpg",
  ),
  //Lørdag
  new ContentPost(
    title: "Bønnemøte i Living Room",
    startTime: DateTime(2019, 01, 26, 09, 00),
  ),
  new ContentPost(
    title: "Celebration",
    content:
        "Møtene på Impuls kalles Celebration. Her bruker vi god tid til lovsang, tale og det er også mulighet for forbønn.",
    startTime: DateTime(2019, 01, 26, 10, 00),
    img: "http://kodekameraten.no/img/hello.jpg",
  ),
  new ContentPost(
      title: "Seminarbolk",
      content: 'This post should also show posts with categories "c1" & "c2"',
      showCategories: ["c1", 'c2'],
      startTime: DateTime(2019, 01, 26, 12, 00),
      endTime: DateTime(2019, 01, 26, 13, 00),
      category: "s1"),
];

final newsPosts = [
  new ContentPost(
    title: "Velkommen til Jonah!",
    content: "Lorem ipsum dolor sit amet.",
    startTime: DateTime.now(),
  ),
  new ContentPost(
    title: "This should be hidden!",
    content: "Lorem ipsum dolor sit amet.",
    startTime: DateTime.now(),
    img: "http://kodekameraten.no/img/hello.jpg",
    hidden: true,
  ),
  new ContentPost(
    title: "Velkommen til Jonah!",
    content: "Lorem ipsum dolor sit amet.",
    img: "http://kodekameraten.no/img/hello.jpg",
    startTime: DateTime.now(),
  ),
];

final infoPosts = [
  new ContentPost(
    title: "Seminarbolk 1",
    content: 'This post should also show posts with categories "s1"',
    showCategories: ["s1"],
  ),
  new ContentPost(
    title: "This should be hidden!",
    content: "Lorem ipsum dolor sit amet.",
    hidden: true,
  ),
  new ContentPost(
    title: "Velkommen til Jonah!",
    content: "Lorem ipsum dolor sit amet.",
    img: "http://kodekameraten.no/img/hello.jpg",
  )
];

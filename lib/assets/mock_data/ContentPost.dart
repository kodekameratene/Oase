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
  final String id;

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
      this.hidden,
      this.id});

  static get events => events;
}

class Location {
  final String title;
  final String subtitle;
  final String location;

  final DateTime startTime;
  final DateTime endTime;
  final String img;
  final bool active;

  Location({
    this.title = "Ingen Tittel",
    this.subtitle,
    this.location = "TBA",
    this.startTime,
    this.endTime,
    this.img = "",
    this.active = true,
  });
}

final events = [
  new ContentPost(
    id: '1',
    title: "Registreringen åpner",
    startTime: DateTime(2019, 01, 25, 17, 00),
  ),
  new ContentPost(
    id: '2',
    title: "Skolene er åpne",
    content:
        "Etter at du har registrert deg kan du legge fra deg bagasjen din der du skal sove.",
    startTime: DateTime(2019, 01, 25, 18, 00),
    endTime: DateTime(2019, 01, 25, 19, 33),
  ),
  new ContentPost(
    id: '3',
    title: "Bønnemøte i Living Room",
    startTime: DateTime(2019, 01, 25, 18, 30),
  ),
  new ContentPost(
    id: '4',
    title: "Celebration",
    content:
        "Møtene på Impuls kalles Celebration. Her bruker vi god tid til lovsang, tale og det er også mulighet for forbønn.",
    startTime: DateTime(2019, 01, 25, 20, 00),
    img: "http://kodekameraten.no/img/hello.jpg",
  ),
  //Lørdag
  new ContentPost(
    id: '5',
    title: "Bønnemøte i Living Room",
    startTime: DateTime(2019, 01, 26, 09, 00),
  ),
  new ContentPost(
    id: '6',
    title: "Celebration",
    content:
        "Møtene på Impuls kalles Celebration. Her bruker vi god tid til lovsang, tale og det er også mulighet for forbønn.",
    startTime: DateTime(2019, 01, 26, 10, 00),
    img: "http://kodekameraten.no/img/hello.jpg",
  ),
  new ContentPost(
      id: '7',
      title: "Seminarbolk",
      content: 'This post should also show posts with categories "c1" & "c2"',
      showCategories: ["c1", 'c2'],
      startTime: DateTime(2019, 01, 26, 12, 00),
      endTime: DateTime(2019, 01, 26, 13, 00),
      category: "s1"),
];

final newsPosts = [
  new ContentPost(
    id: '8',
    title: "Velkommen til Jonah!",
    content: "Lorem ipsum dolor sit amet.",
    startTime: DateTime.now(),
  ),
  new ContentPost(
    id: '9',
    title: "This should be hidden!",
    content: "Lorem ipsum dolor sit amet.",
    startTime: DateTime.now(),
    img: "http://kodekameraten.no/img/hello.jpg",
    hidden: true,
  ),
  new ContentPost(
    id: '10',
    title: "Velkommen til Jonah!",
    content: "Lorem ipsum dolor sit amet.",
    img: "http://kodekameraten.no/img/hello.jpg",
    startTime: DateTime.now(),
  ),
];

final infoPosts = [
  new ContentPost(
    id: '11',
    title: "Seminarbolk 1",
    content: 'This post should also show posts with categories "s1"',
    showCategories: ["s1"],
  ),
  new ContentPost(
    id: '12',
    title: "This should be hidden!",
    content: "Lorem ipsum dolor sit amet.",
    hidden: true,
  ),
  new ContentPost(
    id: '13',
    title: "Velkommen til Jonah!",
    content: "Lorem ipsum dolor sit amet.",
    img: "http://kodekameraten.no/img/hello.jpg",
  )
];

final locations = [
  new Location(
    title: "Oase 2019",
    subtitle: "Stevnet holdes i Kongstenhallen i Fredrikstad.",
    startTime: DateTime(2019, 6, 9),
    endTime: DateTime(2019, 14, 9),
    img:
        "https://oase.no/wp-content/uploads/2019/01/Oase-2018-HD-0148-300x200.jpg",
  ),
  new Location(
    title: "Oase 2020",
    startTime: DateTime(2019, 6, 9),
    endTime: DateTime(2019, 14, 9),
    active: false,
  )
];

final content = newsPosts + events + infoPosts;

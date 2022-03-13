class Question {
  // final int? ;
  final String? question, imageUri, id, answer;
  final List<dynamic>? options;

  Question({this.id, this.question, this.imageUri, this.answer, this.options});

  Question.fromMap(Map snapshot, String id)
      : id = id ?? '',
        question = snapshot['question'] ?? '',
        answer = snapshot['answer'] ?? '',
        options = snapshot['options'] ?? '',
        imageUri = snapshot['imageUri'] ?? '';

  toJson() {
    return {
      "question": question,
      "answer": answer,
      "options": options,
      "imageUri": imageUri
    };
  }
}

// const List sample_data = [
//
//   {
//     "id": 1,
//     "question": "Guess the Movie",
//     "options": ['Goosebumps', 'Google', 'Facebook', 'Microsoft'],
//     "answer_index": 1,
//   },
//   {
//     "id": 2,
//     "question": "When google release Flutter.",
//     "options": ['Jun 2017', 'Jun 2017', 'May 2017', 'May 2018'],
//     "answer_index": 2,
//   },
//   {
//     "id": 3,
//     "question": "A memory location that holds a single letter or number.",
//     "options": ['Double', 'Int', 'Char', 'Word'],
//     "answer_index": 2,
//   },
//   {
//     "id": 4,
//     "question": "What command do you use to output data to the screen?",
//     "options": ['Cin', 'Count>>', 'Cout', 'Output>>'],
//     "answer_index": 2,
//   },
// ];

// [
//   {id: cUpFmbEnzCur7JJO98Gy,
//    question: Guess the Movie,
//     answer: 2,
//      options: [Goosebumps, Goosebumps 2, Ghost Town, Craft 2],
//      imageUri: https://i.pinimg.com/474x/95/32/da/9532daba366b33e003dff5dbbf5eabe7.jpg}
//      ]

final QuizList = [
  Question(
      id: '1',
      question: "Guess the Movie",
      imageUri:
          "https://i.pinimg.com/474x/95/32/da/9532daba366b33e003dff5dbbf5eabe7.jpg",
      answer: '2',
      options: ['Goosebumps', 'Goosebumps 2', 'The Craft', 'Ghost Town']),
  Question(
      id: '2',
      question: "Year this movie released",
      imageUri: "",
      answer: '4',
      options: ['2009', '2004', '2021', '2015']),
  Question(
      id: '3',
      question: "Director of this Movie",
      imageUri:
          "https://i.pinimg.com/474x/95/32/da/9532daba366b33e003dff5dbbf5eabe7.jpg",
      answer: '3',
      options: [
        'John Tuderman',
        'Lewis Sky',
        'Rob Letterman',
        'William Scerion'
      ]),
  Question(
      id: '4',
      question: "Which genre this movie belongs",
      imageUri:
          "https://i.pinimg.com/474x/95/32/da/9532daba366b33e003dff5dbbf5eabe7.jpg",
      answer: '3',
      options: ['action', 'comedy', 'Horror/ Commedy', 'Love'])
];

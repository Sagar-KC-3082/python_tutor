import 'package:python_basics/features/homescreen/infrastructure/entities/chapter_response.dart';
import 'package:python_basics/features/homescreen/infrastructure/entities/topic_response.dart';

/// @author: Sagar K.C.
/// @email: sagar.kc@fonepay.com
/// @created_at: 6/25/2024, Tuesday

class StaticData {
  static final chapterList = [
    ChapterResponse(
      title: 'Chapter 1 - Data Types',
      topicsList: [
        TopicResponse(
          title: 'Introduction',
          contentList: [
            TopicIndividualSection(
              title:
                  "Welcome to your first day of learning the basics of computers! Today, we'll start with an introduction to computers. By the end of this lesson, you'll have a solid understanding of what a computer is, its parts, and its basic functions. Let's dive in!",
            ),
            TopicIndividualSection(
              title: 'What is Data Types? ',
              description:
                  "A Data Types is an electronic device that can process, store, and retrieve information. It can perform a wide variety of tasks by following a set of instructions called a program. You use computers for everything from browsing the internet, creating documents, and playing games to managing your finances and communicating with others.",
              imageUrl: 'https://picsum.photos/seed/picsum/200/300',
            ),
            TopicIndividualSection(
              title: 'Types of Data Types : ',
              description:
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
              imageUrl:
                  'https://fastly.picsum.photos/id/237/200/300.jpg?hmac=TmmQSbShHz9CdQm0NkEjx1Dyh_Y984R9LpNrpvH2D_U',
            ),
          ],
        ),
        TopicResponse(
          title: 'String',
          contentList: [
            TopicIndividualSection(
              title:
                  "Welcome to your first day of learning the basics of computers! Today, we'll start with an introduction to computers. By the end of this lesson, you'll have a solid understanding of what a computer is, its parts, and its basic functions. Let's dive in!",
            ),
            TopicIndividualSection(
              title: 'What is String? ',
              description:
                  "A Data Types is an electronic device that can process, store, and retrieve information. It can perform a wide variety of tasks by following a set of instructions called a program. You use computers for everything from browsing the internet, creating documents, and playing games to managing your finances and communicating with others.",
              imageUrl: 'https://placehold.jp/150x150.png',
            ),
            TopicIndividualSection(
              title: 'Types of Data Types : ',
              description:
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
              imageUrl: 'https://picsum.photos/seed/picsum/200/300',
            ),
          ],
        ),
        TopicResponse(
          title: 'Theory',
          contentList: [
            TopicIndividualSection(
              title:
                  "Welcome to your first day of learning the basics of computers! Today, we'll start with an introduction to computers. By the end of this lesson, you'll have a solid understanding of what a computer is, its parts, and its basic functions. Let's dive in!",
            ),
            TopicIndividualSection(
              title: 'What is Data Types? ',
              description:
                  "A Data Types is an electronic device that can process, store, and retrieve information. It can perform a wide variety of tasks by following a set of instructions called a program. You use computers for everything from browsing the internet, creating documents, and playing games to managing your finances and communicating with others.",
              imageUrl: 'https://picsum.photos/seed/picsum/200/300',
            ),
            TopicIndividualSection(
              title: 'Types of Data Types : ',
              description:
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
              imageUrl: 'https://picsum.photos/seed/picsum/200/300',
            ),
          ],
        ),
      ],
      quizList: [
        QuizResponse(
            question: 'What is Computer ? ',
            correctOptionIndex: 0,
            optionList: [
              'Electronic Device',
              'Mechanical Device',
              'Water Device',
              'Farming Device',
            ]),
        QuizResponse(
            question: 'What is Data Types ? ',
            correctOptionIndex: 0,
            optionList: [
              'Coding Basics',
              'Hardware',
              'Software',
              'Quality Assurance tool',
            ]),
        QuizResponse(
            question: 'What is CPU ? ',
            correctOptionIndex: 3,
            optionList: [
              'Mechanical Device',
              'Water Device',
              'Farming Device',
              'Electronic Device',
            ]),
      ],
    ),
    ChapterResponse(
      title: 'Chapter 2 - Loops',
      topicsList: [
        TopicResponse(
          title: 'Concepts',
          contentList: [
            TopicIndividualSection(
              title:
                  "Welcome to your first day of learning the basics of computers! Today, we'll start with an introduction to computers. By the end of this lesson, you'll have a solid understanding of what a computer is, its parts, and its basic functions. Let's dive in!",
            ),
            TopicIndividualSection(
              title: 'What is Data Types? ',
              description:
                  "A Data Types is an electronic device that can process, store, and retrieve information. It can perform a wide variety of tasks by following a set of instructions called a program. You use computers for everything from browsing the internet, creating documents, and playing games to managing your finances and communicating with others.",
              imageUrl: 'https://picsum.photos/seed/picsum/200/300',
            ),
            TopicIndividualSection(
              title: 'Types of Data Types : ',
              description:
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
              imageUrl: 'https://picsum.photos/seed/picsum/200/300',
            ),
          ],
        ),
        TopicResponse(
          title: 'String',
          contentList: [
            TopicIndividualSection(
              title:
                  "Welcome to your first day of learning the basics of computers! Today, we'll start with an introduction to computers. By the end of this lesson, you'll have a solid understanding of what a computer is, its parts, and its basic functions. Let's dive in!",
            ),
            TopicIndividualSection(
              title: 'What is String? ',
              description:
                  "A Data Types is an electronic device that can process, store, and retrieve information. It can perform a wide variety of tasks by following a set of instructions called a program. You use computers for everything from browsing the internet, creating documents, and playing games to managing your finances and communicating with others.",
              imageUrl: 'https://picsum.photos/seed/picsum/200/300',
            ),
            TopicIndividualSection(
              title: 'Types of Data Types : ',
              description:
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
              imageUrl: 'https://placehold.jp/150x150.png',
            ),
          ],
        ),
      ],
      quizList: [
        QuizResponse(
            question: 'What is Computer ? ',
            correctOptionIndex: 0,
            optionList: [
              'Electronic Device',
              'Mechanical Device',
              'Water Device',
              'Farming Device',
            ]),
        QuizResponse(
            question: 'What is Data Types ? ',
            correctOptionIndex: 0,
            optionList: [
              'Coding Basics',
              'Hardware',
              'Software',
              'Quality Assurance tool',
            ]),
        QuizResponse(
            question: 'What is CPU ? ',
            correctOptionIndex: 3,
            optionList: [
              'Mechanical Device',
              'Water Device',
              'Farming Device',
              'Electronic Device',
            ]),
      ],
    ),
    ChapterResponse(
      title: 'Chapter 3 - Recursions',
      topicsList: [
        TopicResponse(
          title: 'Basic Idea and Principles',
          contentList: [
            TopicIndividualSection(
              title:
                  "Welcome to your first day of learning the basics of computers! Today, we'll start with an introduction to computers. By the end of this lesson, you'll have a solid understanding of what a computer is, its parts, and its basic functions. Let's dive in!",
            ),
            TopicIndividualSection(
              title: 'What is Data Types? ',
              description:
                  "A Data Types is an electronic device that can process, store, and retrieve information. It can perform a wide variety of tasks by following a set of instructions called a program. You use computers for everything from browsing the internet, creating documents, and playing games to managing your finances and communicating with others.",
              imageUrl: 'https://picsum.photos/seed/picsum/200/300',
            ),
            TopicIndividualSection(
              title: 'Types of Data Types : ',
              description:
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
              imageUrl: 'https://picsum.photos/seed/picsum/200/300',
            ),
          ],
        ),
        TopicResponse(
          title: 'String',
          contentList: [
            TopicIndividualSection(
              title:
                  "Welcome to your first day of learning the basics of computers! Today, we'll start with an introduction to computers. By the end of this lesson, you'll have a solid understanding of what a computer is, its parts, and its basic functions. Let's dive in!",
            ),
            TopicIndividualSection(
              title: 'What is String? ',
              description:
                  "A Data Types is an electronic device that can process, store, and retrieve information. It can perform a wide variety of tasks by following a set of instructions called a program. You use computers for everything from browsing the internet, creating documents, and playing games to managing your finances and communicating with others.",
              imageUrl: 'https://placehold.jp/150x150.png',
            ),
            TopicIndividualSection(
              title: 'Types of Data Types : ',
              description:
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
              imageUrl: 'https://picsum.photos/seed/picsum/200/300',
            ),
          ],
        ),
      ],
      quizList: [
        QuizResponse(
            question: 'What is Computer ? ',
            correctOptionIndex: 0,
            optionList: [
              'Electronic Device',
              'Mechanical Device',
              'Water Device',
              'Farming Device',
            ]),
        QuizResponse(
            question: 'What is Data Types ? ',
            correctOptionIndex: 0,
            optionList: [
              'Coding Basics',
              'Hardware',
              'Software',
              'Quality Assurance tool',
            ]),
        QuizResponse(
            question: 'What is CPU ? ',
            correctOptionIndex: 3,
            optionList: [
              'Mechanical Device',
              'Water Device',
              'Farming Device',
              'Electronic Device',
            ]),
      ],
    ),
  ];
}

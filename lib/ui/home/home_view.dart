import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 228, 227, 227),
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Image.asset(
            'assets/search.jpeg',
            scale: 2.2,
          ),
          onPressed: () {},
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Image.asset(
              'assets/noti.jpeg',
              scale: 2.2,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Image.asset(
              'assets/noimg.png',
              scale: 2.2,
            ),
            onPressed: () {},
          )
        ],
        title: const Text(
          'Member Setting',
          style:
              TextStyle(fontSize: 16, color: Color.fromARGB(185, 94, 0, 170)),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height / 1,
            width: MediaQuery.of(context).size.width / 1,
            child: Card(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Member Role',
                          style: TextStyle(
                              fontSize: 35,
                              color: Color.fromARGB(185, 94, 0, 170)),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              '12 Active Member',
                              style: TextStyle(fontSize: 16),
                            ),
                            Text('Edit',
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontSize: 16,
                                    color: Color.fromARGB(185, 94, 0, 170)))
                          ],
                        )
                      ],
                    ),
                  ),
                  const Divider(
                    color: Colors.black,
                    thickness: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                              suffixIcon: Image.asset(
                                'assets/search.jpeg',
                                scale: 2.2,
                              ),
                              hintText: 'Type Here',
                              border: const OutlineInputBorder()),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 1.8,
                          child: ListView.builder(
                              itemCount: 6,
                              itemBuilder: (context, index) {
                                return roleTile(
                                    name[index],
                                    role1[index],
                                    role2[index],
                                    color1[index],
                                    color2[index],
                                    width[index]);
                              }),
                        ),
                        // roleTile(
                        //     'Tony Stark',
                        //     'Project Manager',
                        //     'Project Manager',
                        //     const Color.fromARGB(255, 255, 241, 198),
                        //     const Color.fromARGB(255, 255, 191, 0),
                        //     100),
                        // roleTile(
                        //     'Elizabeth Olsen',
                        //     'Project Manager',
                        //     'Designer',
                        //     const Color.fromARGB(255, 255, 198, 198),
                        //     const Color.fromARGB(255, 255, 0, 0),
                        //     80),
                        // roleTile(
                        //     'Lulu Utek',
                        //     'UX Designer',
                        //     'Programers',
                        //     const Color.fromARGB(184, 138, 101, 168),
                        //     const Color.fromARGB(185, 94, 0, 170),
                        //     100),
                        // roleTile(
                        //     'Kera Sagu',
                        //     'UI Designer',
                        //     'Account Executive',
                        //     const Color.fromARGB(255, 204, 251, 200),
                        //     const Color.fromARGB(194, 17, 255, 0),
                        //     120),
                        // roleTile(
                        //     'Lulu Utek',
                        //     'UX Designer',
                        //     'Programers',
                        //     const Color.fromARGB(184, 138, 101, 168),
                        //     const Color.fromARGB(185, 94, 0, 170),
                        //     100),
                        // roleTile(
                        //     'Kera Sagu',
                        //     'UI Designer',
                        //     'Account Executive',
                        //     const Color.fromARGB(255, 204, 251, 200),
                        //     const Color.fromARGB(194, 17, 255, 0),
                        //     120),
                        const TextField(
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.add_circle_outlined,
                                color: Color.fromARGB(185, 94, 0, 170),
                              ),
                              hintText: 'Add New Member',
                              border: OutlineInputBorder()),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }

  List name = [
    'Tony Stark',
    'Elizabeth Olsen',
    'Lulu Utek',
    'Kera Sagu',
    'Lulu Utek',
    'Kera Sagu'
  ];
  List role1 = [
    'Project Manager',
    'Project Manager',
    'UX Designer',
    'UI Designer',
    'UX Designer',
    'UI Designer'
  ];
  List role2 = [
    'Project Manager',
    'Designer',
    'Programers',
    'Account Executive',
    'Programers',
    'Account Executive'
  ];
  List color1 = [
    const Color.fromARGB(255, 255, 241, 198),
    const Color.fromARGB(255, 255, 198, 198),
    const Color.fromARGB(184, 138, 101, 168),
    const Color.fromARGB(255, 204, 251, 200),
    const Color.fromARGB(184, 138, 101, 168),
    const Color.fromARGB(255, 204, 251, 200)
  ];
  List color2 = [
    const Color.fromARGB(255, 255, 191, 0),
    const Color.fromARGB(255, 255, 0, 0),
    const Color.fromARGB(185, 94, 0, 170),
    const Color.fromARGB(194, 17, 255, 0),
    const Color.fromARGB(185, 94, 0, 170),
    const Color.fromARGB(194, 17, 255, 0)
  ];
  List width = [100, 80, 100, 120, 100, 120];

  Widget roleTile(String name, String role1, String role2, Color color1,
      Color color2, int width) {
    return ListTile(
        leading: CircleAvatar(
          backgroundColor: const Color.fromARGB(255, 205, 205, 205),
          child: Image.asset(
            'assets/noimg.png',
            scale: 2.5,
          ),
        ),
        title: Text(name),
        subtitle: Text(role1),
        trailing: Container(
          width: width.toDouble(),
          height: 25,
          decoration: BoxDecoration(
              color: color1,
              borderRadius: const BorderRadius.all(Radius.circular(15))),
          child: Center(
            child: Text(
              role2,
              style: TextStyle(
                color: color2,
              ),
            ),
          ),
        ));
  }
}
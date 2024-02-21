import 'package:flutter/material.dart';

void main() { //main method gives the application the info it needs and runs app
  UserInfo userInfo = UserInfo(
    name: "Sameer Kajani",
    position: "Future Software Engineer, IT Intern, & Student",
    company: "CannonDesign",
    address1: "225 N Michigan Ave",
    address2: "Chicago, IL 60616",
    email: "skajani@hawk.iit.edu",
    phone: "(773)-123-4567",

    education: [
      EducationInfo(
        name: "Niles West High School",
        gpa: "4.0",
        degree: "High School Diploma"
      ),
      EducationInfo(
        name: "Illinois Insitute of Technology",
        gpa: "4.0",
        degree: "B.S. in C.S. (Computer Sciences)",
      ),
    ],
    projects: [
      ProjectInfo(
        name: "Personal Website",
        status: "In Progress: Spring 2024",
        description: "Personal Website (Currently Only in HTML)",
        image: "assets/images/website.jpg"
      ),
      ProjectInfo(
        name: "HawkEyeReviews",
        status: "Completed: Fall 2023",
        description: "RateMyProfessor for Classes & Professors @ IIT",
        image: "assets/images/hawkeyereviews.jpg"
      ),
      ProjectInfo(
        name: "CTA Transit App",
        status: "Completed: Fall 2021",
        description: "Shows CTA routes and allows input for destination",
        image: "assets/images/cta.jpg"
      ),
      ProjectInfo(
        name: "Attendence Application",
        status: "In Progress: Spring 2024",
        description: "Record Attendence Digitally for Religious Education Center",
        image: "assets/images/attendance.jpg"
      )
    ],
  );

  runApp(MaterialApp(
    title: "Assignment #1",
    home: ProfilePage(userInfo: userInfo),
    debugShowCheckedModeBanner: false,
  ));
}

class UserInfo {
  final String name;
  final String position;
  final String company;
  final String phone;
  final String email;
  final String address1;
  final String address2;
  final List<EducationInfo> education;
  final List<ProjectInfo> projects;

  UserInfo({
    required this.name,
    required this.address1,
    required this.address2,
    required this.email,
    required this.phone,
    required this.position,
    required this.company,
    required this.education,
    required this.projects,
  });
}

class EducationInfo {
  final String name;
  final String? gpa;
  final String? degree;

  EducationInfo({
    required this.name,
    this.gpa,
    this.degree,
  });
}

class ProjectInfo {
  final String name;
  final String image;
  final String status;
  final String description;

  ProjectInfo({
    required this.name,
    required this.image,
    required this.status,
    required this.description,
  });
}

class ProfilePage extends StatelessWidget { //main page
  final UserInfo userInfo;

  const ProfilePage({
    required this.userInfo,
  }) : super(key: const Key('profilePage'));

  @override
  Widget build(BuildContext context) { //build widget
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome to my Profile Page!"), //title
      ),
      body: SingleChildScrollView( //allows for scroll
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //Section 1: Basic Info & Profile Pic
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [ //add profile image
                    SizedBox(
                        width: 250,
                        height: 250,
                        child: Image.asset("assets/images/profile.jpg"),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [ //add name, position, and company
                        Text(userInfo.name),
                        const SizedBox(height: 8), //spacing
                        Text(userInfo.position),
                        const SizedBox(height: 8),
                        Text(userInfo.company),
                      ],
                    ),
                    const SizedBox(width: 16), 
                  ],
                ),
              ],
            ),
            //Section 2: Contact
            Column(
              children: [
                Row(
                  children: [ //Contact Title
                    Text("Contact", style: Theme.of(context).textTheme.headlineMedium)
                  ],
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        const SizedBox (height: 20),
                        SizedBox( //add images as icons
                        width: 50,
                        height: 50,
                        child: Image.asset("assets/images/phone.jpg"),
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                        width: 50,
                        height: 50,
                        child: Image.asset("assets/images/email.jpg"),
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                        width: 50,
                        height: 50,
                        child: Image.asset("assets/images/house.jpg"),
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                    Row(
                      children: [ //add phone, address, and email
                        Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10),
                            Text("Phone: ${userInfo.phone}"),
                            const SizedBox(height: 35), //spacing
                            Text("Email: ${userInfo.email}"),
                            const SizedBox(height: 35),
                            Text("Address: ${userInfo.address1}\n${userInfo.address2}"),
                          ],
                        ),
                      ]
                    ),
                  ],
                ),
              ],
            ),
            //Section 3 : Education
            Column (
              children: [
                Row (
                  children: [ //education title
                    Text("Education", style: Theme.of(context).textTheme.headlineMedium)
                  ],
                ),
                Row (
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column (
                      children: [ //add logos for schools
                        const SizedBox(height: 20),
                        SizedBox(
                        width: 75,
                        height: 75,
                        child: Image.asset("assets/images/nwlogo.jpg"),
                        ),
                        const SizedBox(height: 16), //spacing
                        SizedBox(
                        width: 75,
                        height: 75,
                        child: Image.asset("assets/images/iitlogo.jpg"),
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),

                    const VerticalDivider(), //divider b/t logo and education info
                    const SizedBox(height: 100),

                   Expanded(
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: userInfo.education.length,
                      separatorBuilder: (context, index) => const SizedBox(height: 50),
                      itemBuilder: (context, index) {
                        final education = userInfo.education[index];
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            // School name
                            Expanded(
                              child: Text( //add school name with bold font
                                education.name,
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            // GPA
                            Expanded(
                              flex: 1,
                              child: education.gpa != null //add gpa if exists
                                  ? Text("GPA: ${education.gpa}")
                                  : Container(),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  ],
                ),
              ],
            ),
            //Section 4 : Projects
            Column(
              children: [
                Row(
                  children: [ //projects title
                    Text("Projects", style: Theme.of(context).textTheme.headlineMedium),
                  ],
                ),
                SizedBox(
                height: 300,
                child: GridView.count( //add gridview for all projects, scrollable so option to add as many as wanted
                  crossAxisCount: 3,
                  children: userInfo.projects.map((project) {
                    return Column(
                      children: [
                        const SizedBox(height: 20),
                        Container(
                        width: 75,
                        height: 75,
                        child: Image.asset(project.image),
                        ),
                        const SizedBox(height: 16),
                        Text(project.name),
                        const SizedBox(height: 8),
                        Text(project.status),
                        const SizedBox(height: 8),
                        Text(project.description),
                      ],
                    );
                  }).toList(),
                ),
                ),
              ],
            ),        
          ],
        ),
      ),
    );
  }
}
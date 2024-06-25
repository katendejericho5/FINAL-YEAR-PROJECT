import 'package:flutter/material.dart';
import 'package:signer/models/sign_model.dart';
import 'package:signer/screens/learn_details.dart';

class SignLanguageScreen extends StatefulWidget {
  final List<SignLanguageLetter> signLanguageLetters;

  SignLanguageScreen(this.signLanguageLetters);

  @override
  _SignLanguageScreenState createState() => _SignLanguageScreenState();
}

class _SignLanguageScreenState extends State<SignLanguageScreen> {
  final TextEditingController _searchController = TextEditingController();
  late List<SignLanguageLetter> _signLanguageLetters;
  late List<SignLanguageLetter> _filteredSignLanguageLetters;

  @override
  void initState() {
    super.initState();
    _signLanguageLetters = widget.signLanguageLetters;
    _filteredSignLanguageLetters = _signLanguageLetters;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sign Letters',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              controller: _searchController,
              onChanged: (value) {
                if (value.length >= 1 || value.isEmpty) {
                  _filterSignLanguageLetters(value);
                }
              },
              decoration: InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          _filterSignLanguageLetters('');
                        },
                      )
                    : Icon(Icons.search),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 16.0),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                children: _filteredSignLanguageLetters.map((letter) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LetterDetailsScreen(
                            letter: letter.letter,
                            imagePath: letter.imagePath,
                            description: letter.description,
                          ),
                        ),
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Stack(
                        children: [
                          Image.asset(
                            letter.imagePath,
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color.fromARGB(123, 0, 0, 0),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10.0),
                                  bottomRight: Radius.circular(10.0),
                                ),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              child: Text(
                                letter.letter,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _filterSignLanguageLetters(String query) {
    setState(() {
      _filteredSignLanguageLetters = _signLanguageLetters.where((letter) {
        return letter.letter.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }
}

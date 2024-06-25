import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  final Function(String) onSearch;

  SearchPage({required this.onSearch});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchTextChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchTextChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchTextChanged() {
    final query = _searchController.text;
    widget.onSearch(query);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Search sign letters',
            border: InputBorder.none,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Here you can display your search results based on the query
              Expanded(
                child: Container(
                  // Implement your search results widget here
                  // For example, if you have a ListView to display search results:
                  child: _buildSearchResults(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchResults() {
    // This function can be used to build and display search results based on the query
    final query = _searchController.text.toLowerCase();

    // You can use the query to filter and display relevant search results
    // For example, if you have a list of search results stored in a variable:
    // List<YourItemType> searchResults = ...

    // Example: Filtering a list of items based on search query
    // Replace `searchResults` with your actual list of items
    // For simplicity, assuming `YourItemType` has a property `name` to search against

    // Example:
    // List<YourItemType> filteredResults = searchResults.where((item) =>
    //   item.name.toLowerCase().contains(query)
    // ).toList();

    // Return a ListView or other widget to display filteredResults
    // For instance, if `filteredResults` is a List<YourItemType>:
    // return ListView.builder(
    //   itemCount: filteredResults.length,
    //   itemBuilder: (context, index) {
    //     final item = filteredResults[index];
    //     return ListTile(
    //       title: Text(item.name),
    //       // Implement onTap to handle selection
    //     );
    //   },
    // );

    // For now, returning an empty container
    return Container();
  }
}

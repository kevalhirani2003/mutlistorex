import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomContent extends StatefulWidget {
  final String? selectedState;
  final List<String> allStates;
  final Function(String?) onStateChanged;

  CustomContent({
    required this.selectedState,
    required this.allStates,
    required this.onStateChanged,
  });

  @override
  _CustomContentState createState() => _CustomContentState();
}

class _CustomContentState extends State<CustomContent> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showStatesDialog(context);
      },
      child: Container(
        height: 10,
        width: 9,
        child: SvgPicture.asset("Assets/Icon/Plus.svg"),
      ),
    );
  }

  void _showStatesDialog(BuildContext context) {
    print('Opening StateSelectionDialog from CustomContent');
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StateSelectionDialog(
          selectedState: widget.selectedState,
          allStates: widget.allStates,
          onStateChanged: (String? newState) {
            print(
                'Updating state in CustomContent from StateSelectionDialog: $newState');
            widget.onStateChanged(newState);
          },
        );
      },
    );
  }
}

class StateSelectionDialog extends StatefulWidget {
  final String? selectedState;
  final List<String> allStates;
  final Function(String?) onStateChanged;

  StateSelectionDialog({
    required this.selectedState,
    required this.allStates,
    required this.onStateChanged,
  });

  @override
  _StateSelectionDialogState createState() => _StateSelectionDialogState();
}

class _StateSelectionDialogState extends State<StateSelectionDialog> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  List<String> getFilteredStates() {
    final searchTerm = _searchController.text.toLowerCase();
    return widget.allStates
        .where((state) => state.toLowerCase().contains(searchTerm))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                print('Searching for states in StateSelectionDialog');
                setState(() {});
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: getFilteredStates().length,
              itemBuilder: (context, index) {
                final state = getFilteredStates()[index];
                return ListTile(
                  title: Text(state),
                  onTap: () {
                    print('Selecting state in StateSelectionDialog: $state');
                    widget.onStateChanged(state);
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

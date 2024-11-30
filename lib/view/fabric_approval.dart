import 'package:flutter/material.dart';

import '../controller/fabric_aprovalController.dart';
import '../model/fabric_approvalModel.dart';

class FabricApproval extends StatefulWidget {
  const FabricApproval({super.key});

  @override
  State<FabricApproval> createState() => _FabricApprovalState();
}

class _FabricApprovalState extends State<FabricApproval> {
  fabric_approvalController fabricApprovalController = fabric_approvalController();
  TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> _data = []; // Data list for all records
  List<Map<String, String>> _filteredData = []; // For search functionality
  int _currentPage = 0; // Current page
  int _rowsPerPage = 5; // Number of rows per page

  @override
  void initState() {
    super.initState();
    _fetchData(); // Fetch data on widget initialization
    _searchController.addListener(_filterData);
  }

  // Fetch data from the API
  Future<void> _fetchData() async {
    try {
     // List<fabric_approval_model> fabricApprovalList = await fabricApprovalController.getfabric_approvalList();
      List<fabric_approval_model> fabricApprovalList =  await fabric_approvalController.getfabric_approvalList();
      setState(() {
        _data = fabricApprovalList.map((fabric) {
          return {
            "orderno": fabric.orderno ?? "",
            "party": fabric.party ?? "",
            "design": fabric.design ?? "",
            "cloth": fabric.cloth ?? "",
            "color": fabric.color ?? "",
            "qty": fabric.qty ?? "",
            "kgs": fabric.kgs ?? "",
            "approval": fabric.approval ?? "",
          };
        }).toList();
        _filteredData = _data;
      });
    } catch (e) {
      debugPrint("Error fetching data: $e");
    }
  }

  // Filter data based on search query
  void _filterData() {
    setState(() {
      String query = _searchController.text.toLowerCase();
      _filteredData = _data.where((item) {
        return item["orderno"]!.toLowerCase().contains(query) ||
            item["party"]!.toLowerCase().contains(query);
      }).toList();
      _currentPage = 0; // Reset to first page on new search
    });
  }

  // Get the data to be displayed on the current page
  List<Map<String, String>> _getCurrentPageData() {
    int startIndex = _currentPage * _rowsPerPage;
    int endIndex = startIndex + _rowsPerPage;
    return _filteredData.sublist(startIndex,
        endIndex > _filteredData.length ? _filteredData.length : endIndex);
  }

  // Handle page change
  void _nextPage() {
    if (_currentPage < (_filteredData.length / _rowsPerPage).ceil() - 1) {
      setState(() {
        _currentPage++;
      });
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      setState(() {
        _currentPage--;
      });
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Text(
                "Fabric Approval",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              width: double.infinity,
              color: Color.fromRGBO(0, 51, 51, 0.9),
              padding: EdgeInsets.all(8),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: "Enter Value To Search",
              ),
            ),
            // Data Table with alternating row colors
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                headingRowColor:
                MaterialStateColor.resolveWith((states) => Colors.blueGrey),
                columns: const <DataColumn>[
                  DataColumn(label: Text('OrderNo', style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(label: Text('Party', style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(label: Text('Design', style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(label: Text('Cloth', style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(label: Text('Color', style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(label: Text('Qty', style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(label: Text('Kgs', style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(label: Text('Approval', style: TextStyle(fontWeight: FontWeight.bold))),
                ],
                rows: _getCurrentPageData().asMap().map((index, item) {
                  // Alternating row color based on index
                  bool isEvenRow = index.isEven;
                  return MapEntry(
                    index,
                    DataRow(
                      color: MaterialStateProperty.all(
                          isEvenRow ? Colors.grey[200] : Colors.white), // Set alternating colors
                      cells: [
                        DataCell(Text(item["orderno"]!)),
                        DataCell(Text(item["party"]!)),
                        DataCell(Text(item["design"]!)),
                        DataCell(Text(item["cloth"]!)),
                        DataCell(Text(item["color"]!)),
                        DataCell(Text(item["qty"]!)),
                        DataCell(Text(item["kgs"]!)),
                        DataCell(
                          TextButton(
                            onPressed: () {
                              setState(() {
                                bool isApproved = item["approval"] == "1";
                                item["approval"] = isApproved ? "0" : "1"; // Toggle approval status
                              });
                            },
                            child: Text(item["approval"] == "1" ? 'Approved' : 'Approve'),
                          ),
                        ),
                      ],
                    ),
                  );
                }).values.toList(),
              ),
            ),
            // Pagination Controls
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: _previousPage,
                ),
                Text('Page ${_currentPage + 1} of ${(_filteredData.length / _rowsPerPage).ceil()}'),
                IconButton(
                  icon: Icon(Icons.arrow_forward),
                  onPressed: _nextPage,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

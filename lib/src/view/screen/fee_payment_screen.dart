import 'package:dodomaapp/src/view/screen/payment_receipt_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/app_color.dart';
import '../../data/database_helper.dart';
import 'menu_screen.dart';


class FeePaymentHistoryScreen extends StatefulWidget {
  @override
  FeePaymentHistory createState() => FeePaymentHistory();
}

class FeePaymentHistory extends State<FeePaymentHistoryScreen> with SingleTickerProviderStateMixin {

  late TabController _tabController;
  Map<String, dynamic>? firstStudent;
  List<Map<String, dynamic>>? fees;
  List<Map<String, dynamic>>? transactions;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _fetchFirstStudent(); // Fetch student data on screen load
  }

  Future<void> _fetchFirstStudent() async {
    List<Map<String, dynamic>> students = await DatabaseHelper.instance.getStudents();
    final prefs = await SharedPreferences.getInstance();
    String? current_student = prefs.getString('current_student');
    transactions = await DatabaseHelper.instance.getTransactions();

    fees = await DatabaseHelper.instance.getSchoolFees(int.parse(current_student!));
    print(transactions);
    firstStudent = await DatabaseHelper.instance.getStudentById(int.parse(current_student!));
    setState(() {}); // Update the UI with fetched data
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: Text(
          "Fees Payments",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.white,),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => DashboardScreen()),
            );
          },
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.notifications,color: Colors.white,),
                onPressed: () {},
              ),
              Positioned(
                right: 10,
                top: 10,
                child: CircleAvatar(
                  radius: 8,
                  backgroundColor: Colors.red,
                  child: Text(
                    "3",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Header
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.receipt_long, size: 50, color: AppColor.primaryColor),
                  ),
                  SizedBox(height: 10),
                  Text(
                    firstStudent != null ? (firstStudent!['full_name']?.toString() ?? '') : "Loading...",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Text(
                    firstStudent != null ? (firstStudent!['class_name']?.toString() ?? '') : "Loading...",
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ),

            // Tab Bar
            Container(
              color: Colors.white,
              child: TabBar(
                controller: _tabController,
                indicatorColor: Colors.black,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(text: "GENERAL INFO"),
                  Tab(text: "TRANSACTIONS"),
                ],
              ),
            ),

            Container(
              height: 705, // Fixed height to allow proper tab switching
              child: TabBarView(
                controller: _tabController,
                children: [
                  firstStudent != null ? _buildParentInfoCard(firstStudent):
                  _buildParentInfoCardNoData(),
                  // Payment List
                  transactions != null && transactions!.isNotEmpty
                      ?  ListView.builder(
      itemCount: (transactions?.length ?? 0) + 1, // +1 for header/summary
      itemBuilder: (context, index) {
        if (index == 0) {
          // First item = header, summary, etc.
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Transactions", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
            ],
          );
        }

        final transaction = transactions?[index - 1];
        String paymentTitle = "${_getOrdinal(index)} Payment";

        return PaymentCard(
          title: paymentTitle,
          date: transaction?["created_at"]?.toString() ?? '',
          amount: 'TZS ${DatabaseHelper.formatAmount(transaction?["amount"])}',
          status: 'Paid',
          color: Colors.green,
          icon: Icons.check_circle,
          transaction_id: transaction?["transaction_id"]?.toString() ?? '',
          full_name: transaction?["full_name"]?.toString() ?? '',
          account_number: transaction?["account_number"]?.toString() ?? '',
        );
      },
    )


    : _buildParentInfoCardNoData(),

                ],
              ),
            ),
          ],
        ),
      ),

    );
  }

  String _getOrdinal(int number) {
    if (number >= 11 && number <= 13) {
      return "${number}th";
    }
    switch (number % 10) {
      case 1:
        return "${number}st";
      case 2:
        return "${number}nd";
      case 3:
        return "${number}rd";
      default:
        return "${number}th";
    }
  }
  Widget _buildParentInfoCard(Map<String, dynamic>? student) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: fees?.length,
          itemBuilder: (context, index) {
            final fee = fees?[index];
            return _infoTile(
                    icon: Icons.person,
                    title: fee?['fee_name']?.toString() ?? 'Loading...',
                    subtitle: DatabaseHelper.formatAmount(fee?['fees_amount']),
                    paid_amount: DatabaseHelper.formatAmount(fee?['paid_amount']),
                    remained_amount: DatabaseHelper.formatAmount(fee?['remained_amount'])
                  );

          },
        ),

      ),
    );
  }


  Widget _buildParentInfoCardNoData() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 1,
          itemBuilder: (context, index) {
            return _infoTileNoData(
                icon: Icons.info,
                title: 'No Data Found',
                subtitle: '',
                paid_amount:'',
                remained_amount:''
            );

          },
        ),

      ),
    );
  }

  Widget _infoTile({required IconData icon, required String title, required String subtitle, required String paid_amount, required String remained_amount}) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.grey[200],
        child: Icon(icon, size: 28, color: AppColor.primaryColor),
      ),
      title: Text(
        title,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
      subtitle: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total Amount'),
              Text('TZS $subtitle', style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Paid Amount'),
              Text('TZS $paid_amount', style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Remained Amount'),
              Text('TZS $remained_amount', style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold))
            ],
          )
        ],
      ),
    );
  }

  Widget _infoTileNoData({required IconData icon, required String title, required String subtitle, required String paid_amount, required String remained_amount}) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.grey[200],
        child: Icon(icon, size: 28, color: AppColor.primaryColor),
      ),
      title: Text(
        title,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
      subtitle: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

            ],
          ),

        
        ],
      ),
    );
  }

}

// Payment Card Widget
class PaymentCard extends StatelessWidget {
  final String title;
  final String date;
  final String amount;
  final String status;
  final Color color;
  final IconData icon;
  final String transaction_id;
  final String full_name;
  final String account_number;

  PaymentCard({
    required this.title,
    required this.date,
    required this.amount,
    required this.status,
    required this.color,
    required this.icon,
    required this.transaction_id,
    required this.full_name,
    required this.account_number,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color,
          radius: 25,
          child: Icon(icon, color: Colors.white, size: 30),
        ),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text("$date\nAmount: $amount"),
        trailing: Text(
          status,
          style: TextStyle(fontWeight: FontWeight.bold, color: color),
        ),
        isThreeLine: true,
        onTap: () {
          // Navigate to Payment Details Screen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PaymentReceiptScreen(transaction_id),
            ),
          );
        },
      ),
    );
  }
}
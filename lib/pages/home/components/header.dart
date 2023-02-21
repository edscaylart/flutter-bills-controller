import 'package:bills_control_flutter/constants.dart';
import 'package:bills_control_flutter/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  late String userName = '';
  var _loading = true;

  Future<void> _getProfile() async {
    var fullName = '';
    try {
      final userId = supabase.auth.currentUser!.id;
      final data = await supabase
          .from('profiles')
          .select()
          .eq('id', userId)
          .single() as Map;
      fullName = data['full_name'];
    } on PostgrestException catch (error) {
      context.showErrorSnackBar(message: error.message);
    } catch (error) {
      context.showErrorSnackBar(message: 'Unexpected exception occurred');
    }
    setState(() {
      userName = fullName;
      _loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: getProportionalScreenHeight(20)),
      child: Row(
        children: [
          Text(_loading ? 'Loading...' : "Hello $userName"),
          const Spacer(),
          const Text('February')
        ],
      ),
    );
  }
}

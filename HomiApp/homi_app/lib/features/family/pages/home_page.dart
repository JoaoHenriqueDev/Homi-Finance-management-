import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/group_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<GroupProvider>().loadGroups();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<GroupProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Grupos'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, '/create-group');
            },
          ),
        ],
      ),
      body: provider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: provider.groups.length,
              itemBuilder: (_, index) {
                final group = provider.groups[index];

                return ListTile(
                  title: Text(group.name),
                  subtitle: Text(group.description ?? ''),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/group-details',
                      arguments: group.id,
                    );
                  },
                );
              },
            ),
    );
  }
}

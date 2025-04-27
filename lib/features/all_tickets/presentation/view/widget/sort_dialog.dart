import 'package:admin_app/features/all_tickets/presentation/view_model/cubit/ticket_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../../../core/widget/drop_down_text_field.dart';
import '../../../../add_record/data/model/record_model.dart';
import '../../../../add_record/presentation/view_model/cubit/all_record_cubit.dart';

class SortDialog extends StatefulWidget {
  const SortDialog({super.key});

  @override
  SortDialogState createState() => SortDialogState();
}

class SortDialogState extends State<SortDialog> {
  final TextEditingController fromController = TextEditingController();
  final TextEditingController toController = TextEditingController();
  int? selectedServiceId;
  RecordModel? selectedRecord;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      setState(() {
        fromController.text = DateFormat('yyyy-MM-dd').format(picked);
        toController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Filter Tickets"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () => _selectDate(context),
            child: AbsorbPointer(
              child: TextField(
                controller: fromController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                  labelText: "from",
                  suffixIcon: const Icon(Icons.calendar_today),
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          GestureDetector(
            onTap: () => _selectDate(context),
            child: AbsorbPointer(
              child: TextField(
                controller: toController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                  labelText: "to",
                  suffixIcon: const Icon(Icons.calendar_today),
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          BlocBuilder<AllRecordCubit, AllRecordState>(
            builder: (context, state) {
              if (state is FetchAllRecordsLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is FetchAllRecordsFailure) {
                return Text(state.errMessage);
              } else if (state is FetchAllRecordsSuccess) {
                return DropdownTextField(
                  records: state.records,
                  selectedRecord: selectedRecord,
                  onChanged: (record) {
                    setState(() {
                      selectedRecord = record;
                      selectedServiceId = record.id;
                    });
                  },
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            String from = fromController.text;
            String to = toController.text;
            int serviceId = selectedServiceId ?? 0;
            context
                .read<TicketCubit>()
                .fetchSortedTickets(from: from, to: to, serviceId: serviceId);
            Navigator.of(context).pop();
          },
          child: const Text("Apply"),
        ),
        TextButton(
          onPressed: () {
            context.read<TicketCubit>().fetchTickets();
            Navigator.of(context).pop();
          },
          child: const Text("Show All"),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text("Cancel"),
        ),
      ],
    );
  }
}

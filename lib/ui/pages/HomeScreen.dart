import 'package:dar_sudan/blocs/PhotoBloc.dart';
import 'package:dar_sudan/blocs/PhotoEvent.dart';
import 'package:dar_sudan/blocs/PhotoState.dart';
import 'package:dar_sudan/models/empl.dart';
import 'package:dar_sudan/resources/network_exceptions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  @override
  void initState() {
    context.bloc<PhotoBloc>().add(LoadMovies());
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        title: Text("Movies"),
      ),
      body: BlocBuilder<PhotoBloc, PhotoState<List<Employee>>>(
        builder: (BuildContext context, PhotoState<List<Employee>> state) {
          return state.when(
            loading: () {
              return Center(child: CircularProgressIndicator(backgroundColor: Colors.white,));
            },
            idle: () {
              return Container();
            },
            data: (List<Employee> data) {
              return dataWidget(data);
            },
            error: (NetworkExceptions error) {
              return Center(child: Text(NetworkExceptions.getErrorMessage(error),style: TextStyle(fontSize: 18),));
            },
          );
        },
      ),
    );
  }
  Widget dataWidget(List<Employee> data) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 300,
          width: 300,
          child: Card(
            elevation: 1,
            child: Text(data[index].data[index].employeeName),
          ),
        );
      },
    );
  }
}

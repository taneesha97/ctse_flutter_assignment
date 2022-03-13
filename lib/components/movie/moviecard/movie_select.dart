import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../models/movie_select_model.dart';

class SelectableMovie extends StatefulWidget {
  final SelectedMovieModel selectedMovieModel;
  final List<SelectedMovieModel> selectedMoviesListRef;

  const SelectableMovie(
      {Key? key,
      required this.selectedMovieModel,
      required this.selectedMoviesListRef})
      : super(key: key);

  @override
  State<SelectableMovie> createState() => _SelectableMovieState();
}

class _SelectableMovieState extends State<SelectableMovie> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.green[700],
        child: Icon(
          Icons.person_outline_outlined,
          color: Colors.white,
        ),
      ),
      title: Text(
        widget.selectedMovieModel.title,
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
      subtitle: Text(widget.selectedMovieModel.year.toString()),
      trailing: widget.selectedMovieModel.isSelected
          ? Icon(
        Icons.check_circle,
        color: Colors.green[700],
      ) : Icon(
        Icons.check_circle_outline,
        color: Colors.grey,
      ),
      onTap:((){
        setState(() {
            widget.selectedMovieModel.isSelected = !widget.selectedMovieModel.isSelected;
            if(widget.selectedMovieModel.isSelected == true){
              widget.selectedMoviesListRef.add(widget.selectedMovieModel);
            } else if (widget.selectedMovieModel.isSelected == false){
              widget.selectedMoviesListRef.removeWhere((element) =>element.title == widget.selectedMovieModel.title);
            }
        });
      }),
    );
  }
}

abstract class TodoState {}

class InitState extends TodoState{}

class ListModifiedState extends TodoState{
  ListModifiedState();
}
// add whatever state you need to
part of 'test_cubit.dart';

@immutable
abstract class TestState {}

class TestInitial extends TestState {}
class TestLoaded extends TestState {
final  List<Posts>posts;

TestLoaded(this.posts);
}
class TestLoading extends TestState {



}
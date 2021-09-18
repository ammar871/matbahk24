import 'package:bloc/bloc.dart';

import 'package:matbahk24/examples/posts.dart';
import 'package:matbahk24/examples/repository/testing_repository.dart';
import 'package:meta/meta.dart';

part 'test_state.dart';

class TestCubit extends Cubit<TestState> {
  final TestingRepository testingRepository;
  List<Posts> postsData = [];

  TestCubit(this.testingRepository) : super(TestInitial());

  Future<List<Posts>> getAllCharacters(String phone) async {
    emit(TestLoading());
    testingRepository.getAllCharacters(phone).then((value) {
      emit(TestLoaded(value));
      print(value.length);
      this.postsData = value;
    });

    return postsData;
  }
}

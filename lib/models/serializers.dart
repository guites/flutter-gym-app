import 'package:built_value/standard_json_plugin.dart';
import 'package:built_value/serializer.dart';
import 'package:workout_app/models/exercise.dart';

part 'serializers.g.dart';

@SerializersFor([
  Exercise,
])
final Serializers serializers = (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
import 'package:objectbox/objectbox.dart';

@Entity()
class Classes {
  @Id()
  int? id;
   String? className;
   double? price;
   int? sessionsCount;

  Classes({
    this.id,
    this.className,
    this.price,
    this.sessionsCount,
  });
}

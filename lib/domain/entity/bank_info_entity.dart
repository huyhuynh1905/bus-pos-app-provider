import 'package:json_annotation/json_annotation.dart';
import 'package:objectbox/objectbox.dart';

part 'bank_info_entity.g.dart';

@JsonSerializable()
@Entity()
class BankInfoEntity {

  @Id()
  int? localId;

  String? code;
  @JsonKey(name: "ben_id")
  String? benId;
  @JsonKey(name: "bank_bin")
  String? bankBin;
  @JsonKey(name: "short_name")
  String? shortName;

  BankInfoEntity({
    this.localId,
    this.code,
    this.benId,
    this.bankBin,
    this.shortName,
  });

  factory BankInfoEntity.fromJson(Map<String, dynamic> json) => _$BankInfoEntityFromJson(json);

  Map<String, dynamic> toJson() => _$BankInfoEntityToJson(this);
}

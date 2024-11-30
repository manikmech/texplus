class fabric_approval_model
{
  String? id;
  String? orderno;
  String? process;
  String? party;
  String? design;
  String? cloth;
  String? color;
  String? qty;
  String? kgs;
  String? approval;
  fabric_approval_model({
      this.id,this.orderno,this.process,this.party,this.design,
      this.cloth,this.color,this.qty,this.kgs,this.approval
  } );
  factory fabric_approval_model.fromJson(Map<String, dynamic> json) {
    return fabric_approval_model(
      id: json['id'],
      orderno: json['orderno'],
      process: json['process'],
      party: json['party'],
      design: json['design'],
      cloth: json['cloth'],
      color: json['color'],
      qty: json['qty'],
      kgs: json['kgs'],
      approval: json['approval'],
    );
  }
}
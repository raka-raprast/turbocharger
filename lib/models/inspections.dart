enum InspectionType { holset, garret }

class Inspection {
  final InspectionType type;
  final String customerName;
  final String customerAddress;
  final String att;
  final String custReff;
  final String sjNumber;
  final String quoteNumber;
  final String componentMake;
  final String partNumber;
  final String serialNumber;
  final String quotationYear;
  final String quotationMonth;
  final String quotationDate;
  final String cardId;
  final String unitNumber;
  final String model;

  Inspection({
    required this.type,
    this.customerName = "",
    this.customerAddress = "",
    this.att = "",
    this.custReff = "",
    this.sjNumber = "",
    this.quoteNumber = "",
    this.componentMake = "",
    this.partNumber = "",
    this.serialNumber = "",
    this.quotationYear = "",
    this.quotationMonth = "",
    this.quotationDate = "",
    this.cardId = "",
    this.unitNumber = "",
    this.model = "",
  });
}

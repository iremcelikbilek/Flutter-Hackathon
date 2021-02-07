class Record {
  int id;
  String title;
  String body;
  String disctrictID;
  String userID;
  String recordType;
  String recordDomainName;

  Record.forAdd(this.title, this.body, this.recordType, this.recordDomainName);

  Record();

  Map toJsonAdd() {
    return {
      "title": title,
      "body": body,
      "recordType": recordType,
      "domain": recordDomainName
    };
  }

  Record.fromJson(Map map) :
      title = map["title"],
      body = map["body"],
      recordDomainName = map["domain"],
      recordType = map["record_type"];
}

class Record {
  int id;
  String title;
  String body;
  String disctrictID;
  String userID;
  String recordType;
  String recordDomainName;

  Record.forAdd(this.id, this.title, this.body, this.disctrictID, this.userID,
      this.recordType, this.recordDomainName);

  Record();
}

@RestResource(urlMapping='/v1/createContact/')
global class createContact {
  @httpPost
  global static Contact doPostMethod(
    String accName,
    String conName,
    String[] accounts
  ) {
    system.debug('accounts' + accounts);

    ID accID;
    List<Account> accList = [
      SELECT id
      FROM Account
      WHERE Name LIKE :accName
      LIMIT 1
    ];

    if (accList.size() > 0) {
      accID = accList[0].id;
    } else {
      Account acc = new Account();
      acc.Name = accName;
      insert acc;
      accID = acc.Id;
    }

    Contact con = new Contact();
    con.LastName = conName;
    con.AccountId = accId;
    insert con;
    return con;
  }
}

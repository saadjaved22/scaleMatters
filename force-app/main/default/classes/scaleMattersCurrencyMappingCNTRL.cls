public class scaleMattersCurrencyMappingCNTRL {
  //checking if currency mapping record exists in custom settings, if not create one
  public void createCurrencyMapping() {
    List<scaleMatters__Run_Triggers__c> permissionCS = [
      SELECT scaleMatters__Name__c
      FROM scaleMatters__Run_Triggers__c
      WHERE
        scaleMatters__Name__c LIKE 'scaleMatters Run Triggers'
        AND isDeleted = FALSE
    ];

    if (permissionCS.size() == 0) {
      scaleMatters__Run_Triggers__c permissionsObj = new scaleMatters__Run_Triggers__c();
      permissionsObj.scaleMatters__Name__c = 'scaleMatters Run Triggers';
      insert permissionsObj;
    }

    List<scaleMatters__CurrencyMapping__c> cmd = [
      SELECT scaleMatters__Name__c
      FROM scaleMatters__CurrencyMapping__c
      WHERE
        scaleMatters__Name__c LIKE 'scaleMatters Currency Mapping Record'
        AND isDeleted = FALSE
    ];
    if (cmd.size() == 0) {
      scaleMatters__CurrencyMapping__c cs = new scaleMatters__CurrencyMapping__c();
      cs.scaleMatters__Name__c = 'scaleMatters Currency Mapping Record';
      insert cs;
    }
  }

  //methods used to query all currency field on Opportunity Object and insert in DropDown
  public List<String> currencyList { get; set; }
  public static List<String> getCurrencyFields() {
    List<String> cFList = new List<String>();
    String SobjectApiName = 'Opportunity';
    Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
    Map<String, Schema.SObjectField> fieldMap = schemaMap.get(SobjectApiName)
      .getDescribe()
      .fields.getMap();
    for (String fieldName : fieldMap.keyset()) {
      String fieldLabel = fieldMap.get(fieldName).getDescribe().getName();
      Schema.DisplayType fielddataType = fieldMap.get(fieldName)
        .getDescribe()
        .getType();

      if (String.valueOf(fielddataType) == 'CURRENCY') {
        cFList.add(fieldLabel);
      }
    }

    return cFList;
  }
  public String Items { set; }
  public List<SelectOption> getItems() {
    List<SelectOption> options = new List<SelectOption>();
    List<String> strList = new List<String>{ 'None' };

    currencyList = getCurrencyFields();
    currencyList.add(0, 'None');

    for (String cur : currencyList) {
      options.add(new SelectOption(cur, cur));
    }

    return options;
  }

  //all methods which are used to set Field 1 Mapping
  public String smMapping1;
  public String getsmMapping1() {
    return smMapping1;
  }
  public void setsmMapping1(String smMapping1) {
    this.smMapping1 = smMapping1;
  }
  public void currencyField1Mapping() {
    List<scaleMatters__CurrencyMapping__c> cmd = [
      SELECT scaleMatters__Currency_Field_1_Mapping__c
      FROM scaleMatters__CurrencyMapping__c
      WHERE
        scaleMatters__Name__c LIKE 'scaleMatters Currency Mapping Record'
        AND isDeleted = FALSE
    ];
    cmd[0].scaleMatters__Currency_Field_1_Mapping__c = smMapping1;

    update cmd;
  }

  //all methods which are used to set Field 2 Mapping
  public String smMapping2;
  public String getsmMapping2() {
    return smMapping2;
  }
  public void setsmMapping2(String smMapping2) {
    this.smMapping2 = smMapping2;
  }
  public void currencyField2Mapping() {
    List<scaleMatters__CurrencyMapping__c> cmd = [
      SELECT scaleMatters__Currency_Field_2_Mapping__c
      FROM scaleMatters__CurrencyMapping__c
      WHERE
        scaleMatters__Name__c LIKE 'scaleMatters Currency Mapping Record'
        AND isDeleted = FALSE
    ];
    cmd[0].scaleMatters__Currency_Field_2_Mapping__c = smMapping2;

    update cmd;
  }

  //all methods used to set Field 3 Mapping
  public String smMapping3;
  public String getsmMapping3() {
    return smMapping3;
  }
  public void setsmMapping3(String smMapping3) {
    this.smMapping3 = smMapping3;
  }
  public void currencyField3Mapping() {
    List<scaleMatters__CurrencyMapping__c> cmd = [
      SELECT scaleMatters__Currency_Field_3_Mapping__c
      FROM scaleMatters__CurrencyMapping__c
      WHERE
        scaleMatters__Name__c LIKE 'scaleMatters Currency Mapping Record'
        AND isDeleted = FALSE
    ];
    cmd[0].scaleMatters__Currency_Field_3_Mapping__c = smMapping3;
    update cmd;
  }

  //all methods used to set Field 4 Mapping
  public String smMapping4;
  public String getsmMapping4() {
    return smMapping4;
  }
  public void setsmMapping4(String smMapping4) {
    this.smMapping4 = smMapping4;
  }
  public void currencyField4Mapping() {
    List<scaleMatters__CurrencyMapping__c> cmd = [
      SELECT scaleMatters__Currency_Field_4_Mapping__c
      FROM scaleMatters__CurrencyMapping__c
      WHERE
        scaleMatters__Name__c LIKE 'scaleMatters Currency Mapping Record'
        AND isDeleted = FALSE
    ];
    cmd[0].scaleMatters__Currency_Field_4_Mapping__c = smMapping4;
    update cmd;
  }

  //all methods used to set Field 5 Mapping
  public String smMapping5;
  public String getsmMapping5() {
    return smMapping5;
  }
  public void setsmMapping5(String smMapping5) {
    this.smMapping5 = smMapping5;
  }
  public void currencyField5Mapping() {
    List<scaleMatters__CurrencyMapping__c> cmd = [
      SELECT scaleMatters__Currency_Field_5_Mapping__c
      FROM scaleMatters__CurrencyMapping__c
      WHERE
        scaleMatters__Name__c LIKE 'scaleMatters Currency Mapping Record'
        AND isDeleted = FALSE
    ];
    cmd[0].scaleMatters__Currency_Field_5_Mapping__c = smMapping5;
    update cmd;
  }

  //all Methods used to set Field 6 Mapping
  public String smMapping6;
  public String getsmMapping6() {
    return smMapping6;
  }
  public void setsmMapping6(String smMapping6) {
    this.smMapping6 = smMapping6;
  }
  public void currencyField6Mapping() {
    List<scaleMatters__CurrencyMapping__c> cmd = [
      SELECT scaleMatters__Currency_Field_6_Mapping__c
      FROM scaleMatters__CurrencyMapping__c
      WHERE
        scaleMatters__Name__c LIKE 'scaleMatters Currency Mapping Record'
        AND isDeleted = FALSE
    ];
    cmd[0].scaleMatters__Currency_Field_6_Mapping__c = smMapping6;
    update cmd;
  }

  //all Method used to set Field 7 Mapping
  public String smMapping7;
  public String getsmMapping7() {
    return smMapping7;
  }
  public void setsmMapping7(String smMapping7) {
    this.smMapping7 = smMapping7;
  }
  public void currencyField7Mapping() {
    List<scaleMatters__CurrencyMapping__c> cmd = [
      SELECT scaleMatters__Currency_Field_7_Mapping__c
      FROM scaleMatters__CurrencyMapping__c
      WHERE
        scaleMatters__Name__c LIKE 'scaleMatters Currency Mapping Record'
        AND isDeleted = FALSE
    ];
    cmd[0].scaleMatters__Currency_Field_7_Mapping__c = smMapping7;
    update cmd;
  }

  //all Methods used to set Field 8 Mapping
  public String smMapping8;
  public String getsmMapping8() {
    return smMapping8;
  }
  public void setsmMapping8(String smMapping8) {
    this.smMapping8 = smMapping8;
  }
  public void currencyField8Mapping() {
    List<scaleMatters__CurrencyMapping__c> cmd = [
      SELECT scaleMatters__Currency_Field_8_Mapping__c
      FROM scaleMatters__CurrencyMapping__c
      WHERE
        scaleMatters__Name__c LIKE 'scaleMatters Currency Mapping Record'
        AND isDeleted = FALSE
    ];
    cmd[0].scaleMatters__Currency_Field_8_Mapping__c = smMapping8;
    update cmd;
  }
}

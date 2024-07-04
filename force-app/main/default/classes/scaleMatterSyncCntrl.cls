public class scaleMatterSyncCntrl {
  public String condition;
  public void setcondition(String condition) {
    this.condition = condition;
  }
  public String getcondition() {
    String conditions = '';

    List<scaleMatters__Sync_Mapping__c> smList = [
      SELECT scaleMatters__Sync_Mapping__c
      FROM scaleMatters__Sync_Mapping__c
      WHERE scaleMatters__Name__c LIKE 'scaleMatters Sync Mapping'
    ];

    if (smList.size() > 0) {
      conditions = smList[0].scaleMatters__Sync_Mapping__c;
    }

    return conditions;
  }

  public List<String> filtersList { get; set; }

  public String filterType { set; }
  public List<SelectOption> getfilterType() {
    List<SelectOption> selectoptions = new List<SelectOption>();
    List<String> fList = new List<String>();
    fList.add('SOQL Condition');
    fList.add('Filter Condition');

    for (String operator : fList) {
      selectoptions.add(new SelectOption(operator, operator));
    }

    return selectoptions;
  }

  public String smFilter;
  public String getsmFilter() {
    return smFilter;
  }
  public void setsmFilter(String smFilter) {
    this.smFilter = smFilter;
  }

  public void updateFilterMapping() {
    List<scaleMatters__Sync_Mapping__c> smList = [
      SELECT scaleMatters__Filter_Type__c
      FROM scaleMatters__Sync_Mapping__c
      WHERE scaleMatters__Name__c LIKE 'scaleMatters Sync Mapping'
    ];
    if (smList.size() > 0) {
      smList[0].scaleMatters__Filter_Type__c = smFilter;
      update smList;
    }
  }

  public void createSyncMapping() {
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

    List<scaleMatters__Sync_Mapping__c> smList = [
      SELECT scaleMatters__Name__c
      FROM scaleMatters__Sync_Mapping__c
      WHERE scaleMatters__Name__c LIKE 'scaleMatters Sync Mapping'
    ];
    if (smList.size() == 0) {
      scaleMatters__Sync_Mapping__c sm = new scaleMatters__Sync_Mapping__c();
      sm.scaleMatters__Name__c = 'scaleMatters Sync Mapping';
      sm.scaleMatters__Filter_1_Mapping__c = '-';
      sm.scaleMatters__Filter_1_Mapping__c = '-';
      sm.scaleMatters__Filter_2_Mapping__c = '-';
      sm.scaleMatters__Filter_3_Mapping__c = '-';
      sm.scaleMatters__Filter_4_Mapping__c = '-';
      sm.scaleMatters__Filter_5_Mapping__c = '-';
      sm.scaleMatters__Filter_6_Mapping__c = '-';
      sm.scaleMatters__Filter_7_Mapping__c = '-';
      sm.scaleMatters__Filter_8_Mapping__c = '-';
      sm.scaleMatters__Filter_9_Mapping__c = '-';
      sm.scaleMatters__Filter_10_Mapping__c = '-';
      sm.scaleMatters__Filter_11_Mapping__c = '-';
      sm.scaleMatters__Filter_12_Mapping__c = '-';
      sm.scaleMatters__Filter_13_Mapping__c = '-';
      sm.scaleMatters__Filter_14_Mapping__c = '-';
      sm.scaleMatters__Filter_15_Mapping__c = '-';
      sm.scaleMatters__Filter_16_Mapping__c = '-';
      sm.scaleMatters__Filter_17_Mapping__c = '-';
      sm.scaleMatters__Filter_18_Mapping__c = '-';
      sm.scaleMatters__Filter_19_Mapping__c = '-';
      sm.scaleMatters__Filter_20_Mapping__c = '-';
      sm.scaleMatters__Filter_21_Mapping__c = '-';
      sm.scaleMatters__Filter_22_Mapping__c = '-';
      sm.scaleMatters__Filter_23_Mapping__c = '-';
      sm.scaleMatters__Filter_24_Mapping__c = '-';
      sm.scaleMatters__Filter_25_Mapping__c = '-';

      insert sm;
    }
  }

  public void updateSyncMapping() {
    List<scaleMatters__Sync_Mapping__c> smList = [
      SELECT scaleMatters__Name__c
      FROM scaleMatters__Sync_Mapping__c
      WHERE scaleMatters__Name__c LIKE 'scaleMatters Sync Mapping'
    ];
    if (smList.size() > 0) {
      smList[0].scaleMatters__Sync_Mapping__c = condition;
      update smList;
    }
  }

  //methods used to query all fields on Opportunity Object and insert in DropDown
  public List<String> fieldsList { get; set; }
  public static List<String> getFieldsList() {
    List<String> cFList = new List<String>();
    String SobjectApiName = 'Opportunity';
    Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
    Map<String, Schema.SObjectField> fieldMap = schemaMap.get(SobjectApiName)
      .getDescribe()
      .fields.getMap();
    for (String fieldName : fieldMap.keyset()) {
      //It provides to get the object fields label.

      cFList.add(fieldMap.get(fieldName).getDescribe().getName());
    }

    return cFList;
  }
  public String fields { set; }
  public List<SelectOption> getfields() {
    List<SelectOption> options = new List<SelectOption>();
    List<String> strList = new List<String>{ 'None' };

    fieldsList = getFieldsList();
    fieldsList.add(0, 'None');

    for (String cur : fieldsList) {
      options.add(new SelectOption(cur, cur));
    }

    return options;
  }

  //methods used for adding all values in operator dropdown

  public String oprtrs { set; }
  public List<SelectOption> getoprtrs() {
    List<SelectOption> selectoptions = new List<SelectOption>();
    List<String> operatorList = new List<String>();
    operatorList.add('=');
    operatorList.add('!=');
    operatorList.add('>');
    operatorList.add('<');
    operatorList.add('>=');
    operatorList.add('<=');
    operatorList.add('LIKE');

    for (String operator : operatorList) {
      selectoptions.add(new SelectOption(operator, operator));
    }

    return selectoptions;
  }

  //all methods which are used to set Field 1 Mapping
  public String smMapping1;
  public String getsmMapping1() {
    return smMapping1;
  }
  public void setsmMapping1(String smMapping1) {
    this.smMapping1 = smMapping1;
  }

  public String smMapping1Operator;
  public String getsmMapping1Operator() {
    return smMapping1Operator;
  }
  public void setsmMapping1Operator(String smMapping1Operator) {
    this.smMapping1Operator = smMapping1Operator;
  }

  public String smMapping1Value;
  public String getsmMapping1Value() {
    return smMapping1Value;
  }
  public void setsmMapping1Value(String smMapping1Value) {
    this.smMapping1Value = smMapping1Value;
  }

  public void field1Mapping() {
    List<scaleMatters__Sync_Mapping__c> cmd = [
      SELECT scaleMatters__Filter_1_Mapping__c
      FROM scaleMatters__Sync_Mapping__c
      WHERE
        scaleMatters__Name__c LIKE 'scaleMatters Sync Mapping'
        AND isDeleted = FALSE
    ];
    cmd[0].scaleMatters__Filter_1_Mapping__c =
      smMapping1 +
      ' ' +
      smMapping1Operator +
      ' ' +
      ' %' +
      smMapping1Value.replace(' ', '$') +
      '%';

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

  public String smMapping2Operator;
  public String getsmMapping2Operator() {
    return smMapping2Operator;
  }
  public void setsmMapping2Operator(String smMapping2Operator) {
    this.smMapping2Operator = smMapping2Operator;
  }

  public String smMapping2Value;
  public String getsmMapping2Value() {
    return smMapping2Value;
  }
  public void setsmMapping2Value(String smMapping2Value) {
    this.smMapping2Value = smMapping2Value;
  }

  public void field2Mapping() {
    List<scaleMatters__Sync_Mapping__c> cmd = [
      SELECT scaleMatters__Filter_2_Mapping__c
      FROM scaleMatters__Sync_Mapping__c
      WHERE
        scaleMatters__Name__c LIKE 'scaleMatters Sync Mapping'
        AND isDeleted = FALSE
    ];
    cmd[0].scaleMatters__Filter_2_Mapping__c =
      smMapping2 +
      ' ' +
      smMapping2Operator +
      ' %' +
      smMapping2Value.replace(' ', '$') +
      '%';

    update cmd;
  }

  //all methods which are used to set Field 3 Mapping
  public String smMapping3;
  public String getsmMapping3() {
    return smMapping3;
  }
  public void setsmMapping3(String smMapping3) {
    this.smMapping3 = smMapping3;
  }

  public String smMapping3Operator;
  public String getsmMapping3Operator() {
    return smMapping3Operator;
  }
  public void setsmMapping3Operator(String smMapping3Operator) {
    this.smMapping3Operator = smMapping3Operator;
  }

  public String smMapping3Value;
  public String getsmMapping3Value() {
    return smMapping3Value;
  }
  public void setsmMapping3Value(String smMapping3Value) {
    this.smMapping3Value = smMapping3Value;
  }

  public void field3Mapping() {
    List<scaleMatters__Sync_Mapping__c> cmd = [
      SELECT scaleMatters__Filter_3_Mapping__c
      FROM scaleMatters__Sync_Mapping__c
      WHERE
        scaleMatters__Name__c LIKE 'scaleMatters Sync Mapping'
        AND isDeleted = FALSE
    ];
    cmd[0].scaleMatters__Filter_3_Mapping__c =
      smMapping3 +
      ' ' +
      smMapping3Operator +
      ' %' +
      smMapping3Value.replace(' ', '$') +
      '%';

    update cmd;
  }

  //all methods which are used to set Field 4 Mapping
  public String smMapping4;
  public String getsmMapping4() {
    return smMapping4;
  }
  public void setsmMapping4(String smMapping4) {
    this.smMapping4 = smMapping4;
  }

  public String smMapping4Operator;
  public String getsmMapping4Operator() {
    return smMapping4Operator;
  }
  public void setsmMapping4Operator(String smMapping4Operator) {
    this.smMapping4Operator = smMapping4Operator;
  }

  public String smMapping4Value;
  public String getsmMapping4Value() {
    return smMapping4Value;
  }
  public void setsmMapping4Value(String smMapping4Value) {
    this.smMapping4Value = smMapping4Value;
  }

  public void field4Mapping() {
    List<scaleMatters__Sync_Mapping__c> cmd = [
      SELECT scaleMatters__Filter_4_Mapping__c
      FROM scaleMatters__Sync_Mapping__c
      WHERE
        scaleMatters__Name__c LIKE 'scaleMatters Sync Mapping'
        AND isDeleted = FALSE
    ];
    cmd[0].scaleMatters__Filter_4_Mapping__c =
      smMapping4 +
      ' ' +
      smMapping4Operator +
      ' %' +
      smMapping4Value.replace(' ', '$') +
      '%';

    update cmd;
  }

  //all methods which are used to set Field 5 Mapping
  public String smMapping5;
  public String getsmMapping5() {
    return smMapping5;
  }
  public void setsmMapping5(String smMapping5) {
    this.smMapping5 = smMapping5;
  }

  public String smMapping5Operator;
  public String getsmMapping5Operator() {
    return smMapping5Operator;
  }
  public void setsmMapping5Operator(String smMapping5Operator) {
    this.smMapping5Operator = smMapping5Operator;
  }

  public String smMapping5Value;
  public String getsmMapping5Value() {
    return smMapping5Value;
  }
  public void setsmMapping5Value(String smMapping5Value) {
    this.smMapping5Value = smMapping5Value;
  }

  public void field5Mapping() {
    List<scaleMatters__Sync_Mapping__c> cmd = [
      SELECT scaleMatters__Filter_5_Mapping__c
      FROM scaleMatters__Sync_Mapping__c
      WHERE
        scaleMatters__Name__c LIKE 'scaleMatters Sync Mapping'
        AND isDeleted = FALSE
    ];
    cmd[0].scaleMatters__Filter_5_Mapping__c =
      smMapping5 +
      ' ' +
      smMapping5Operator +
      ' ' +
      smMapping5Value;

    update cmd;
  }

  //all methods which are used to set Field 6 Mapping
  public String smMapping6;
  public String getsmMapping6() {
    return smMapping6;
  }
  public void setsmMapping6(String smMapping6) {
    this.smMapping6 = smMapping6;
  }

  public String smMapping6Operator;
  public String getsmMapping6Operator() {
    return smMapping6Operator;
  }
  public void setsmMapping6Operator(String smMapping6Operator) {
    this.smMapping6Operator = smMapping6Operator;
  }

  public String smMapping6Value;
  public String getsmMapping6Value() {
    return smMapping6Value;
  }
  public void setsmMapping6Value(String smMapping6Value) {
    this.smMapping6Value = smMapping6Value;
  }

  public void field6Mapping() {
    List<scaleMatters__Sync_Mapping__c> cmd = [
      SELECT scaleMatters__Filter_6_Mapping__c
      FROM scaleMatters__Sync_Mapping__c
      WHERE
        scaleMatters__Name__c LIKE 'scaleMatters Sync Mapping'
        AND isDeleted = FALSE
    ];
    cmd[0].scaleMatters__Filter_6_Mapping__c =
      smMapping6 +
      ' ' +
      smMapping6Operator +
      ' ' +
      smMapping6Value;

    update cmd;
  }

  //all methods which are used to set Field 7 Mapping
  public String smMapping7;
  public String getsmMapping7() {
    return smMapping7;
  }
  public void setsmMapping7(String smMapping7) {
    this.smMapping7 = smMapping7;
  }

  public String smMapping7Operator;
  public String getsmMapping7Operator() {
    return smMapping7Operator;
  }
  public void setsmMapping7Operator(String smMapping7Operator) {
    this.smMapping7Operator = smMapping7Operator;
  }

  public String smMapping7Value;
  public String getsmMapping7Value() {
    return smMapping7Value;
  }
  public void setsmMapping7Value(String smMapping7Value) {
    this.smMapping7Value = smMapping7Value;
  }

  public void field7Mapping() {
    List<scaleMatters__Sync_Mapping__c> cmd = [
      SELECT scaleMatters__Filter_7_Mapping__c
      FROM scaleMatters__Sync_Mapping__c
      WHERE
        scaleMatters__Name__c LIKE 'scaleMatters Sync Mapping'
        AND isDeleted = FALSE
    ];
    cmd[0].scaleMatters__Filter_7_Mapping__c =
      smMapping7 +
      ' ' +
      smMapping7Operator +
      ' ' +
      smMapping7Value;

    update cmd;
  }

  //all methods which are used to set Field 8 Mapping
  public String smMapping8;
  public String getsmMapping8() {
    return smMapping8;
  }
  public void setsmMapping8(String smMapping8) {
    this.smMapping8 = smMapping8;
  }

  public String smMapping8Operator;
  public String getsmMapping8Operator() {
    return smMapping8Operator;
  }
  public void setsmMapping8Operator(String smMapping8Operator) {
    this.smMapping8Operator = smMapping8Operator;
  }

  public String smMapping8Value;
  public String getsmMapping8Value() {
    return smMapping8Value;
  }
  public void setsmMapping8Value(String smMapping8Value) {
    this.smMapping8Value = smMapping8Value;
  }

  public void field8Mapping() {
    List<scaleMatters__Sync_Mapping__c> cmd = [
      SELECT scaleMatters__Filter_8_Mapping__c
      FROM scaleMatters__Sync_Mapping__c
      WHERE
        scaleMatters__Name__c LIKE 'scaleMatters Sync Mapping'
        AND isDeleted = FALSE
    ];
    cmd[0].scaleMatters__Filter_8_Mapping__c =
      smMapping8 +
      ' ' +
      smMapping8Operator +
      ' ' +
      smMapping8Value;

    update cmd;
  }
  //all methods which are used to set Field 9 Mapping
  public String smMapping9;
  public String getsmMapping9() {
    return smMapping9;
  }
  public void setsmMapping9(String smMapping9) {
    this.smMapping9 = smMapping9;
  }

  public String smMapping9Operator;
  public String getsmMapping9Operator() {
    return smMapping9Operator;
  }
  public void setsmMapping9Operator(String smMapping9Operator) {
    this.smMapping9Operator = smMapping9Operator;
  }

  public String smMapping9Value;
  public String getsmMapping9Value() {
    return smMapping9Value;
  }
  public void setsmMapping9Value(String smMapping9Value) {
    this.smMapping9Value = smMapping9Value;
  }

  public void field9Mapping() {
    List<scaleMatters__Sync_Mapping__c> cmd = [
      SELECT scaleMatters__Filter_9_Mapping__c
      FROM scaleMatters__Sync_Mapping__c
      WHERE
        scaleMatters__Name__c LIKE 'scaleMatters Sync Mapping'
        AND isDeleted = FALSE
    ];
    cmd[0].scaleMatters__Filter_9_Mapping__c =
      smMapping9 +
      ' ' +
      smMapping9Operator +
      ' ' +
      smMapping9Value;

    update cmd;
  }

  /**
//all methods which are used to set Field 10 Mapping 
    public String smMapping10;
    public String getsmMapping10() {
        return smMapping10;
    }
    public void setsmMapping10(String smMapping10) {
        this.smMapping10 = smMapping10;
    }
    
    public String smMapping10Operator;
    public String getsmMapping10Operator() {
        return smMapping10Operator;
    }
    public void setsmMapping10Operator(String smMapping10Operator) {
        this.smMapping10Operator = smMapping10Operator;
    }
    
    public String smMapping10Value;
    public String getsmMapping10Value() {
        return smMapping10Value;
    }
    public void setsmMapping10Value(String smMapping10Value) {
        this.smMapping10Value = smMapping10Value;
    }
       
    public void field10Mapping() {
        
 
        
        List<scaleMatters__Sync_Mapping__c> cmd = [select scaleMatters__Filter_10_Mapping__c from scaleMatters__Sync_Mapping__c where scaleMatters__Name__c Like 'scaleMatters Sync Mapping' AND isDeleted = false ];
        cmd[0].scaleMatters__Filter_10_Mapping__c = smMapping10 + ' ' + smMapping10Operator + ' ' + smMapping10Value  ;
        
        update cmd;
        
       
        
        }
//all methods which are used to set Field 11 Mapping 
    public String smMapping11;
    public String getsmMapping11() {
        return smMapping11;
    }
    public void setsmMapping11(String smMapping11) {
        this.smMapping11 = smMapping11;
    }
    
    public String smMapping11Operator;
    public String getsmMapping11Operator() {
        return smMapping11Operator;
    }
    public void setsmMapping11Operator(String smMapping11Operator) {
        this.smMapping11Operator = smMapping11Operator;
    }
    
    public String smMapping11Value;
    public String getsmMapping11Value() {
        return smMapping11Value;
    }
    public void setsmMapping11Value(String smMapping11Value) {
        this.smMapping11Value = smMapping11Value;
    }
       
    public void field11Mapping() {
        
 
        
        List<scaleMatters__Sync_Mapping__c> cmd = [select scaleMatters__Filter_11_Mapping__c from scaleMatters__Sync_Mapping__c where scaleMatters__Name__c Like 'scaleMatters Sync Mapping' AND isDeleted = false ];
        cmd[0].scaleMatters__Filter_11_Mapping__c = smMapping11 + ' ' + smMapping11Operator + ' ' + smMapping11Value  ;
        
        update cmd;
        
       
        
        }
//all methods which are used to set Field 12 Mapping 
    public String smMapping12;
    public String getsmMapping12() {
        return smMapping12;
    }
    public void setsmMapping12(String smMapping12) {
        this.smMapping12 = smMapping12;
    }
    
    public String smMapping12Operator;
    public String getsmMapping12Operator() {
        return smMapping12Operator;
    }
    public void setsmMapping12Operator(String smMapping12Operator) {
        this.smMapping12Operator = smMapping12Operator;
    }
    
    public String smMapping12Value;
    public String getsmMapping12Value() {
        return smMapping12Value;
    }
    public void setsmMapping12Value(String smMapping12Value) {
        this.smMapping12Value = smMapping12Value;
    }
       
    public void field12Mapping() {
        
 
        
        List<scaleMatters__Sync_Mapping__c> cmd = [select scaleMatters__Filter_12_Mapping__c from scaleMatters__Sync_Mapping__c where scaleMatters__Name__c Like 'scaleMatters Sync Mapping' AND isDeleted = false ];
        cmd[0].scaleMatters__Filter_12_Mapping__c = smMapping12 + ' ' + smMapping12Operator + ' ' + smMapping12Value  ;
        
        update cmd;
        
       
        
        }
//all methods which are used to set Field 13 Mapping 
    public String smMapping13;
    public String getsmMapping13() {
        return smMapping13;
    }
    public void setsmMapping13(String smMapping13) {
        this.smMapping13 = smMapping13;
    }
    
    public String smMapping13Operator;
    public String getsmMapping13Operator() {
        return smMapping13Operator;
    }
    public void setsmMapping13Operator(String smMapping13Operator) {
        this.smMapping13Operator = smMapping13Operator;
    }
    
    public String smMapping13Value;
    public String getsmMapping13Value() {
        return smMapping13Value;
    }
    public void setsmMapping13Value(String smMapping13Value) {
        this.smMapping13Value = smMapping13Value;
    }
       
    public void field13Mapping() {
        
 
        
        List<scaleMatters__Sync_Mapping__c> cmd = [select scaleMatters__Filter_13_Mapping__c from scaleMatters__Sync_Mapping__c where scaleMatters__Name__c Like 'scaleMatters Sync Mapping' AND isDeleted = false ];
        cmd[0].scaleMatters__Filter_13_Mapping__c = smMapping13 + ' ' + smMapping13Operator + ' ' + smMapping13Value  ;
        
        update cmd;
        
       
        
        }
//all methods which are used to set Field 14 Mapping 
    public String smMapping14;
    public String getsmMapping14() {
        return smMapping14;
    }
    public void setsmMapping14(String smMapping14) {
        this.smMapping14 = smMapping14;
    }
    
    public String smMapping14Operator;
    public String getsmMapping14Operator() {
        return smMapping14Operator;
    }
    public void setsmMapping14Operator(String smMapping14Operator) {
        this.smMapping14Operator = smMapping14Operator;
    }
    
    public String smMapping14Value;
    public String getsmMapping14Value() {
        return smMapping14Value;
    }
    public void setsmMapping14Value(String smMapping14Value) {
        this.smMapping14Value = smMapping14Value;
    }
       
    public void field14Mapping() {
        
 
        
        List<scaleMatters__Sync_Mapping__c> cmd = [select scaleMatters__Filter_14_Mapping__c from scaleMatters__Sync_Mapping__c where scaleMatters__Name__c Like 'scaleMatters Sync Mapping' AND isDeleted = false ];
        cmd[0].scaleMatters__Filter_14_Mapping__c = smMapping14 + ' ' + smMapping14Operator + ' ' + smMapping14Value  ;
        
        update cmd;
        
       
        
        }
//all methods which are used to set Field 15 Mapping 

    public String smMapping15;
    public String getsmMapping15() {
        return smMapping15;
    }
    public void setsmMapping15(String smMapping15) {
        this.smMapping15 = smMapping15;
    }
    
    public String smMapping15Operator;
    public String getsmMapping15Operator() {
        return smMapping15Operator;
    }
    public void setsmMapping15Operator(String smMapping15Operator) {
        this.smMapping15Operator = smMapping15Operator;
    }
    
    public String smMapping15Value;
    public String getsmMapping15Value() {
        return smMapping15Value;
    }
    public void setsmMapping15Value(String smMapping15Value) {
        this.smMapping15Value = smMapping15Value;
    }
       
    public void field15Mapping() {
        
 
        
        List<scaleMatters__Sync_Mapping__c> cmd = [select scaleMatters__Filter_15_Mapping__c from scaleMatters__Sync_Mapping__c where scaleMatters__Name__c Like 'scaleMatters Sync Mapping' AND isDeleted = false ];
        cmd[0].scaleMatters__Filter_15_Mapping__c = smMapping15 + ' ' + smMapping15Operator + ' ' + smMapping15Value  ;
        
        update cmd;
        
       
        
        }
//all methods which are used to set Field 16 Mapping 
    public String smMapping16;
    public String getsmMapping16() {
        return smMapping16;
    }
    public void setsmMapping16(String smMapping16) {
        this.smMapping16 = smMapping16;
    }
    
    public String smMapping16Operator;
    public String getsmMapping16Operator() {
        return smMapping16Operator;
    }
    public void setsmMapping16Operator(String smMapping16Operator) {
        this.smMapping16Operator = smMapping16Operator;
    }
    
    public String smMapping16Value;
    public String getsmMapping16Value() {
        return smMapping16Value;
    }
    public void setsmMapping16Value(String smMapping16Value) {
        this.smMapping16Value = smMapping16Value;
    }
       
    public void field16Mapping() {
        
 
        
        List<scaleMatters__Sync_Mapping__c> cmd = [select scaleMatters__Filter_16_Mapping__c from scaleMatters__Sync_Mapping__c where scaleMatters__Name__c Like 'scaleMatters Sync Mapping' AND isDeleted = false ];
        cmd[0].scaleMatters__Filter_16_Mapping__c = smMapping16 + ' ' + smMapping16Operator + ' ' + smMapping16Value  ;
        
        update cmd;
        
       
        
        }
//all methods which are used to set Field 17 Mapping 
    public String smMapping17;
    public String getsmMapping17() {
        return smMapping17;
    }
    public void setsmMapping17(String smMapping17) {
        this.smMapping17 = smMapping17;
    }
    
    public String smMapping17Operator;
    public String getsmMapping17Operator() {
        return smMapping17Operator;
    }
    public void setsmMapping17Operator(String smMapping17Operator) {
        this.smMapping17Operator = smMapping17Operator;
    }
    
    public String smMapping17Value;
    public String getsmMapping17Value() {
        return smMapping17Value;
    }
    public void setsmMapping17Value(String smMapping17Value) {
        this.smMapping17Value = smMapping17Value;
    }
       
    public void field17Mapping() {
        
 
        
        List<scaleMatters__Sync_Mapping__c> cmd = [select scaleMatters__Filter_17_Mapping__c from scaleMatters__Sync_Mapping__c where scaleMatters__Name__c Like 'scaleMatters Sync Mapping' AND isDeleted = false ];
        cmd[0].scaleMatters__Filter_17_Mapping__c = smMapping17 + ' ' + smMapping17Operator + ' ' + smMapping17Value  ;
        
        update cmd;
        
       
        
        }
//all methods which are used to set Field 18 Mapping 
    public String smMapping18;
    public String getsmMapping18() {
        return smMapping18;
    }
    public void setsmMapping18(String smMapping18) {
        this.smMapping18 = smMapping18;
    }
    
    public String smMapping18Operator;
    public String getsmMapping18Operator() {
        return smMapping18Operator;
    }
    public void setsmMapping18Operator(String smMapping18Operator) {
        this.smMapping18Operator = smMapping18Operator;
    }
    
    public String smMapping18Value;
    public String getsmMapping18Value() {
        return smMapping18Value;
    }
    public void setsmMapping18Value(String smMapping18Value) {
        this.smMapping18Value = smMapping18Value;
    }
       
    public void field18Mapping() {
        
 
        
        List<scaleMatters__Sync_Mapping__c> cmd = [select scaleMatters__Filter_18_Mapping__c from scaleMatters__Sync_Mapping__c where scaleMatters__Name__c Like 'scaleMatters Sync Mapping' AND isDeleted = false ];
        cmd[0].scaleMatters__Filter_18_Mapping__c = smMapping18 + ' ' + smMapping18Operator + ' ' + smMapping18Value  ;
        
        update cmd;
        
       
        
        }
//all methods which are used to set Field 19 Mapping 
    public String smMapping19;
    public String getsmMapping19() {
        return smMapping19;
    }
    public void setsmMapping19(String smMapping19) {
        this.smMapping19 = smMapping19;
    }
    
    public String smMapping19Operator;
    public String getsmMapping19Operator() {
        return smMapping19Operator;
    }
    public void setsmMapping19Operator(String smMapping19Operator) {
        this.smMapping19Operator = smMapping19Operator;
    }
    
    public String smMapping19Value;
    public String getsmMapping19Value() {
        return smMapping19Value;
    }
    public void setsmMapping19Value(String smMapping19Value) {
        this.smMapping19Value = smMapping19Value;
    }
       
    public void field19Mapping() {
        
 
        
        List<scaleMatters__Sync_Mapping__c> cmd = [select scaleMatters__Filter_19_Mapping__c from scaleMatters__Sync_Mapping__c where scaleMatters__Name__c Like 'scaleMatters Sync Mapping' AND isDeleted = false ];
        cmd[0].scaleMatters__Filter_19_Mapping__c = smMapping19 + ' ' + smMapping19Operator + ' ' + smMapping19Value  ;
        
        update cmd;
        
       
        
        }
//all methods which are used to set Field 20 Mapping 
    public String smMapping20;
    public String getsmMapping20() {
        return smMapping20;
    }
    public void setsmMapping20(String smMapping20) {
        this.smMapping20 = smMapping20;
    }
    
    public String smMapping20Operator;
    public String getsmMapping20Operator() {
        return smMapping20Operator;
    }
    public void setsmMapping20Operator(String smMapping20Operator) {
        this.smMapping20Operator = smMapping20Operator;
    }
    
    public String smMapping20Value;
    public String getsmMapping20Value() {
        return smMapping20Value;
    }
    public void setsmMapping20Value(String smMapping20Value) {
        this.smMapping20Value = smMapping20Value;
    }
       
    public void field20Mapping() {
        
 
        
        List<scaleMatters__Sync_Mapping__c> cmd = [select scaleMatters__Filter_20_Mapping__c from scaleMatters__Sync_Mapping__c where scaleMatters__Name__c Like 'scaleMatters Sync Mapping' AND isDeleted = false ];
        cmd[0].scaleMatters__Filter_20_Mapping__c = smMapping20 + ' ' + smMapping20Operator + ' ' + smMapping20Value  ;
        
        update cmd;
        
       
        
        }
    //all methods which are used to set Field 21 Mapping 
    public String smMapping21;
    public String getsmMapping21() {
        return smMapping21;
    }
    public void setsmMapping21(String smMapping21) {
        this.smMapping21 = smMapping21;
    }
    
    public String smMapping21Operator;
    public String getsmMapping21Operator() {
        return smMapping21Operator;
    }
    public void setsmMapping21Operator(String smMapping21Operator) {
        this.smMapping21Operator = smMapping21Operator;
    }
    
    public String smMapping21Value;
    public String getsmMapping21Value() {
        return smMapping21Value;
    }
    public void setsmMapping21Value(String smMapping21Value) {
        this.smMapping21Value = smMapping21Value;
    }
       
    public void field21Mapping() {
        
 
        
        List<scaleMatters__Sync_Mapping__c> cmd = [select scaleMatters__Filter_21_Mapping__c from scaleMatters__Sync_Mapping__c where scaleMatters__Name__c Like 'scaleMatters Sync Mapping' AND isDeleted = false ];
        cmd[0].scaleMatters__Filter_21_Mapping__c = smMapping21 + ' ' + smMapping21Operator + ' ' + smMapping21Value  ;
        
        update cmd;
        
       
        
        }

//all methods which are used to set Field 22 Mapping 

    public String smMapping22;
    public String getsmMapping22() {
        return smMapping22;
    }
    public void setsmMapping22(String smMapping22) {
        this.smMapping22 = smMapping22;
    }
    
    public String smMapping22Operator;
    public String getsmMapping22Operator() {
        return smMapping22Operator;
    }
    public void setsmMapping22Operator(String smMapping22Operator) {
        this.smMapping22Operator = smMapping22Operator;
    }
    
    public String smMapping22Value;
    public String getsmMapping22Value() {
        return smMapping22Value;
    }
    public void setsmMapping22Value(String smMapping22Value) {
        this.smMapping22Value = smMapping22Value;
    }
       
    public void field22Mapping() {
        
 
        
        List<scaleMatters__Sync_Mapping__c> cmd = [select scaleMatters__Filter_22_Mapping__c from scaleMatters__Sync_Mapping__c where scaleMatters__Name__c Like 'scaleMatters Sync Mapping' AND isDeleted = false ];
        cmd[0].scaleMatters__Filter_22_Mapping__c = smMapping22 + ' ' + smMapping22Operator + ' ' + smMapping22Value  ;
        
        update cmd;
        
       
        
        }
//all methods which are used to set Field 23 Mapping 
    public String smMapping23;

    public String getsmMapping23() {
        return smMapping23;
    }
    public void setsmMapping23(String smMapping23) {
        this.smMapping23 = smMapping23;
    }
    
    public String smMapping23Operator;
    public String getsmMapping23Operator() {
        return smMapping23Operator;
    }
    public void setsmMapping23Operator(String smMapping23Operator) {
        this.smMapping23Operator = smMapping23Operator;
    }
    
    public String smMapping23Value;
    public String getsmMapping23Value() {
        return smMapping23Value;
    }
    public void setsmMapping23Value(String smMapping23Value) {
        this.smMapping23Value = smMapping23Value;
    }
       
    public void field23Mapping() {
        
 
        
        List<scaleMatters__Sync_Mapping__c> cmd = [select scaleMatters__Filter_23_Mapping__c from scaleMatters__Sync_Mapping__c where scaleMatters__Name__c Like 'scaleMatters Sync Mapping' AND isDeleted = false ];
        cmd[0].scaleMatters__Filter_23_Mapping__c = smMapping23 + ' ' + smMapping23Operator + ' ' + smMapping23Value  ;
        
        update cmd;
        
       
        
        }
//all methods which are used to set Field 24 Mapping 
    public String smMapping24;
    public String getsmMapping24() {
        return smMapping24;
    }
    public void setsmMapping24(String smMapping24) {
        this.smMapping24 = smMapping24;
    }
    
    public String smMapping24Operator;
    public String getsmMapping24Operator() {
        return smMapping24Operator;
    }
    public void setsmMapping24Operator(String smMapping24Operator) {
        this.smMapping24Operator = smMapping24Operator;
    }
    
    public String smMapping24Value;
    public String getsmMapping24Value() {
        return smMapping24Value;
    }
    public void setsmMapping24Value(String smMapping24Value) {
        this.smMapping24Value = smMapping24Value;
    }
       
    public void field24Mapping() {
        
 
        
        List<scaleMatters__Sync_Mapping__c> cmd = [select scaleMatters__Filter_24_Mapping__c from scaleMatters__Sync_Mapping__c where scaleMatters__Name__c Like 'scaleMatters Sync Mapping' AND isDeleted = false ];
        cmd[0].scaleMatters__Filter_24_Mapping__c = smMapping24 + ' ' + smMapping24Operator + ' ' + smMapping24Value  ;
        
        update cmd;
        
       
        
        }
//all methods which are used to set Field 25 Mapping 
    public String smMapping25;
    public String getsmMapping25() {
        return smMapping25;
    }
    public void setsmMapping25(String smMapping25) {
        this.smMapping25 = smMapping25;
    }
    
    public String smMapping25Operator;
    public String getsmMapping25Operator() {
        return smMapping25Operator;
    }
    public void setsmMapping25Operator(String smMapping25Operator) {
        this.smMapping25Operator = smMapping25Operator;
    }
    
    
    public String smMapping25Value;
    public String getsmMapping25Value() {
        return smMapping25Value;
    }
    public void setsmMapping25Value(String smMapping25Value) {
        this.smMapping25Value = smMapping25Value;
    }
       
    public void field25Mapping() {
        
 
        
        List<scaleMatters__Sync_Mapping__c> cmd = [select scaleMatters__Filter_25_Mapping__c from scaleMatters__Sync_Mapping__c where scaleMatters__Name__c Like 'scaleMatters Sync Mapping' AND isDeleted = false ];
        cmd[0].scaleMatters__Filter_25_Mapping__c = smMapping25 + ' ' + smMapping25Operator + ' ' + smMapping25Value  ;
        
        update cmd;
        
       
        
        }
**/

  //all methods which are used to set Filtering Logics
  //
  public String filteringLogic;
  public String getfilteringLogic() {
    return filteringLogic;
  }
  public void setfilteringLogic(String filteringLogic) {
    this.filteringLogic = filteringLogic;
  }

  public void createFilteringLogic() {
    List<scaleMatters__Sync_Mapping__c> cmd = [
      SELECT scaleMatters__Filtering_Logic__c
      FROM scaleMatters__Sync_Mapping__c
      WHERE
        scaleMatters__Name__c LIKE 'scaleMatters Sync Mapping'
        AND isDeleted = FALSE
    ];
    cmd[0].scaleMatters__Filtering_Logic__c = filteringLogic;

    update cmd;
  }
}

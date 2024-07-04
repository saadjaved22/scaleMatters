public class scaleMattersOpportunityFunnelConfig {
  @InvocableMethod(label='Run Opportunity Funnel Update')
  public static void updateFunnelMethod1(List<Id> ids) {
    Integer order = 1;

    List<scaleMatters__Funnel_Conversion_Cycle__c> sMRecordList = [
      SELECT id, scaleMatters__Opportunity__c, scaleMatters__Funnel_Group__c
      FROM scaleMatters__Funnel_Conversion_Cycle__c
      WHERE
        scaleMatters__Opportunity__c IN :ids
        AND scaleMatters__Record_Closed__c != TRUE
      LIMIT 1
    ];

    List<Opportunity> Opportunitys = [
      SELECT id, scaleMatters__Funnel_Group__c
      FROM Opportunity
      WHERE Id IN :ids
    ];

    List<scaleMatters__Funnel_Configuration_Mapping__c> funnelList = [
      SELECT Name, scaleMatters__SOQL_Condition__c, scaleMatters__SOQL_Order__c
      FROM scaleMatters__Funnel_Configuration_Mapping__c
      WHERE
        scaleMatters__SOQL_Order__c = :order
        AND scaleMatters__Object__c LIKE 'Opportunity'
    ];

    if (funnelList.size() > 0) {
      String query =
        'Select Id from Opportunity where ' +
        funnelList[0].scaleMatters__SOQL_Condition__c +
        ' AND ID IN : ids';
      List<Opportunity> OpportunityList = database.query(query);
      List<ID> OpportunityIDList = new List<ID>();

      String recordID = '';

      for (Opportunity Opportunity : OpportunityList) {
        Map<String, Object> OpportunityMap = Opportunity.getPopulatedFieldsAsMap();
        for (String fieldName : OpportunityMap.keySet()) {
          if (fieldName == 'Id') {
            recordID = String.valueOf(OpportunityMap.get(fieldName));
          }

          OpportunityIDList.add(ID.valueOf(recordID));
        }
      }

      if (OpportunityIDList.size() > 0) {
        for (Id OpportunityId : OpportunityIDList) {
          for (
            scaleMatters__Funnel_Conversion_Cycle__c smRecord : sMRecordList
          ) {
            if (OpportunityId == smRecord.scaleMatters__Opportunity__c) {
              smRecord.scaleMatters__Funnel_Group__c = funnelList[0].Name;
            }
          }
        }

        updateOpportunity(sMRecordList);
      } else {
        updateFunnelMethod2(ids);
      }
    } else {
      updateFunnelMethod2(ids);
    }
  }

  public static void updateFunnelMethod2(List<Id> ids) {
    Integer order = 2;

    List<scaleMatters__Funnel_Conversion_Cycle__c> sMRecordList = [
      SELECT id, scaleMatters__Opportunity__c, scaleMatters__Funnel_Group__c
      FROM scaleMatters__Funnel_Conversion_Cycle__c
      WHERE
        scaleMatters__Opportunity__c IN :ids
        AND scaleMatters__Record_Closed__c != TRUE
      LIMIT 1
    ];

    List<Opportunity> Opportunitys = [
      SELECT id, scaleMatters__Funnel_Group__c
      FROM Opportunity
      WHERE Id IN :ids
    ];

    List<scaleMatters__Funnel_Configuration_Mapping__c> funnelList = [
      SELECT Name, scaleMatters__SOQL_Condition__c, scaleMatters__SOQL_Order__c
      FROM scaleMatters__Funnel_Configuration_Mapping__c
      WHERE
        scaleMatters__SOQL_Order__c = :order
        AND scaleMatters__Object__c LIKE 'Opportunity'
    ];

    if (funnelList.size() > 0) {
      String query =
        'Select Id from Opportunity where ' +
        funnelList[0].scaleMatters__SOQL_Condition__c +
        ' AND ID IN : ids';
      List<Opportunity> OpportunityList = database.query(query);
      List<ID> OpportunityIDList = new List<ID>();

      String recordID = '';

      for (Opportunity Opportunity : OpportunityList) {
        Map<String, Object> OpportunityMap = Opportunity.getPopulatedFieldsAsMap();
        for (String fieldName : OpportunityMap.keySet()) {
          if (fieldName == 'Id') {
            recordID = String.valueOf(OpportunityMap.get(fieldName));
          }

          OpportunityIDList.add(ID.valueOf(recordID));
        }
      }

      if (OpportunityIDList.size() > 0) {
        for (Id OpportunityId : OpportunityIDList) {
          for (
            scaleMatters__Funnel_Conversion_Cycle__c smRecord : sMRecordList
          ) {
            if (OpportunityId == smRecord.scaleMatters__Opportunity__c) {
              smRecord.scaleMatters__Funnel_Group__c = funnelList[0].Name;
            }
          }
        }

        updateOpportunity(sMRecordList);
      } else {
        updateFunnelMethod3(ids);
      }
    } else {
      updateFunnelMethod3(ids);
    }
  }

  public static void updateFunnelMethod3(List<Id> ids) {
    Integer order = 3;

    List<scaleMatters__Funnel_Conversion_Cycle__c> sMRecordList = [
      SELECT id, scaleMatters__Opportunity__c, scaleMatters__Funnel_Group__c
      FROM scaleMatters__Funnel_Conversion_Cycle__c
      WHERE
        scaleMatters__Opportunity__c IN :ids
        AND scaleMatters__Record_Closed__c != TRUE
      LIMIT 1
    ];

    List<Opportunity> Opportunitys = [
      SELECT id, scaleMatters__Funnel_Group__c
      FROM Opportunity
      WHERE Id IN :ids
    ];

    List<scaleMatters__Funnel_Configuration_Mapping__c> funnelList = [
      SELECT Name, scaleMatters__SOQL_Condition__c, scaleMatters__SOQL_Order__c
      FROM scaleMatters__Funnel_Configuration_Mapping__c
      WHERE
        scaleMatters__SOQL_Order__c = :order
        AND scaleMatters__Object__c LIKE 'Opportunity'
    ];

    if (funnelList.size() > 0) {
      String query =
        'Select Id from Opportunity where ' +
        funnelList[0].scaleMatters__SOQL_Condition__c +
        ' AND ID IN : ids';
      List<Opportunity> OpportunityList = database.query(query);
      List<ID> OpportunityIDList = new List<ID>();

      String recordID = '';

      for (Opportunity Opportunity : OpportunityList) {
        Map<String, Object> OpportunityMap = Opportunity.getPopulatedFieldsAsMap();
        for (String fieldName : OpportunityMap.keySet()) {
          if (fieldName == 'Id') {
            recordID = String.valueOf(OpportunityMap.get(fieldName));
          }

          OpportunityIDList.add(ID.valueOf(recordID));
        }
      }

      if (OpportunityIDList.size() > 0) {
        for (Id OpportunityId : OpportunityIDList) {
          for (
            scaleMatters__Funnel_Conversion_Cycle__c smRecord : sMRecordList
          ) {
            if (OpportunityId == smRecord.scaleMatters__Opportunity__c) {
              smRecord.scaleMatters__Funnel_Group__c = funnelList[0].Name;
            }
          }
        }

        updateOpportunity(sMRecordList);
      } else {
        updateFunnelMethod4(ids);
      }
    } else {
      updateFunnelMethod4(ids);
    }
  }

  public static void updateFunnelMethod4(List<Id> ids) {
    Integer order = 4;

    List<scaleMatters__Funnel_Conversion_Cycle__c> sMRecordList = [
      SELECT id, scaleMatters__Opportunity__c, scaleMatters__Funnel_Group__c
      FROM scaleMatters__Funnel_Conversion_Cycle__c
      WHERE
        scaleMatters__Opportunity__c IN :ids
        AND scaleMatters__Record_Closed__c != TRUE
      LIMIT 1
    ];

    List<Opportunity> Opportunitys = [
      SELECT id, scaleMatters__Funnel_Group__c
      FROM Opportunity
      WHERE Id IN :ids
    ];

    List<scaleMatters__Funnel_Configuration_Mapping__c> funnelList = [
      SELECT Name, scaleMatters__SOQL_Condition__c, scaleMatters__SOQL_Order__c
      FROM scaleMatters__Funnel_Configuration_Mapping__c
      WHERE
        scaleMatters__SOQL_Order__c = :order
        AND scaleMatters__Object__c LIKE 'Opportunity'
    ];

    if (funnelList.size() > 0) {
      String query =
        'Select Id from Opportunity where ' +
        funnelList[0].scaleMatters__SOQL_Condition__c +
        ' AND ID IN : ids';
      List<Opportunity> OpportunityList = database.query(query);
      List<ID> OpportunityIDList = new List<ID>();

      String recordID = '';

      for (Opportunity Opportunity : OpportunityList) {
        Map<String, Object> OpportunityMap = Opportunity.getPopulatedFieldsAsMap();
        for (String fieldName : OpportunityMap.keySet()) {
          if (fieldName == 'Id') {
            recordID = String.valueOf(OpportunityMap.get(fieldName));
          }

          OpportunityIDList.add(ID.valueOf(recordID));
        }
      }

      if (OpportunityIDList.size() > 0) {
        for (Id OpportunityId : OpportunityIDList) {
          for (
            scaleMatters__Funnel_Conversion_Cycle__c smRecord : sMRecordList
          ) {
            if (OpportunityId == smRecord.scaleMatters__Opportunity__c) {
              smRecord.scaleMatters__Funnel_Group__c = funnelList[0].Name;
            }
          }
        }

        updateOpportunity(sMRecordList);
      } else {
        updateFunnelMethod5(ids);
      }
    } else {
      updateFunnelMethod5(ids);
    }
  }

  public static void updateFunnelMethod5(List<Id> ids) {
    Integer order = 5;

    List<scaleMatters__Funnel_Conversion_Cycle__c> sMRecordList = [
      SELECT id, scaleMatters__Opportunity__c, scaleMatters__Funnel_Group__c
      FROM scaleMatters__Funnel_Conversion_Cycle__c
      WHERE
        scaleMatters__Opportunity__c IN :ids
        AND scaleMatters__Record_Closed__c != TRUE
      LIMIT 1
    ];

    List<Opportunity> Opportunitys = [
      SELECT id, scaleMatters__Funnel_Group__c
      FROM Opportunity
      WHERE Id IN :ids
    ];

    List<scaleMatters__Funnel_Configuration_Mapping__c> funnelList = [
      SELECT Name, scaleMatters__SOQL_Condition__c, scaleMatters__SOQL_Order__c
      FROM scaleMatters__Funnel_Configuration_Mapping__c
      WHERE
        scaleMatters__SOQL_Order__c = :order
        AND scaleMatters__Object__c LIKE 'Opportunity'
    ];

    if (funnelList.size() > 0) {
      String query =
        'Select Id from Opportunity where ' +
        funnelList[0].scaleMatters__SOQL_Condition__c +
        ' AND ID IN : ids';
      List<Opportunity> OpportunityList = database.query(query);
      List<ID> OpportunityIDList = new List<ID>();

      String recordID = '';

      for (Opportunity Opportunity : OpportunityList) {
        Map<String, Object> OpportunityMap = Opportunity.getPopulatedFieldsAsMap();
        for (String fieldName : OpportunityMap.keySet()) {
          if (fieldName == 'Id') {
            recordID = String.valueOf(OpportunityMap.get(fieldName));
          }

          OpportunityIDList.add(ID.valueOf(recordID));
        }
      }

      if (OpportunityIDList.size() > 0) {
        for (Id OpportunityId : OpportunityIDList) {
          for (
            scaleMatters__Funnel_Conversion_Cycle__c smRecord : sMRecordList
          ) {
            if (OpportunityId == smRecord.scaleMatters__Opportunity__c) {
              smRecord.scaleMatters__Funnel_Group__c = funnelList[0].Name;
            }
          }
        }

        updateOpportunity(sMRecordList);
      } else {
        updateFunnelMethod6(ids);
      }
    } else {
      updateFunnelMethod6(ids);
    }
  }

  public static void updateFunnelMethod6(List<Id> ids) {
    Integer order = 6;

    List<scaleMatters__Funnel_Conversion_Cycle__c> sMRecordList = [
      SELECT id, scaleMatters__Opportunity__c, scaleMatters__Funnel_Group__c
      FROM scaleMatters__Funnel_Conversion_Cycle__c
      WHERE
        scaleMatters__Opportunity__c IN :ids
        AND scaleMatters__Record_Closed__c != TRUE
      LIMIT 1
    ];

    List<Opportunity> Opportunitys = [
      SELECT id, scaleMatters__Funnel_Group__c
      FROM Opportunity
      WHERE Id IN :ids
    ];

    List<scaleMatters__Funnel_Configuration_Mapping__c> funnelList = [
      SELECT Name, scaleMatters__SOQL_Condition__c, scaleMatters__SOQL_Order__c
      FROM scaleMatters__Funnel_Configuration_Mapping__c
      WHERE
        scaleMatters__SOQL_Order__c = :order
        AND scaleMatters__Object__c LIKE 'Opportunity'
    ];

    if (funnelList.size() > 0) {
      String query =
        'Select Id from Opportunity where ' +
        funnelList[0].scaleMatters__SOQL_Condition__c +
        ' AND ID IN : ids';
      List<Opportunity> OpportunityList = database.query(query);
      List<ID> OpportunityIDList = new List<ID>();

      String recordID = '';

      for (Opportunity Opportunity : OpportunityList) {
        Map<String, Object> OpportunityMap = Opportunity.getPopulatedFieldsAsMap();
        for (String fieldName : OpportunityMap.keySet()) {
          if (fieldName == 'Id') {
            recordID = String.valueOf(OpportunityMap.get(fieldName));
          }

          OpportunityIDList.add(ID.valueOf(recordID));
        }
      }

      if (OpportunityIDList.size() > 0) {
        for (Id OpportunityId : OpportunityIDList) {
          for (
            scaleMatters__Funnel_Conversion_Cycle__c smRecord : sMRecordList
          ) {
            if (OpportunityId == smRecord.scaleMatters__Opportunity__c) {
              smRecord.scaleMatters__Funnel_Group__c = funnelList[0].Name;
            }
          }
        }

        updateOpportunity(sMRecordList);
      } else {
        updateFunnelMethod7(ids);
      }
    } else {
      updateFunnelMethod7(ids);
    }
  }

  public static void updateFunnelMethod7(List<Id> ids) {
    Integer order = 7;

    List<scaleMatters__Funnel_Conversion_Cycle__c> sMRecordList = [
      SELECT id, scaleMatters__Opportunity__c, scaleMatters__Funnel_Group__c
      FROM scaleMatters__Funnel_Conversion_Cycle__c
      WHERE
        scaleMatters__Opportunity__c IN :ids
        AND scaleMatters__Record_Closed__c != TRUE
      LIMIT 1
    ];

    List<Opportunity> Opportunitys = [
      SELECT id, scaleMatters__Funnel_Group__c
      FROM Opportunity
      WHERE Id IN :ids
    ];

    List<scaleMatters__Funnel_Configuration_Mapping__c> funnelList = [
      SELECT Name, scaleMatters__SOQL_Condition__c, scaleMatters__SOQL_Order__c
      FROM scaleMatters__Funnel_Configuration_Mapping__c
      WHERE
        scaleMatters__SOQL_Order__c = :order
        AND scaleMatters__Object__c LIKE 'Opportunity'
    ];

    if (funnelList.size() > 0) {
      String query =
        'Select Id from Opportunity where ' +
        funnelList[0].scaleMatters__SOQL_Condition__c +
        ' AND ID IN : ids';
      List<Opportunity> OpportunityList = database.query(query);
      List<ID> OpportunityIDList = new List<ID>();

      String recordID = '';

      for (Opportunity Opportunity : OpportunityList) {
        Map<String, Object> OpportunityMap = Opportunity.getPopulatedFieldsAsMap();
        for (String fieldName : OpportunityMap.keySet()) {
          if (fieldName == 'Id') {
            recordID = String.valueOf(OpportunityMap.get(fieldName));
          }

          OpportunityIDList.add(ID.valueOf(recordID));
        }
      }

      if (OpportunityIDList.size() > 0) {
        for (Id OpportunityId : OpportunityIDList) {
          for (
            scaleMatters__Funnel_Conversion_Cycle__c smRecord : sMRecordList
          ) {
            if (OpportunityId == smRecord.scaleMatters__Opportunity__c) {
              smRecord.scaleMatters__Funnel_Group__c = funnelList[0].Name;
            }
          }
        }

        updateOpportunity(sMRecordList);
      } else {
        updateFunnelMethod8(ids);
      }
    } else {
      updateFunnelMethod8(ids);
    }
  }

  public static void updateFunnelMethod8(List<Id> ids) {
    Integer order = 8;

    List<scaleMatters__Funnel_Conversion_Cycle__c> sMRecordList = [
      SELECT id, scaleMatters__Opportunity__c, scaleMatters__Funnel_Group__c
      FROM scaleMatters__Funnel_Conversion_Cycle__c
      WHERE
        scaleMatters__Opportunity__c IN :ids
        AND scaleMatters__Record_Closed__c != TRUE
      LIMIT 1
    ];

    List<Opportunity> Opportunitys = [
      SELECT id, scaleMatters__Funnel_Group__c
      FROM Opportunity
      WHERE Id IN :ids
    ];

    List<scaleMatters__Funnel_Configuration_Mapping__c> funnelList = [
      SELECT Name, scaleMatters__SOQL_Condition__c, scaleMatters__SOQL_Order__c
      FROM scaleMatters__Funnel_Configuration_Mapping__c
      WHERE
        scaleMatters__SOQL_Order__c = :order
        AND scaleMatters__Object__c LIKE 'Opportunity'
    ];

    if (funnelList.size() > 0) {
      String query =
        'Select Id from Opportunity where ' +
        funnelList[0].scaleMatters__SOQL_Condition__c +
        ' AND ID IN : ids';
      List<Opportunity> OpportunityList = database.query(query);
      List<ID> OpportunityIDList = new List<ID>();

      String recordID = '';

      for (Opportunity Opportunity : OpportunityList) {
        Map<String, Object> OpportunityMap = Opportunity.getPopulatedFieldsAsMap();
        for (String fieldName : OpportunityMap.keySet()) {
          if (fieldName == 'Id') {
            recordID = String.valueOf(OpportunityMap.get(fieldName));
          }

          OpportunityIDList.add(ID.valueOf(recordID));
        }
      }

      if (OpportunityIDList.size() > 0) {
        for (Id OpportunityId : OpportunityIDList) {
          for (
            scaleMatters__Funnel_Conversion_Cycle__c smRecord : sMRecordList
          ) {
            if (OpportunityId == smRecord.scaleMatters__Opportunity__c) {
              smRecord.scaleMatters__Funnel_Group__c = funnelList[0].Name;
            }
          }
        }

        updateOpportunity(sMRecordList);
      } else {
        updateFunnelMethod9(ids);
      }
    } else {
      updateFunnelMethod9(ids);
    }
  }

  public static void updateFunnelMethod9(List<Id> ids) {
    Integer order = 9;

    List<scaleMatters__Funnel_Conversion_Cycle__c> sMRecordList = [
      SELECT id, scaleMatters__Opportunity__c, scaleMatters__Funnel_Group__c
      FROM scaleMatters__Funnel_Conversion_Cycle__c
      WHERE
        scaleMatters__Opportunity__c IN :ids
        AND scaleMatters__Record_Closed__c != TRUE
      LIMIT 1
    ];

    List<Opportunity> Opportunitys = [
      SELECT id, scaleMatters__Funnel_Group__c
      FROM Opportunity
      WHERE Id IN :ids
    ];

    List<scaleMatters__Funnel_Configuration_Mapping__c> funnelList = [
      SELECT Name, scaleMatters__SOQL_Condition__c, scaleMatters__SOQL_Order__c
      FROM scaleMatters__Funnel_Configuration_Mapping__c
      WHERE
        scaleMatters__SOQL_Order__c = :order
        AND scaleMatters__Object__c LIKE 'Opportunity'
    ];

    if (funnelList.size() > 0) {
      String query =
        'Select Id from Opportunity where ' +
        funnelList[0].scaleMatters__SOQL_Condition__c +
        ' AND ID IN : ids';
      List<Opportunity> OpportunityList = database.query(query);
      List<ID> OpportunityIDList = new List<ID>();

      String recordID = '';

      for (Opportunity Opportunity : OpportunityList) {
        Map<String, Object> OpportunityMap = Opportunity.getPopulatedFieldsAsMap();
        for (String fieldName : OpportunityMap.keySet()) {
          if (fieldName == 'Id') {
            recordID = String.valueOf(OpportunityMap.get(fieldName));
          }

          OpportunityIDList.add(ID.valueOf(recordID));
        }
      }

      if (OpportunityIDList.size() > 0) {
        for (Id OpportunityId : OpportunityIDList) {
          for (
            scaleMatters__Funnel_Conversion_Cycle__c smRecord : sMRecordList
          ) {
            if (OpportunityId == smRecord.scaleMatters__Opportunity__c) {
              smRecord.scaleMatters__Funnel_Group__c = funnelList[0].Name;
            }
          }
        }

        updateOpportunity(sMRecordList);
      } else {
        updateFunnelMethod10(ids);
      }
    } else {
      updateFunnelMethod10(ids);
    }
  }

  public static void updateFunnelMethod10(List<Id> ids) {
    Integer order = 10;

    List<scaleMatters__Funnel_Conversion_Cycle__c> sMRecordList = [
      SELECT id, scaleMatters__Opportunity__c, scaleMatters__Funnel_Group__c
      FROM scaleMatters__Funnel_Conversion_Cycle__c
      WHERE
        scaleMatters__Opportunity__c IN :ids
        AND scaleMatters__Record_Closed__c != TRUE
      LIMIT 1
    ];

    List<Opportunity> Opportunitys = [
      SELECT id, scaleMatters__Funnel_Group__c
      FROM Opportunity
      WHERE Id IN :ids
    ];

    List<scaleMatters__Funnel_Configuration_Mapping__c> funnelList = [
      SELECT Name, scaleMatters__SOQL_Condition__c, scaleMatters__SOQL_Order__c
      FROM scaleMatters__Funnel_Configuration_Mapping__c
      WHERE
        scaleMatters__SOQL_Order__c = :order
        AND scaleMatters__Object__c LIKE 'Opportunity'
    ];

    if (funnelList.size() > 0) {
      String query =
        'Select Id from Opportunity where ' +
        funnelList[0].scaleMatters__SOQL_Condition__c +
        ' AND ID IN : ids';
      List<Opportunity> OpportunityList = database.query(query);
      List<ID> OpportunityIDList = new List<ID>();

      String recordID = '';

      for (Opportunity Opportunity : OpportunityList) {
        Map<String, Object> OpportunityMap = Opportunity.getPopulatedFieldsAsMap();
        for (String fieldName : OpportunityMap.keySet()) {
          if (fieldName == 'Id') {
            recordID = String.valueOf(OpportunityMap.get(fieldName));
          }

          OpportunityIDList.add(ID.valueOf(recordID));
        }
      }

      if (OpportunityIDList.size() > 0) {
        for (Id OpportunityId : OpportunityIDList) {
          for (
            scaleMatters__Funnel_Conversion_Cycle__c smRecord : sMRecordList
          ) {
            if (OpportunityId == smRecord.scaleMatters__Opportunity__c) {
              smRecord.scaleMatters__Funnel_Group__c = funnelList[0].Name;
            }
          }
        }

        updateOpportunity(sMRecordList);
      } else {
        updateFunnelMethod11(ids);
      }
    } else {
      updateFunnelMethod11(ids);
    }
  }

  public static void updateFunnelMethod11(List<Id> ids) {
    Integer order = 11;

    List<scaleMatters__Funnel_Conversion_Cycle__c> sMRecordList = [
      SELECT id, scaleMatters__Opportunity__c, scaleMatters__Funnel_Group__c
      FROM scaleMatters__Funnel_Conversion_Cycle__c
      WHERE
        scaleMatters__Opportunity__c IN :ids
        AND scaleMatters__Record_Closed__c != TRUE
      LIMIT 1
    ];

    List<Opportunity> Opportunitys = [
      SELECT id, scaleMatters__Funnel_Group__c
      FROM Opportunity
      WHERE Id IN :ids
    ];

    List<scaleMatters__Funnel_Configuration_Mapping__c> funnelList = [
      SELECT Name, scaleMatters__SOQL_Condition__c, scaleMatters__SOQL_Order__c
      FROM scaleMatters__Funnel_Configuration_Mapping__c
      WHERE
        scaleMatters__SOQL_Order__c = :order
        AND scaleMatters__Object__c LIKE 'Opportunity'
    ];

    if (funnelList.size() > 0) {
      String query =
        'Select Id from Opportunity where ' +
        funnelList[0].scaleMatters__SOQL_Condition__c +
        ' AND ID IN : ids';
      List<Opportunity> OpportunityList = database.query(query);
      List<ID> OpportunityIDList = new List<ID>();

      String recordID = '';

      for (Opportunity Opportunity : OpportunityList) {
        Map<String, Object> OpportunityMap = Opportunity.getPopulatedFieldsAsMap();
        for (String fieldName : OpportunityMap.keySet()) {
          if (fieldName == 'Id') {
            recordID = String.valueOf(OpportunityMap.get(fieldName));
          }

          OpportunityIDList.add(ID.valueOf(recordID));
        }
      }

      if (OpportunityIDList.size() > 0) {
        for (Id OpportunityId : OpportunityIDList) {
          for (
            scaleMatters__Funnel_Conversion_Cycle__c smRecord : sMRecordList
          ) {
            if (OpportunityId == smRecord.scaleMatters__Opportunity__c) {
              smRecord.scaleMatters__Funnel_Group__c = funnelList[0].Name;
            }
          }
        }

        updateOpportunity(sMRecordList);
      } else {
        updateFunnelMethod12(ids);
      }
    } else {
      updateFunnelMethod12(ids);
    }
  }

  public static void updateFunnelMethod12(List<Id> ids) {
    Integer order = 12;

    List<scaleMatters__Funnel_Conversion_Cycle__c> sMRecordList = [
      SELECT id, scaleMatters__Opportunity__c, scaleMatters__Funnel_Group__c
      FROM scaleMatters__Funnel_Conversion_Cycle__c
      WHERE
        scaleMatters__Opportunity__c IN :ids
        AND scaleMatters__Record_Closed__c != TRUE
      LIMIT 1
    ];

    List<Opportunity> Opportunitys = [
      SELECT id, scaleMatters__Funnel_Group__c
      FROM Opportunity
      WHERE Id IN :ids
    ];

    List<scaleMatters__Funnel_Configuration_Mapping__c> funnelList = [
      SELECT Name, scaleMatters__SOQL_Condition__c, scaleMatters__SOQL_Order__c
      FROM scaleMatters__Funnel_Configuration_Mapping__c
      WHERE
        scaleMatters__SOQL_Order__c = :order
        AND scaleMatters__Object__c LIKE 'Opportunity'
    ];

    if (funnelList.size() > 0) {
      String query =
        'Select Id from Opportunity where ' +
        funnelList[0].scaleMatters__SOQL_Condition__c +
        ' AND ID IN : ids';
      List<Opportunity> OpportunityList = database.query(query);
      List<ID> OpportunityIDList = new List<ID>();

      String recordID = '';

      for (Opportunity Opportunity : OpportunityList) {
        Map<String, Object> OpportunityMap = Opportunity.getPopulatedFieldsAsMap();
        for (String fieldName : OpportunityMap.keySet()) {
          if (fieldName == 'Id') {
            recordID = String.valueOf(OpportunityMap.get(fieldName));
          }

          OpportunityIDList.add(ID.valueOf(recordID));
        }
      }

      if (OpportunityIDList.size() > 0) {
        for (Id OpportunityId : OpportunityIDList) {
          for (
            scaleMatters__Funnel_Conversion_Cycle__c smRecord : sMRecordList
          ) {
            if (OpportunityId == smRecord.scaleMatters__Opportunity__c) {
              smRecord.scaleMatters__Funnel_Group__c = funnelList[0].Name;
            }
          }
        }

        updateOpportunity(sMRecordList);
      } else {
        updateFunnelMethod13(ids);
      }
    } else {
      updateFunnelMethod13(ids);
    }
  }

  public static void updateFunnelMethod13(List<Id> ids) {
    Integer order = 13;

    List<scaleMatters__Funnel_Conversion_Cycle__c> sMRecordList = [
      SELECT id, scaleMatters__Opportunity__c, scaleMatters__Funnel_Group__c
      FROM scaleMatters__Funnel_Conversion_Cycle__c
      WHERE
        scaleMatters__Opportunity__c IN :ids
        AND scaleMatters__Record_Closed__c != TRUE
      LIMIT 1
    ];

    List<Opportunity> Opportunitys = [
      SELECT id, scaleMatters__Funnel_Group__c
      FROM Opportunity
      WHERE Id IN :ids
    ];

    List<scaleMatters__Funnel_Configuration_Mapping__c> funnelList = [
      SELECT Name, scaleMatters__SOQL_Condition__c, scaleMatters__SOQL_Order__c
      FROM scaleMatters__Funnel_Configuration_Mapping__c
      WHERE
        scaleMatters__SOQL_Order__c = :order
        AND scaleMatters__Object__c LIKE 'Opportunity'
    ];

    if (funnelList.size() > 0) {
      String query =
        'Select Id from Opportunity where ' +
        funnelList[0].scaleMatters__SOQL_Condition__c +
        ' AND ID IN : ids';
      List<Opportunity> OpportunityList = database.query(query);
      List<ID> OpportunityIDList = new List<ID>();

      String recordID = '';

      for (Opportunity Opportunity : OpportunityList) {
        Map<String, Object> OpportunityMap = Opportunity.getPopulatedFieldsAsMap();
        for (String fieldName : OpportunityMap.keySet()) {
          if (fieldName == 'Id') {
            recordID = String.valueOf(OpportunityMap.get(fieldName));
          }

          OpportunityIDList.add(ID.valueOf(recordID));
        }
      }

      if (OpportunityIDList.size() > 0) {
        for (Id OpportunityId : OpportunityIDList) {
          for (
            scaleMatters__Funnel_Conversion_Cycle__c smRecord : sMRecordList
          ) {
            if (OpportunityId == smRecord.scaleMatters__Opportunity__c) {
              smRecord.scaleMatters__Funnel_Group__c = funnelList[0].Name;
            }
          }
        }

        updateOpportunity(sMRecordList);
      } else {
        updateFunnelMethod14(ids);
      }
    } else {
      updateFunnelMethod14(ids);
    }
  }

  public static void updateFunnelMethod14(List<Id> ids) {
    Integer order = 14;

    List<scaleMatters__Funnel_Conversion_Cycle__c> sMRecordList = [
      SELECT id, scaleMatters__Opportunity__c, scaleMatters__Funnel_Group__c
      FROM scaleMatters__Funnel_Conversion_Cycle__c
      WHERE
        scaleMatters__Opportunity__c IN :ids
        AND scaleMatters__Record_Closed__c != TRUE
      LIMIT 1
    ];

    List<Opportunity> Opportunitys = [
      SELECT id, scaleMatters__Funnel_Group__c
      FROM Opportunity
      WHERE Id IN :ids
    ];

    List<scaleMatters__Funnel_Configuration_Mapping__c> funnelList = [
      SELECT Name, scaleMatters__SOQL_Condition__c, scaleMatters__SOQL_Order__c
      FROM scaleMatters__Funnel_Configuration_Mapping__c
      WHERE
        scaleMatters__SOQL_Order__c = :order
        AND scaleMatters__Object__c LIKE 'Opportunity'
    ];

    if (funnelList.size() > 0) {
      String query =
        'Select Id from Opportunity where ' +
        funnelList[0].scaleMatters__SOQL_Condition__c +
        ' AND ID IN : ids';
      List<Opportunity> OpportunityList = database.query(query);
      List<ID> OpportunityIDList = new List<ID>();

      String recordID = '';

      for (Opportunity Opportunity : OpportunityList) {
        Map<String, Object> OpportunityMap = Opportunity.getPopulatedFieldsAsMap();
        for (String fieldName : OpportunityMap.keySet()) {
          if (fieldName == 'Id') {
            recordID = String.valueOf(OpportunityMap.get(fieldName));
          }

          OpportunityIDList.add(ID.valueOf(recordID));
        }
      }

      if (OpportunityIDList.size() > 0) {
        for (Id OpportunityId : OpportunityIDList) {
          for (
            scaleMatters__Funnel_Conversion_Cycle__c smRecord : sMRecordList
          ) {
            if (OpportunityId == smRecord.scaleMatters__Opportunity__c) {
              smRecord.scaleMatters__Funnel_Group__c = funnelList[0].Name;
            }
          }
        }

        updateOpportunity(sMRecordList);
      } else {
        updateFunnelMethod15(ids);
      }
    } else {
      updateFunnelMethod15(ids);
    }
  }

  public static void updateFunnelMethod15(List<Id> ids) {
    Integer order = 15;

    List<scaleMatters__Funnel_Conversion_Cycle__c> sMRecordList = [
      SELECT id, scaleMatters__Opportunity__c, scaleMatters__Funnel_Group__c
      FROM scaleMatters__Funnel_Conversion_Cycle__c
      WHERE
        scaleMatters__Opportunity__c IN :ids
        AND scaleMatters__Record_Closed__c != TRUE
      LIMIT 1
    ];

    List<Opportunity> Opportunitys = [
      SELECT id, scaleMatters__Funnel_Group__c
      FROM Opportunity
      WHERE Id IN :ids
    ];

    List<scaleMatters__Funnel_Configuration_Mapping__c> funnelList = [
      SELECT Name, scaleMatters__SOQL_Condition__c, scaleMatters__SOQL_Order__c
      FROM scaleMatters__Funnel_Configuration_Mapping__c
      WHERE
        scaleMatters__SOQL_Order__c = :order
        AND scaleMatters__Object__c LIKE 'Opportunity'
    ];

    if (funnelList.size() > 0) {
      String query =
        'Select Id from Opportunity where ' +
        funnelList[0].scaleMatters__SOQL_Condition__c +
        ' AND ID IN : ids';
      List<Opportunity> OpportunityList = database.query(query);
      List<ID> OpportunityIDList = new List<ID>();

      String recordID = '';

      for (Opportunity Opportunity : OpportunityList) {
        Map<String, Object> OpportunityMap = Opportunity.getPopulatedFieldsAsMap();
        for (String fieldName : OpportunityMap.keySet()) {
          if (fieldName == 'Id') {
            recordID = String.valueOf(OpportunityMap.get(fieldName));
          }

          OpportunityIDList.add(ID.valueOf(recordID));
        }
      }

      if (OpportunityIDList.size() > 0) {
        for (Id OpportunityId : OpportunityIDList) {
          for (
            scaleMatters__Funnel_Conversion_Cycle__c smRecord : sMRecordList
          ) {
            if (OpportunityId == smRecord.scaleMatters__Opportunity__c) {
              smRecord.scaleMatters__Funnel_Group__c = funnelList[0].Name;
            }
          }
        }

        updateOpportunity(sMRecordList);
      } else {
        updateFunnelMethod16(ids);
      }
    } else {
      updateFunnelMethod16(ids);
    }
  }

  public static void updateFunnelMethod16(List<Id> ids) {
    Integer order = 16;

    List<scaleMatters__Funnel_Conversion_Cycle__c> sMRecordList = [
      SELECT id, scaleMatters__Opportunity__c, scaleMatters__Funnel_Group__c
      FROM scaleMatters__Funnel_Conversion_Cycle__c
      WHERE
        scaleMatters__Opportunity__c IN :ids
        AND scaleMatters__Record_Closed__c != TRUE
      LIMIT 1
    ];

    List<Opportunity> Opportunitys = [
      SELECT id, scaleMatters__Funnel_Group__c
      FROM Opportunity
      WHERE Id IN :ids
    ];

    List<scaleMatters__Funnel_Configuration_Mapping__c> funnelList = [
      SELECT Name, scaleMatters__SOQL_Condition__c, scaleMatters__SOQL_Order__c
      FROM scaleMatters__Funnel_Configuration_Mapping__c
      WHERE
        scaleMatters__SOQL_Order__c = :order
        AND scaleMatters__Object__c LIKE 'Opportunity'
    ];

    if (funnelList.size() > 0) {
      String query =
        'Select Id from Opportunity where ' +
        funnelList[0].scaleMatters__SOQL_Condition__c +
        ' AND ID IN : ids';
      List<Opportunity> OpportunityList = database.query(query);
      List<ID> OpportunityIDList = new List<ID>();

      String recordID = '';

      for (Opportunity Opportunity : OpportunityList) {
        Map<String, Object> OpportunityMap = Opportunity.getPopulatedFieldsAsMap();
        for (String fieldName : OpportunityMap.keySet()) {
          if (fieldName == 'Id') {
            recordID = String.valueOf(OpportunityMap.get(fieldName));
          }

          OpportunityIDList.add(ID.valueOf(recordID));
        }
      }

      if (OpportunityIDList.size() > 0) {
        for (Id OpportunityId : OpportunityIDList) {
          for (
            scaleMatters__Funnel_Conversion_Cycle__c smRecord : sMRecordList
          ) {
            if (OpportunityId == smRecord.scaleMatters__Opportunity__c) {
              smRecord.scaleMatters__Funnel_Group__c = funnelList[0].Name;
            }
          }
        }

        updateOpportunity(sMRecordList);
      } else {
        updateFunnelMethod17(ids);
      }
    } else {
      updateFunnelMethod17(ids);
    }
  }

  public static void updateFunnelMethod17(List<Id> ids) {
    Integer order = 17;

    List<scaleMatters__Funnel_Conversion_Cycle__c> sMRecordList = [
      SELECT id, scaleMatters__Opportunity__c, scaleMatters__Funnel_Group__c
      FROM scaleMatters__Funnel_Conversion_Cycle__c
      WHERE
        scaleMatters__Opportunity__c IN :ids
        AND scaleMatters__Record_Closed__c != TRUE
      LIMIT 1
    ];

    List<Opportunity> Opportunitys = [
      SELECT id, scaleMatters__Funnel_Group__c
      FROM Opportunity
      WHERE Id IN :ids
    ];

    List<scaleMatters__Funnel_Configuration_Mapping__c> funnelList = [
      SELECT Name, scaleMatters__SOQL_Condition__c, scaleMatters__SOQL_Order__c
      FROM scaleMatters__Funnel_Configuration_Mapping__c
      WHERE
        scaleMatters__SOQL_Order__c = :order
        AND scaleMatters__Object__c LIKE 'Opportunity'
    ];

    if (funnelList.size() > 0) {
      String query =
        'Select Id from Opportunity where ' +
        funnelList[0].scaleMatters__SOQL_Condition__c +
        ' AND ID IN : ids';
      List<Opportunity> OpportunityList = database.query(query);
      List<ID> OpportunityIDList = new List<ID>();

      String recordID = '';

      for (Opportunity Opportunity : OpportunityList) {
        Map<String, Object> OpportunityMap = Opportunity.getPopulatedFieldsAsMap();
        for (String fieldName : OpportunityMap.keySet()) {
          if (fieldName == 'Id') {
            recordID = String.valueOf(OpportunityMap.get(fieldName));
          }

          OpportunityIDList.add(ID.valueOf(recordID));
        }
      }

      if (OpportunityIDList.size() > 0) {
        for (Id OpportunityId : OpportunityIDList) {
          for (
            scaleMatters__Funnel_Conversion_Cycle__c smRecord : sMRecordList
          ) {
            if (OpportunityId == smRecord.scaleMatters__Opportunity__c) {
              smRecord.scaleMatters__Funnel_Group__c = funnelList[0].Name;
            }
          }
        }

        updateOpportunity(sMRecordList);
      } else {
        updateFunnelMethod18(ids);
      }
    } else {
      updateFunnelMethod18(ids);
    }
  }

  public static void updateFunnelMethod18(List<Id> ids) {
    Integer order = 18;

    List<scaleMatters__Funnel_Conversion_Cycle__c> sMRecordList = [
      SELECT id, scaleMatters__Opportunity__c, scaleMatters__Funnel_Group__c
      FROM scaleMatters__Funnel_Conversion_Cycle__c
      WHERE
        scaleMatters__Opportunity__c IN :ids
        AND scaleMatters__Record_Closed__c != TRUE
      LIMIT 1
    ];

    List<Opportunity> Opportunitys = [
      SELECT id, scaleMatters__Funnel_Group__c
      FROM Opportunity
      WHERE Id IN :ids
    ];

    List<scaleMatters__Funnel_Configuration_Mapping__c> funnelList = [
      SELECT Name, scaleMatters__SOQL_Condition__c, scaleMatters__SOQL_Order__c
      FROM scaleMatters__Funnel_Configuration_Mapping__c
      WHERE
        scaleMatters__SOQL_Order__c = :order
        AND scaleMatters__Object__c LIKE 'Opportunity'
    ];

    if (funnelList.size() > 0) {
      String query =
        'Select Id from Opportunity where ' +
        funnelList[0].scaleMatters__SOQL_Condition__c +
        ' AND ID IN : ids';
      List<Opportunity> OpportunityList = database.query(query);
      List<ID> OpportunityIDList = new List<ID>();

      String recordID = '';

      for (Opportunity Opportunity : OpportunityList) {
        Map<String, Object> OpportunityMap = Opportunity.getPopulatedFieldsAsMap();
        for (String fieldName : OpportunityMap.keySet()) {
          if (fieldName == 'Id') {
            recordID = String.valueOf(OpportunityMap.get(fieldName));
          }

          OpportunityIDList.add(ID.valueOf(recordID));
        }
      }

      if (OpportunityIDList.size() > 0) {
        for (Id OpportunityId : OpportunityIDList) {
          for (
            scaleMatters__Funnel_Conversion_Cycle__c smRecord : sMRecordList
          ) {
            if (OpportunityId == smRecord.scaleMatters__Opportunity__c) {
              smRecord.scaleMatters__Funnel_Group__c = funnelList[0].Name;
            }
          }
        }

        updateOpportunity(sMRecordList);
      } else {
        updateFunnelMethod19(ids);
      }
    } else {
      updateFunnelMethod19(ids);
    }
  }

  public static void updateFunnelMethod19(List<Id> ids) {
    Integer order = 19;

    List<scaleMatters__Funnel_Conversion_Cycle__c> sMRecordList = [
      SELECT id, scaleMatters__Opportunity__c, scaleMatters__Funnel_Group__c
      FROM scaleMatters__Funnel_Conversion_Cycle__c
      WHERE
        scaleMatters__Opportunity__c IN :ids
        AND scaleMatters__Record_Closed__c != TRUE
      LIMIT 1
    ];

    List<Opportunity> Opportunitys = [
      SELECT id, scaleMatters__Funnel_Group__c
      FROM Opportunity
      WHERE Id IN :ids
    ];

    List<scaleMatters__Funnel_Configuration_Mapping__c> funnelList = [
      SELECT Name, scaleMatters__SOQL_Condition__c, scaleMatters__SOQL_Order__c
      FROM scaleMatters__Funnel_Configuration_Mapping__c
      WHERE
        scaleMatters__SOQL_Order__c = :order
        AND scaleMatters__Object__c LIKE 'Opportunity'
    ];

    if (funnelList.size() > 0) {
      String query =
        'Select Id from Opportunity where ' +
        funnelList[0].scaleMatters__SOQL_Condition__c +
        ' AND ID IN : ids';
      List<Opportunity> OpportunityList = database.query(query);
      List<ID> OpportunityIDList = new List<ID>();

      String recordID = '';

      for (Opportunity Opportunity : OpportunityList) {
        Map<String, Object> OpportunityMap = Opportunity.getPopulatedFieldsAsMap();
        for (String fieldName : OpportunityMap.keySet()) {
          if (fieldName == 'Id') {
            recordID = String.valueOf(OpportunityMap.get(fieldName));
          }

          OpportunityIDList.add(ID.valueOf(recordID));
        }
      }

      if (OpportunityIDList.size() > 0) {
        for (Id OpportunityId : OpportunityIDList) {
          for (
            scaleMatters__Funnel_Conversion_Cycle__c smRecord : sMRecordList
          ) {
            if (OpportunityId == smRecord.scaleMatters__Opportunity__c) {
              smRecord.scaleMatters__Funnel_Group__c = funnelList[0].Name;
            }
          }
        }

        updateOpportunity(sMRecordList);
      } else {
        updateFunnelMethod20(ids);
      }
    } else {
      updateFunnelMethod20(ids);
    }
  }

  public static void updateFunnelMethod20(List<Id> ids) {
    Integer order = 20;

    List<scaleMatters__Funnel_Conversion_Cycle__c> sMRecordList = [
      SELECT id, scaleMatters__Opportunity__c, scaleMatters__Funnel_Group__c
      FROM scaleMatters__Funnel_Conversion_Cycle__c
      WHERE
        scaleMatters__Opportunity__c IN :ids
        AND scaleMatters__Record_Closed__c != TRUE
      LIMIT 1
    ];

    List<Opportunity> Opportunitys = [
      SELECT id, scaleMatters__Funnel_Group__c
      FROM Opportunity
      WHERE Id IN :ids
    ];

    List<scaleMatters__Funnel_Configuration_Mapping__c> funnelList = [
      SELECT Name, scaleMatters__SOQL_Condition__c, scaleMatters__SOQL_Order__c
      FROM scaleMatters__Funnel_Configuration_Mapping__c
      WHERE
        scaleMatters__SOQL_Order__c = :order
        AND scaleMatters__Object__c LIKE 'Opportunity'
    ];

    if (funnelList.size() > 0) {
      String query =
        'Select Id from Opportunity where ' +
        funnelList[0].scaleMatters__SOQL_Condition__c +
        ' AND ID IN : ids';
      List<Opportunity> OpportunityList = database.query(query);
      List<ID> OpportunityIDList = new List<ID>();

      String recordID = '';

      for (Opportunity Opportunity : OpportunityList) {
        Map<String, Object> OpportunityMap = Opportunity.getPopulatedFieldsAsMap();
        for (String fieldName : OpportunityMap.keySet()) {
          if (fieldName == 'Id') {
            recordID = String.valueOf(OpportunityMap.get(fieldName));
          }

          OpportunityIDList.add(ID.valueOf(recordID));
        }
      }

      if (OpportunityIDList.size() > 0) {
        for (Id OpportunityId : OpportunityIDList) {
          for (
            scaleMatters__Funnel_Conversion_Cycle__c smRecord : sMRecordList
          ) {
            if (OpportunityId == smRecord.scaleMatters__Opportunity__c) {
              smRecord.scaleMatters__Funnel_Group__c = funnelList[0].Name;
            }
          }
        }

        updateOpportunity(sMRecordList);
      } else {
        updateFunnelMethod21(ids);
      }
    } else {
      updateFunnelMethod21(ids);
    }
  }

  public static void updateFunnelMethod21(List<Id> ids) {
    Integer order = 21;

    List<scaleMatters__Funnel_Conversion_Cycle__c> sMRecordList = [
      SELECT id, scaleMatters__Opportunity__c, scaleMatters__Funnel_Group__c
      FROM scaleMatters__Funnel_Conversion_Cycle__c
      WHERE
        scaleMatters__Opportunity__c IN :ids
        AND scaleMatters__Record_Closed__c != TRUE
      LIMIT 1
    ];

    List<Opportunity> Opportunitys = [
      SELECT id, scaleMatters__Funnel_Group__c
      FROM Opportunity
      WHERE Id IN :ids
    ];

    List<scaleMatters__Funnel_Configuration_Mapping__c> funnelList = [
      SELECT Name, scaleMatters__SOQL_Condition__c, scaleMatters__SOQL_Order__c
      FROM scaleMatters__Funnel_Configuration_Mapping__c
      WHERE
        scaleMatters__SOQL_Order__c = :order
        AND scaleMatters__Object__c LIKE 'Opportunity'
    ];

    if (funnelList.size() > 0) {
      String query =
        'Select Id from Opportunity where ' +
        funnelList[0].scaleMatters__SOQL_Condition__c +
        ' AND ID IN : ids';
      List<Opportunity> OpportunityList = database.query(query);
      List<ID> OpportunityIDList = new List<ID>();

      String recordID = '';

      for (Opportunity Opportunity : OpportunityList) {
        Map<String, Object> OpportunityMap = Opportunity.getPopulatedFieldsAsMap();
        for (String fieldName : OpportunityMap.keySet()) {
          if (fieldName == 'Id') {
            recordID = String.valueOf(OpportunityMap.get(fieldName));
          }

          OpportunityIDList.add(ID.valueOf(recordID));
        }
      }

      if (OpportunityIDList.size() > 0) {
        for (Id OpportunityId : OpportunityIDList) {
          for (
            scaleMatters__Funnel_Conversion_Cycle__c smRecord : sMRecordList
          ) {
            if (OpportunityId == smRecord.scaleMatters__Opportunity__c) {
              smRecord.scaleMatters__Funnel_Group__c = funnelList[0].Name;
            }
          }
        }

        updateOpportunity(sMRecordList);
      } else {
        updateFunnelMethod22(ids);
      }
    } else {
      updateFunnelMethod22(ids);
    }
  }

  public static void updateFunnelMethod22(List<Id> ids) {
    Integer order = 22;

    List<scaleMatters__Funnel_Conversion_Cycle__c> sMRecordList = [
      SELECT id, scaleMatters__Opportunity__c, scaleMatters__Funnel_Group__c
      FROM scaleMatters__Funnel_Conversion_Cycle__c
      WHERE
        scaleMatters__Opportunity__c IN :ids
        AND scaleMatters__Record_Closed__c != TRUE
      LIMIT 1
    ];

    List<Opportunity> Opportunitys = [
      SELECT id, scaleMatters__Funnel_Group__c
      FROM Opportunity
      WHERE Id IN :ids
    ];

    List<scaleMatters__Funnel_Configuration_Mapping__c> funnelList = [
      SELECT Name, scaleMatters__SOQL_Condition__c, scaleMatters__SOQL_Order__c
      FROM scaleMatters__Funnel_Configuration_Mapping__c
      WHERE
        scaleMatters__SOQL_Order__c = :order
        AND scaleMatters__Object__c LIKE 'Opportunity'
    ];

    if (funnelList.size() > 0) {
      String query =
        'Select Id from Opportunity where ' +
        funnelList[0].scaleMatters__SOQL_Condition__c +
        ' AND ID IN : ids';
      List<Opportunity> OpportunityList = database.query(query);
      List<ID> OpportunityIDList = new List<ID>();

      String recordID = '';

      for (Opportunity Opportunity : OpportunityList) {
        Map<String, Object> OpportunityMap = Opportunity.getPopulatedFieldsAsMap();
        for (String fieldName : OpportunityMap.keySet()) {
          if (fieldName == 'Id') {
            recordID = String.valueOf(OpportunityMap.get(fieldName));
          }

          OpportunityIDList.add(ID.valueOf(recordID));
        }
      }

      if (OpportunityIDList.size() > 0) {
        for (Id OpportunityId : OpportunityIDList) {
          for (
            scaleMatters__Funnel_Conversion_Cycle__c smRecord : sMRecordList
          ) {
            if (OpportunityId == smRecord.scaleMatters__Opportunity__c) {
              smRecord.scaleMatters__Funnel_Group__c = funnelList[0].Name;
            }
          }
        }

        updateOpportunity(sMRecordList);
      } else {
        updateFunnelMethod23(ids);
      }
    } else {
      updateFunnelMethod23(ids);
    }
  }

  public static void updateFunnelMethod23(List<Id> ids) {
    Integer order = 23;

    List<scaleMatters__Funnel_Conversion_Cycle__c> sMRecordList = [
      SELECT id, scaleMatters__Opportunity__c, scaleMatters__Funnel_Group__c
      FROM scaleMatters__Funnel_Conversion_Cycle__c
      WHERE
        scaleMatters__Opportunity__c IN :ids
        AND scaleMatters__Record_Closed__c != TRUE
      LIMIT 1
    ];

    List<Opportunity> Opportunitys = [
      SELECT id, scaleMatters__Funnel_Group__c
      FROM Opportunity
      WHERE Id IN :ids
    ];

    List<scaleMatters__Funnel_Configuration_Mapping__c> funnelList = [
      SELECT Name, scaleMatters__SOQL_Condition__c, scaleMatters__SOQL_Order__c
      FROM scaleMatters__Funnel_Configuration_Mapping__c
      WHERE
        scaleMatters__SOQL_Order__c = :order
        AND scaleMatters__Object__c LIKE 'Opportunity'
    ];

    if (funnelList.size() > 0) {
      String query =
        'Select Id from Opportunity where ' +
        funnelList[0].scaleMatters__SOQL_Condition__c +
        ' AND ID IN : ids';
      List<Opportunity> OpportunityList = database.query(query);
      List<ID> OpportunityIDList = new List<ID>();

      String recordID = '';

      for (Opportunity Opportunity : OpportunityList) {
        Map<String, Object> OpportunityMap = Opportunity.getPopulatedFieldsAsMap();
        for (String fieldName : OpportunityMap.keySet()) {
          if (fieldName == 'Id') {
            recordID = String.valueOf(OpportunityMap.get(fieldName));
          }

          OpportunityIDList.add(ID.valueOf(recordID));
        }
      }

      if (OpportunityIDList.size() > 0) {
        for (Id OpportunityId : OpportunityIDList) {
          for (
            scaleMatters__Funnel_Conversion_Cycle__c smRecord : sMRecordList
          ) {
            if (OpportunityId == smRecord.scaleMatters__Opportunity__c) {
              smRecord.scaleMatters__Funnel_Group__c = funnelList[0].Name;
            }
          }
        }

        updateOpportunity(sMRecordList);
      } else {
        updateFunnelMethod24(ids);
      }
    } else {
      updateFunnelMethod24(ids);
    }
  }

  public static void updateFunnelMethod24(List<Id> ids) {
    Integer order = 24;

    List<scaleMatters__Funnel_Conversion_Cycle__c> sMRecordList = [
      SELECT id, scaleMatters__Opportunity__c, scaleMatters__Funnel_Group__c
      FROM scaleMatters__Funnel_Conversion_Cycle__c
      WHERE
        scaleMatters__Opportunity__c IN :ids
        AND scaleMatters__Record_Closed__c != TRUE
      LIMIT 1
    ];

    List<Opportunity> Opportunitys = [
      SELECT id, scaleMatters__Funnel_Group__c
      FROM Opportunity
      WHERE Id IN :ids
    ];

    List<scaleMatters__Funnel_Configuration_Mapping__c> funnelList = [
      SELECT Name, scaleMatters__SOQL_Condition__c, scaleMatters__SOQL_Order__c
      FROM scaleMatters__Funnel_Configuration_Mapping__c
      WHERE
        scaleMatters__SOQL_Order__c = :order
        AND scaleMatters__Object__c LIKE 'Opportunity'
    ];

    if (funnelList.size() > 0) {
      String query =
        'Select Id from Opportunity where ' +
        funnelList[0].scaleMatters__SOQL_Condition__c +
        ' AND ID IN : ids';
      List<Opportunity> OpportunityList = database.query(query);
      List<ID> OpportunityIDList = new List<ID>();

      String recordID = '';

      for (Opportunity Opportunity : OpportunityList) {
        Map<String, Object> OpportunityMap = Opportunity.getPopulatedFieldsAsMap();
        for (String fieldName : OpportunityMap.keySet()) {
          if (fieldName == 'Id') {
            recordID = String.valueOf(OpportunityMap.get(fieldName));
          }

          OpportunityIDList.add(ID.valueOf(recordID));
        }
      }

      if (OpportunityIDList.size() > 0) {
        for (Id OpportunityId : OpportunityIDList) {
          for (
            scaleMatters__Funnel_Conversion_Cycle__c smRecord : sMRecordList
          ) {
            if (OpportunityId == smRecord.scaleMatters__Opportunity__c) {
              smRecord.scaleMatters__Funnel_Group__c = funnelList[0].Name;
            }
          }
        }

        updateOpportunity(sMRecordList);
      } else {
        updateFunnelMethod25(ids);
      }
    } else {
      updateFunnelMethod25(ids);
    }
  }

  public static void updateFunnelMethod25(List<Id> ids) {
    Integer order = 25;

    List<scaleMatters__Funnel_Conversion_Cycle__c> sMRecordList = [
      SELECT id, scaleMatters__Opportunity__c, scaleMatters__Funnel_Group__c
      FROM scaleMatters__Funnel_Conversion_Cycle__c
      WHERE
        scaleMatters__Opportunity__c IN :ids
        AND scaleMatters__Record_Closed__c != TRUE
      LIMIT 1
    ];

    List<Opportunity> Opportunitys = [
      SELECT id, scaleMatters__Funnel_Group__c
      FROM Opportunity
      WHERE Id IN :ids
    ];

    List<scaleMatters__Funnel_Configuration_Mapping__c> funnelList = [
      SELECT Name, scaleMatters__SOQL_Condition__c, scaleMatters__SOQL_Order__c
      FROM scaleMatters__Funnel_Configuration_Mapping__c
      WHERE
        scaleMatters__SOQL_Order__c = :order
        AND scaleMatters__Object__c LIKE 'Opportunity'
    ];

    if (funnelList.size() > 0) {
      String query =
        'Select Id from Opportunity where ' +
        funnelList[0].scaleMatters__SOQL_Condition__c +
        ' AND ID IN : ids';
      List<Opportunity> OpportunityList = database.query(query);
      List<ID> OpportunityIDList = new List<ID>();

      String recordID = '';

      for (Opportunity Opportunity : OpportunityList) {
        Map<String, Object> OpportunityMap = Opportunity.getPopulatedFieldsAsMap();
        for (String fieldName : OpportunityMap.keySet()) {
          if (fieldName == 'Id') {
            recordID = String.valueOf(OpportunityMap.get(fieldName));
          }

          OpportunityIDList.add(ID.valueOf(recordID));
        }
      }

      if (OpportunityIDList.size() > 0) {
        for (Id OpportunityId : OpportunityIDList) {
          for (
            scaleMatters__Funnel_Conversion_Cycle__c smRecord : sMRecordList
          ) {
            if (OpportunityId == smRecord.scaleMatters__Opportunity__c) {
              smRecord.scaleMatters__Funnel_Group__c = funnelList[0].Name;
            }
          }
        }

        updateOpportunity(sMRecordList);
      } else {
        updateFunnelMethod26(ids);
      }
    } else {
      updateFunnelMethod26(ids);
    }
  }

  public static void updateFunnelMethod26(List<Id> ids) {
    Integer order = 26;

    List<scaleMatters__Funnel_Conversion_Cycle__c> sMRecordList = [
      SELECT id, scaleMatters__Opportunity__c, scaleMatters__Funnel_Group__c
      FROM scaleMatters__Funnel_Conversion_Cycle__c
      WHERE
        scaleMatters__Opportunity__c IN :ids
        AND scaleMatters__Record_Closed__c != TRUE
      LIMIT 1
    ];

    List<Opportunity> Opportunitys = [
      SELECT id, scaleMatters__Funnel_Group__c
      FROM Opportunity
      WHERE Id IN :ids
    ];

    List<scaleMatters__Funnel_Configuration_Mapping__c> funnelList = [
      SELECT Name, scaleMatters__SOQL_Condition__c, scaleMatters__SOQL_Order__c
      FROM scaleMatters__Funnel_Configuration_Mapping__c
      WHERE
        scaleMatters__SOQL_Order__c = :order
        AND scaleMatters__Object__c LIKE 'Opportunity'
    ];

    if (funnelList.size() > 0) {
      String query =
        'Select Id from Opportunity where ' +
        funnelList[0].scaleMatters__SOQL_Condition__c +
        ' AND ID IN : ids';
      List<Opportunity> OpportunityList = database.query(query);
      List<ID> OpportunityIDList = new List<ID>();

      String recordID = '';

      for (Opportunity Opportunity : OpportunityList) {
        Map<String, Object> OpportunityMap = Opportunity.getPopulatedFieldsAsMap();
        for (String fieldName : OpportunityMap.keySet()) {
          if (fieldName == 'Id') {
            recordID = String.valueOf(OpportunityMap.get(fieldName));
          }

          OpportunityIDList.add(ID.valueOf(recordID));
        }
      }

      if (OpportunityIDList.size() > 0) {
        for (Id OpportunityId : OpportunityIDList) {
          for (
            scaleMatters__Funnel_Conversion_Cycle__c smRecord : sMRecordList
          ) {
            if (OpportunityId == smRecord.scaleMatters__Opportunity__c) {
              smRecord.scaleMatters__Funnel_Group__c = funnelList[0].Name;
            }
          }
        }

        updateOpportunity(sMRecordList);
      } else {
        updateFunnelMethod27(ids);
      }
    } else {
      updateFunnelMethod27(ids);
    }
  }

  public static void updateFunnelMethod27(List<Id> ids) {
    Integer order = 27;

    List<scaleMatters__Funnel_Conversion_Cycle__c> sMRecordList = [
      SELECT id, scaleMatters__Opportunity__c, scaleMatters__Funnel_Group__c
      FROM scaleMatters__Funnel_Conversion_Cycle__c
      WHERE
        scaleMatters__Opportunity__c IN :ids
        AND scaleMatters__Record_Closed__c != TRUE
      LIMIT 1
    ];

    List<Opportunity> Opportunitys = [
      SELECT id, scaleMatters__Funnel_Group__c
      FROM Opportunity
      WHERE Id IN :ids
    ];

    List<scaleMatters__Funnel_Configuration_Mapping__c> funnelList = [
      SELECT Name, scaleMatters__SOQL_Condition__c, scaleMatters__SOQL_Order__c
      FROM scaleMatters__Funnel_Configuration_Mapping__c
      WHERE
        scaleMatters__SOQL_Order__c = :order
        AND scaleMatters__Object__c LIKE 'Opportunity'
    ];

    if (funnelList.size() > 0) {
      String query =
        'Select Id from Opportunity where ' +
        funnelList[0].scaleMatters__SOQL_Condition__c +
        ' AND ID IN : ids';
      List<Opportunity> OpportunityList = database.query(query);
      List<ID> OpportunityIDList = new List<ID>();

      String recordID = '';

      for (Opportunity Opportunity : OpportunityList) {
        Map<String, Object> OpportunityMap = Opportunity.getPopulatedFieldsAsMap();
        for (String fieldName : OpportunityMap.keySet()) {
          if (fieldName == 'Id') {
            recordID = String.valueOf(OpportunityMap.get(fieldName));
          }

          OpportunityIDList.add(ID.valueOf(recordID));
        }
      }

      if (OpportunityIDList.size() > 0) {
        for (Id OpportunityId : OpportunityIDList) {
          for (
            scaleMatters__Funnel_Conversion_Cycle__c smRecord : sMRecordList
          ) {
            if (OpportunityId == smRecord.scaleMatters__Opportunity__c) {
              smRecord.scaleMatters__Funnel_Group__c = funnelList[0].Name;
            }
          }
        }

        updateOpportunity(sMRecordList);
      } else {
        updateFunnelMethod28(ids);
      }
    } else {
      updateFunnelMethod28(ids);
    }
  }

  public static void updateFunnelMethod28(List<Id> ids) {
    Integer order = 28;

    List<scaleMatters__Funnel_Conversion_Cycle__c> sMRecordList = [
      SELECT id, scaleMatters__Opportunity__c, scaleMatters__Funnel_Group__c
      FROM scaleMatters__Funnel_Conversion_Cycle__c
      WHERE
        scaleMatters__Opportunity__c IN :ids
        AND scaleMatters__Record_Closed__c != TRUE
      LIMIT 1
    ];

    List<Opportunity> Opportunitys = [
      SELECT id, scaleMatters__Funnel_Group__c
      FROM Opportunity
      WHERE Id IN :ids
    ];

    List<scaleMatters__Funnel_Configuration_Mapping__c> funnelList = [
      SELECT Name, scaleMatters__SOQL_Condition__c, scaleMatters__SOQL_Order__c
      FROM scaleMatters__Funnel_Configuration_Mapping__c
      WHERE
        scaleMatters__SOQL_Order__c = :order
        AND scaleMatters__Object__c LIKE 'Opportunity'
    ];

    if (funnelList.size() > 0) {
      String query =
        'Select Id from Opportunity where ' +
        funnelList[0].scaleMatters__SOQL_Condition__c +
        ' AND ID IN : ids';
      List<Opportunity> OpportunityList = database.query(query);
      List<ID> OpportunityIDList = new List<ID>();

      String recordID = '';

      for (Opportunity Opportunity : OpportunityList) {
        Map<String, Object> OpportunityMap = Opportunity.getPopulatedFieldsAsMap();
        for (String fieldName : OpportunityMap.keySet()) {
          if (fieldName == 'Id') {
            recordID = String.valueOf(OpportunityMap.get(fieldName));
          }

          OpportunityIDList.add(ID.valueOf(recordID));
        }
      }

      if (OpportunityIDList.size() > 0) {
        for (Id OpportunityId : OpportunityIDList) {
          for (
            scaleMatters__Funnel_Conversion_Cycle__c smRecord : sMRecordList
          ) {
            if (OpportunityId == smRecord.scaleMatters__Opportunity__c) {
              smRecord.scaleMatters__Funnel_Group__c = funnelList[0].Name;
            }
          }
        }

        updateOpportunity(sMRecordList);
      } else {
        updateFunnelMethod29(ids);
      }
    } else {
      updateFunnelMethod29(ids);
    }
  }

  public static void updateFunnelMethod29(List<Id> ids) {
    Integer order = 29;

    List<scaleMatters__Funnel_Conversion_Cycle__c> sMRecordList = [
      SELECT id, scaleMatters__Opportunity__c, scaleMatters__Funnel_Group__c
      FROM scaleMatters__Funnel_Conversion_Cycle__c
      WHERE
        scaleMatters__Opportunity__c IN :ids
        AND scaleMatters__Record_Closed__c != TRUE
      LIMIT 1
    ];

    List<Opportunity> Opportunitys = [
      SELECT id, scaleMatters__Funnel_Group__c
      FROM Opportunity
      WHERE Id IN :ids
    ];

    List<scaleMatters__Funnel_Configuration_Mapping__c> funnelList = [
      SELECT Name, scaleMatters__SOQL_Condition__c, scaleMatters__SOQL_Order__c
      FROM scaleMatters__Funnel_Configuration_Mapping__c
      WHERE
        scaleMatters__SOQL_Order__c = :order
        AND scaleMatters__Object__c LIKE 'Opportunity'
    ];

    if (funnelList.size() > 0) {
      String query =
        'Select Id from Opportunity where ' +
        funnelList[0].scaleMatters__SOQL_Condition__c +
        ' AND ID IN : ids';
      List<Opportunity> OpportunityList = database.query(query);
      List<ID> OpportunityIDList = new List<ID>();

      String recordID = '';

      for (Opportunity Opportunity : OpportunityList) {
        Map<String, Object> OpportunityMap = Opportunity.getPopulatedFieldsAsMap();
        for (String fieldName : OpportunityMap.keySet()) {
          if (fieldName == 'Id') {
            recordID = String.valueOf(OpportunityMap.get(fieldName));
          }

          OpportunityIDList.add(ID.valueOf(recordID));
        }
      }

      if (OpportunityIDList.size() > 0) {
        for (Id OpportunityId : OpportunityIDList) {
          for (
            scaleMatters__Funnel_Conversion_Cycle__c smRecord : sMRecordList
          ) {
            if (OpportunityId == smRecord.scaleMatters__Opportunity__c) {
              smRecord.scaleMatters__Funnel_Group__c = funnelList[0].Name;
            }
          }
        }

        updateOpportunity(sMRecordList);
      } else {
        updateFunnelMethod30(ids);
      }
    } else {
      updateFunnelMethod30(ids);
    }
  }

  public static void updateFunnelMethod30(List<Id> ids) {
    Integer order = 30;

    List<scaleMatters__Funnel_Conversion_Cycle__c> sMRecordList = [
      SELECT id, scaleMatters__Opportunity__c, scaleMatters__Funnel_Group__c
      FROM scaleMatters__Funnel_Conversion_Cycle__c
      WHERE
        scaleMatters__Opportunity__c IN :ids
        AND scaleMatters__Record_Closed__c != TRUE
      LIMIT 1
    ];

    List<Opportunity> Opportunitys = [
      SELECT id, scaleMatters__Funnel_Group__c
      FROM Opportunity
      WHERE Id IN :ids
    ];

    List<scaleMatters__Funnel_Configuration_Mapping__c> funnelList = [
      SELECT Name, scaleMatters__SOQL_Condition__c, scaleMatters__SOQL_Order__c
      FROM scaleMatters__Funnel_Configuration_Mapping__c
      WHERE
        scaleMatters__SOQL_Order__c = :order
        AND scaleMatters__Object__c LIKE 'Opportunity'
    ];

    if (funnelList.size() > 0) {
      String query =
        'Select Id from Opportunity where ' +
        funnelList[0].scaleMatters__SOQL_Condition__c +
        ' AND ID IN : ids';
      List<Opportunity> OpportunityList = database.query(query);
      List<ID> OpportunityIDList = new List<ID>();

      String recordID = '';

      for (Opportunity Opportunity : OpportunityList) {
        Map<String, Object> OpportunityMap = Opportunity.getPopulatedFieldsAsMap();
        for (String fieldName : OpportunityMap.keySet()) {
          if (fieldName == 'Id') {
            recordID = String.valueOf(OpportunityMap.get(fieldName));
          }

          OpportunityIDList.add(ID.valueOf(recordID));
        }
      }

      if (OpportunityIDList.size() > 0) {
        for (Id OpportunityId : OpportunityIDList) {
          for (
            scaleMatters__Funnel_Conversion_Cycle__c smRecord : sMRecordList
          ) {
            if (OpportunityId == smRecord.scaleMatters__Opportunity__c) {
              smRecord.scaleMatters__Funnel_Group__c = funnelList[0].Name;
            }
          }
        }

        updateOpportunity(sMRecordList);
      } else {
        updateFunnelMethod31(ids);
      }
    } else {
      updateFunnelMethod31(ids);
    }
  }

  public static void updateFunnelMethod31(List<Id> ids) {
    Integer order = 31;

    List<scaleMatters__Funnel_Conversion_Cycle__c> sMRecordList = [
      SELECT id, scaleMatters__Opportunity__c, scaleMatters__Funnel_Group__c
      FROM scaleMatters__Funnel_Conversion_Cycle__c
      WHERE
        scaleMatters__Opportunity__c IN :ids
        AND scaleMatters__Record_Closed__c != TRUE
      LIMIT 1
    ];

    List<Opportunity> Opportunitys = [
      SELECT id, scaleMatters__Funnel_Group__c
      FROM Opportunity
      WHERE Id IN :ids
    ];

    List<scaleMatters__Funnel_Configuration_Mapping__c> funnelList = [
      SELECT Name, scaleMatters__SOQL_Condition__c, scaleMatters__SOQL_Order__c
      FROM scaleMatters__Funnel_Configuration_Mapping__c
      WHERE
        scaleMatters__SOQL_Order__c = :order
        AND scaleMatters__Object__c LIKE 'Opportunity'
    ];

    if (funnelList.size() > 0) {
      String query =
        'Select Id from Opportunity where ' +
        funnelList[0].scaleMatters__SOQL_Condition__c +
        ' AND ID IN : ids';
      List<Opportunity> OpportunityList = database.query(query);
      List<ID> OpportunityIDList = new List<ID>();

      String recordID = '';

      for (Opportunity Opportunity : OpportunityList) {
        Map<String, Object> OpportunityMap = Opportunity.getPopulatedFieldsAsMap();
        for (String fieldName : OpportunityMap.keySet()) {
          if (fieldName == 'Id') {
            recordID = String.valueOf(OpportunityMap.get(fieldName));
          }

          OpportunityIDList.add(ID.valueOf(recordID));
        }
      }

      if (OpportunityIDList.size() > 0) {
        for (Id OpportunityId : OpportunityIDList) {
          for (
            scaleMatters__Funnel_Conversion_Cycle__c smRecord : sMRecordList
          ) {
            if (OpportunityId == smRecord.scaleMatters__Opportunity__c) {
              smRecord.scaleMatters__Funnel_Group__c = funnelList[0].Name;
            }
          }
        }

        updateOpportunity(sMRecordList);
      } else {
        updateFunnelMethod32(ids);
      }
    } else {
      updateFunnelMethod32(ids);
    }
  }

  public static void updateFunnelMethod32(List<Id> ids) {
    Integer order = 32;

    List<scaleMatters__Funnel_Conversion_Cycle__c> sMRecordList = [
      SELECT id, scaleMatters__Opportunity__c, scaleMatters__Funnel_Group__c
      FROM scaleMatters__Funnel_Conversion_Cycle__c
      WHERE
        scaleMatters__Opportunity__c IN :ids
        AND scaleMatters__Record_Closed__c != TRUE
      LIMIT 1
    ];

    List<Opportunity> Opportunitys = [
      SELECT id, scaleMatters__Funnel_Group__c
      FROM Opportunity
      WHERE Id IN :ids
    ];

    List<scaleMatters__Funnel_Configuration_Mapping__c> funnelList = [
      SELECT Name, scaleMatters__SOQL_Condition__c, scaleMatters__SOQL_Order__c
      FROM scaleMatters__Funnel_Configuration_Mapping__c
      WHERE
        scaleMatters__SOQL_Order__c = :order
        AND scaleMatters__Object__c LIKE 'Opportunity'
    ];

    if (funnelList.size() > 0) {
      String query =
        'Select Id from Opportunity where ' +
        funnelList[0].scaleMatters__SOQL_Condition__c +
        ' AND ID IN : ids';
      List<Opportunity> OpportunityList = database.query(query);
      List<ID> OpportunityIDList = new List<ID>();

      String recordID = '';

      for (Opportunity Opportunity : OpportunityList) {
        Map<String, Object> OpportunityMap = Opportunity.getPopulatedFieldsAsMap();
        for (String fieldName : OpportunityMap.keySet()) {
          if (fieldName == 'Id') {
            recordID = String.valueOf(OpportunityMap.get(fieldName));
          }

          OpportunityIDList.add(ID.valueOf(recordID));
        }
      }

      if (OpportunityIDList.size() > 0) {
        for (Id OpportunityId : OpportunityIDList) {
          for (
            scaleMatters__Funnel_Conversion_Cycle__c smRecord : sMRecordList
          ) {
            if (OpportunityId == smRecord.scaleMatters__Opportunity__c) {
              smRecord.scaleMatters__Funnel_Group__c = funnelList[0].Name;
            }
          }
        }

        updateOpportunity(sMRecordList);
      } else {
        updateFunnelMethod33(ids);
      }
    } else {
      updateFunnelMethod33(ids);
    }
  }

  public static void updateFunnelMethod33(List<Id> ids) {
    Integer order = 33;

    List<scaleMatters__Funnel_Conversion_Cycle__c> sMRecordList = [
      SELECT id, scaleMatters__Opportunity__c, scaleMatters__Funnel_Group__c
      FROM scaleMatters__Funnel_Conversion_Cycle__c
      WHERE
        scaleMatters__Opportunity__c IN :ids
        AND scaleMatters__Record_Closed__c != TRUE
      LIMIT 1
    ];

    List<Opportunity> Opportunitys = [
      SELECT id, scaleMatters__Funnel_Group__c
      FROM Opportunity
      WHERE Id IN :ids
    ];

    List<scaleMatters__Funnel_Configuration_Mapping__c> funnelList = [
      SELECT Name, scaleMatters__SOQL_Condition__c, scaleMatters__SOQL_Order__c
      FROM scaleMatters__Funnel_Configuration_Mapping__c
      WHERE
        scaleMatters__SOQL_Order__c = :order
        AND scaleMatters__Object__c LIKE 'Opportunity'
    ];

    if (funnelList.size() > 0) {
      String query =
        'Select Id from Opportunity where ' +
        funnelList[0].scaleMatters__SOQL_Condition__c +
        ' AND ID IN : ids';
      List<Opportunity> OpportunityList = database.query(query);
      List<ID> OpportunityIDList = new List<ID>();

      String recordID = '';

      for (Opportunity Opportunity : OpportunityList) {
        Map<String, Object> OpportunityMap = Opportunity.getPopulatedFieldsAsMap();
        for (String fieldName : OpportunityMap.keySet()) {
          if (fieldName == 'Id') {
            recordID = String.valueOf(OpportunityMap.get(fieldName));
          }

          OpportunityIDList.add(ID.valueOf(recordID));
        }
      }

      if (OpportunityIDList.size() > 0) {
        for (Id OpportunityId : OpportunityIDList) {
          for (
            scaleMatters__Funnel_Conversion_Cycle__c smRecord : sMRecordList
          ) {
            if (OpportunityId == smRecord.scaleMatters__Opportunity__c) {
              smRecord.scaleMatters__Funnel_Group__c = funnelList[0].Name;
            }
          }
        }

        updateOpportunity(sMRecordList);
      } else {
        updateFunnelMethod34(ids);
      }
    } else {
      updateFunnelMethod34(ids);
    }
  }

  public static void updateFunnelMethod34(List<Id> ids) {
    Integer order = 34;

    List<scaleMatters__Funnel_Conversion_Cycle__c> sMRecordList = [
      SELECT id, scaleMatters__Opportunity__c, scaleMatters__Funnel_Group__c
      FROM scaleMatters__Funnel_Conversion_Cycle__c
      WHERE
        scaleMatters__Opportunity__c IN :ids
        AND scaleMatters__Record_Closed__c != TRUE
      LIMIT 1
    ];

    List<Opportunity> Opportunitys = [
      SELECT id, scaleMatters__Funnel_Group__c
      FROM Opportunity
      WHERE Id IN :ids
    ];

    List<scaleMatters__Funnel_Configuration_Mapping__c> funnelList = [
      SELECT Name, scaleMatters__SOQL_Condition__c, scaleMatters__SOQL_Order__c
      FROM scaleMatters__Funnel_Configuration_Mapping__c
      WHERE
        scaleMatters__SOQL_Order__c = :order
        AND scaleMatters__Object__c LIKE 'Opportunity'
    ];

    if (funnelList.size() > 0) {
      String query =
        'Select Id from Opportunity where ' +
        funnelList[0].scaleMatters__SOQL_Condition__c +
        ' AND ID IN : ids';
      List<Opportunity> OpportunityList = database.query(query);
      List<ID> OpportunityIDList = new List<ID>();

      String recordID = '';

      for (Opportunity Opportunity : OpportunityList) {
        Map<String, Object> OpportunityMap = Opportunity.getPopulatedFieldsAsMap();
        for (String fieldName : OpportunityMap.keySet()) {
          if (fieldName == 'Id') {
            recordID = String.valueOf(OpportunityMap.get(fieldName));
          }

          OpportunityIDList.add(ID.valueOf(recordID));
        }
      }

      if (OpportunityIDList.size() > 0) {
        for (Id OpportunityId : OpportunityIDList) {
          for (
            scaleMatters__Funnel_Conversion_Cycle__c smRecord : sMRecordList
          ) {
            if (OpportunityId == smRecord.scaleMatters__Opportunity__c) {
              smRecord.scaleMatters__Funnel_Group__c = funnelList[0].Name;
            }
          }
        }

        updateOpportunity(sMRecordList);
      } else {
        updateFunnelMethod35(ids);
      }
    } else {
      updateFunnelMethod35(ids);
    }
  }

  public static void updateFunnelMethod35(List<Id> ids) {
    Integer order = 35;

    List<scaleMatters__Funnel_Conversion_Cycle__c> sMRecordList = [
      SELECT id, scaleMatters__Opportunity__c, scaleMatters__Funnel_Group__c
      FROM scaleMatters__Funnel_Conversion_Cycle__c
      WHERE
        scaleMatters__Opportunity__c IN :ids
        AND scaleMatters__Record_Closed__c != TRUE
      LIMIT 1
    ];

    List<Opportunity> Opportunitys = [
      SELECT id, scaleMatters__Funnel_Group__c
      FROM Opportunity
      WHERE Id IN :ids
    ];

    List<scaleMatters__Funnel_Configuration_Mapping__c> funnelList = [
      SELECT Name, scaleMatters__SOQL_Condition__c, scaleMatters__SOQL_Order__c
      FROM scaleMatters__Funnel_Configuration_Mapping__c
      WHERE
        scaleMatters__SOQL_Order__c = :order
        AND scaleMatters__Object__c LIKE 'Opportunity'
    ];

    if (funnelList.size() > 0) {
      String query =
        'Select Id from Opportunity where ' +
        funnelList[0].scaleMatters__SOQL_Condition__c +
        ' AND ID IN : ids';
      List<Opportunity> OpportunityList = database.query(query);
      List<ID> OpportunityIDList = new List<ID>();

      String recordID = '';

      for (Opportunity Opportunity : OpportunityList) {
        Map<String, Object> OpportunityMap = Opportunity.getPopulatedFieldsAsMap();
        for (String fieldName : OpportunityMap.keySet()) {
          if (fieldName == 'Id') {
            recordID = String.valueOf(OpportunityMap.get(fieldName));
          }

          OpportunityIDList.add(ID.valueOf(recordID));
        }
      }

      if (OpportunityIDList.size() > 0) {
        for (Id OpportunityId : OpportunityIDList) {
          for (
            scaleMatters__Funnel_Conversion_Cycle__c smRecord : sMRecordList
          ) {
            if (OpportunityId == smRecord.scaleMatters__Opportunity__c) {
              smRecord.scaleMatters__Funnel_Group__c = funnelList[0].Name;
            }
          }
        }

        updateOpportunity(sMRecordList);
      } else {
        updateFunnelMethod36(ids);
      }
    } else {
      updateFunnelMethod36(ids);
    }
  }

  public static void updateFunnelMethod36(List<Id> ids) {
    Integer order = 36;

    List<scaleMatters__Funnel_Conversion_Cycle__c> sMRecordList = [
      SELECT id, scaleMatters__Opportunity__c, scaleMatters__Funnel_Group__c
      FROM scaleMatters__Funnel_Conversion_Cycle__c
      WHERE
        scaleMatters__Opportunity__c IN :ids
        AND scaleMatters__Record_Closed__c != TRUE
      LIMIT 1
    ];

    List<Opportunity> Opportunitys = [
      SELECT id, scaleMatters__Funnel_Group__c
      FROM Opportunity
      WHERE Id IN :ids
    ];

    List<scaleMatters__Funnel_Configuration_Mapping__c> funnelList = [
      SELECT Name, scaleMatters__SOQL_Condition__c, scaleMatters__SOQL_Order__c
      FROM scaleMatters__Funnel_Configuration_Mapping__c
      WHERE
        scaleMatters__SOQL_Order__c = :order
        AND scaleMatters__Object__c LIKE 'Opportunity'
    ];

    if (funnelList.size() > 0) {
      String query =
        'Select Id from Opportunity where ' +
        funnelList[0].scaleMatters__SOQL_Condition__c +
        ' AND ID IN : ids';
      List<Opportunity> OpportunityList = database.query(query);
      List<ID> OpportunityIDList = new List<ID>();

      String recordID = '';

      for (Opportunity Opportunity : OpportunityList) {
        Map<String, Object> OpportunityMap = Opportunity.getPopulatedFieldsAsMap();
        for (String fieldName : OpportunityMap.keySet()) {
          if (fieldName == 'Id') {
            recordID = String.valueOf(OpportunityMap.get(fieldName));
          }

          OpportunityIDList.add(ID.valueOf(recordID));
        }
      }

      if (OpportunityIDList.size() > 0) {
        for (Id OpportunityId : OpportunityIDList) {
          for (
            scaleMatters__Funnel_Conversion_Cycle__c smRecord : sMRecordList
          ) {
            if (OpportunityId == smRecord.scaleMatters__Opportunity__c) {
              smRecord.scaleMatters__Funnel_Group__c = funnelList[0].Name;
            }
          }
        }

        updateOpportunity(sMRecordList);
      } else {
        updateFunnelMethod37(ids);
      }
    } else {
      updateFunnelMethod37(ids);
    }
  }

  public static void updateFunnelMethod37(List<Id> ids) {
    Integer order = 37;

    List<scaleMatters__Funnel_Conversion_Cycle__c> sMRecordList = [
      SELECT id, scaleMatters__Opportunity__c, scaleMatters__Funnel_Group__c
      FROM scaleMatters__Funnel_Conversion_Cycle__c
      WHERE
        scaleMatters__Opportunity__c IN :ids
        AND scaleMatters__Record_Closed__c != TRUE
      LIMIT 1
    ];

    List<Opportunity> Opportunitys = [
      SELECT id, scaleMatters__Funnel_Group__c
      FROM Opportunity
      WHERE Id IN :ids
    ];

    List<scaleMatters__Funnel_Configuration_Mapping__c> funnelList = [
      SELECT Name, scaleMatters__SOQL_Condition__c, scaleMatters__SOQL_Order__c
      FROM scaleMatters__Funnel_Configuration_Mapping__c
      WHERE
        scaleMatters__SOQL_Order__c = :order
        AND scaleMatters__Object__c LIKE 'Opportunity'
    ];

    if (funnelList.size() > 0) {
      String query =
        'Select Id from Opportunity where ' +
        funnelList[0].scaleMatters__SOQL_Condition__c +
        ' AND ID IN : ids';
      List<Opportunity> OpportunityList = database.query(query);
      List<ID> OpportunityIDList = new List<ID>();

      String recordID = '';

      for (Opportunity Opportunity : OpportunityList) {
        Map<String, Object> OpportunityMap = Opportunity.getPopulatedFieldsAsMap();
        for (String fieldName : OpportunityMap.keySet()) {
          if (fieldName == 'Id') {
            recordID = String.valueOf(OpportunityMap.get(fieldName));
          }

          OpportunityIDList.add(ID.valueOf(recordID));
        }
      }

      if (OpportunityIDList.size() > 0) {
        for (Id OpportunityId : OpportunityIDList) {
          for (
            scaleMatters__Funnel_Conversion_Cycle__c smRecord : sMRecordList
          ) {
            if (OpportunityId == smRecord.scaleMatters__Opportunity__c) {
              smRecord.scaleMatters__Funnel_Group__c = funnelList[0].Name;
            }
          }
        }

        updateOpportunity(sMRecordList);
      } else {
        updateFunnelMethod38(ids);
      }
    } else {
      updateFunnelMethod38(ids);
    }
  }

  public static void updateFunnelMethod38(List<Id> ids) {
    Integer order = 38;

    List<scaleMatters__Funnel_Conversion_Cycle__c> sMRecordList = [
      SELECT id, scaleMatters__Opportunity__c, scaleMatters__Funnel_Group__c
      FROM scaleMatters__Funnel_Conversion_Cycle__c
      WHERE
        scaleMatters__Opportunity__c IN :ids
        AND scaleMatters__Record_Closed__c != TRUE
      LIMIT 1
    ];

    List<Opportunity> Opportunitys = [
      SELECT id, scaleMatters__Funnel_Group__c
      FROM Opportunity
      WHERE Id IN :ids
    ];

    List<scaleMatters__Funnel_Configuration_Mapping__c> funnelList = [
      SELECT Name, scaleMatters__SOQL_Condition__c, scaleMatters__SOQL_Order__c
      FROM scaleMatters__Funnel_Configuration_Mapping__c
      WHERE
        scaleMatters__SOQL_Order__c = :order
        AND scaleMatters__Object__c LIKE 'Opportunity'
    ];

    if (funnelList.size() > 0) {
      String query =
        'Select Id from Opportunity where ' +
        funnelList[0].scaleMatters__SOQL_Condition__c +
        ' AND ID IN : ids';
      List<Opportunity> OpportunityList = database.query(query);
      List<ID> OpportunityIDList = new List<ID>();

      String recordID = '';

      for (Opportunity Opportunity : OpportunityList) {
        Map<String, Object> OpportunityMap = Opportunity.getPopulatedFieldsAsMap();
        for (String fieldName : OpportunityMap.keySet()) {
          if (fieldName == 'Id') {
            recordID = String.valueOf(OpportunityMap.get(fieldName));
          }

          OpportunityIDList.add(ID.valueOf(recordID));
        }
      }

      if (OpportunityIDList.size() > 0) {
        for (Id OpportunityId : OpportunityIDList) {
          for (
            scaleMatters__Funnel_Conversion_Cycle__c smRecord : sMRecordList
          ) {
            if (OpportunityId == smRecord.scaleMatters__Opportunity__c) {
              smRecord.scaleMatters__Funnel_Group__c = funnelList[0].Name;
            }
          }
        }

        updateOpportunity(sMRecordList);
      } else {
        updateFunnelMethod39(ids);
      }
    } else {
      updateFunnelMethod39(ids);
    }
  }

  public static void updateFunnelMethod39(List<Id> ids) {
    Integer order = 39;

    List<scaleMatters__Funnel_Conversion_Cycle__c> sMRecordList = [
      SELECT id, scaleMatters__Opportunity__c, scaleMatters__Funnel_Group__c
      FROM scaleMatters__Funnel_Conversion_Cycle__c
      WHERE
        scaleMatters__Opportunity__c IN :ids
        AND scaleMatters__Record_Closed__c != TRUE
      LIMIT 1
    ];

    List<Opportunity> Opportunitys = [
      SELECT id, scaleMatters__Funnel_Group__c
      FROM Opportunity
      WHERE Id IN :ids
    ];

    List<scaleMatters__Funnel_Configuration_Mapping__c> funnelList = [
      SELECT Name, scaleMatters__SOQL_Condition__c, scaleMatters__SOQL_Order__c
      FROM scaleMatters__Funnel_Configuration_Mapping__c
      WHERE
        scaleMatters__SOQL_Order__c = :order
        AND scaleMatters__Object__c LIKE 'Opportunity'
    ];

    if (funnelList.size() > 0) {
      String query =
        'Select Id from Opportunity where ' +
        funnelList[0].scaleMatters__SOQL_Condition__c +
        ' AND ID IN : ids';
      List<Opportunity> OpportunityList = database.query(query);
      List<ID> OpportunityIDList = new List<ID>();

      String recordID = '';

      for (Opportunity Opportunity : OpportunityList) {
        Map<String, Object> OpportunityMap = Opportunity.getPopulatedFieldsAsMap();
        for (String fieldName : OpportunityMap.keySet()) {
          if (fieldName == 'Id') {
            recordID = String.valueOf(OpportunityMap.get(fieldName));
          }

          OpportunityIDList.add(ID.valueOf(recordID));
        }
      }

      if (OpportunityIDList.size() > 0) {
        for (Id OpportunityId : OpportunityIDList) {
          for (
            scaleMatters__Funnel_Conversion_Cycle__c smRecord : sMRecordList
          ) {
            if (OpportunityId == smRecord.scaleMatters__Opportunity__c) {
              smRecord.scaleMatters__Funnel_Group__c = funnelList[0].Name;
            }
          }
        }

        updateOpportunity(sMRecordList);
      } else {
        updateFunnelMethod40(ids);
      }
    } else {
      updateFunnelMethod40(ids);
    }
  }

  public static void updateFunnelMethod40(List<Id> ids) {
    Integer order = 41;

    List<scaleMatters__Funnel_Conversion_Cycle__c> sMRecordList = [
      SELECT id, scaleMatters__Opportunity__c, scaleMatters__Funnel_Group__c
      FROM scaleMatters__Funnel_Conversion_Cycle__c
      WHERE
        scaleMatters__Opportunity__c IN :ids
        AND scaleMatters__Record_Closed__c != TRUE
      LIMIT 1
    ];

    List<Opportunity> Opportunitys = [
      SELECT id, scaleMatters__Funnel_Group__c
      FROM Opportunity
      WHERE Id IN :ids
    ];

    List<scaleMatters__Funnel_Configuration_Mapping__c> funnelList = [
      SELECT Name, scaleMatters__SOQL_Condition__c, scaleMatters__SOQL_Order__c
      FROM scaleMatters__Funnel_Configuration_Mapping__c
      WHERE
        scaleMatters__SOQL_Order__c = :order
        AND scaleMatters__Object__c LIKE 'Opportunity'
    ];

    if (funnelList.size() > 0) {
      String query =
        'Select Id from Opportunity where ' +
        funnelList[0].scaleMatters__SOQL_Condition__c +
        ' AND ID IN : ids';
      List<Opportunity> OpportunityList = database.query(query);
      List<ID> OpportunityIDList = new List<ID>();

      String recordID = '';

      for (Opportunity Opportunity : OpportunityList) {
        Map<String, Object> OpportunityMap = Opportunity.getPopulatedFieldsAsMap();
        for (String fieldName : OpportunityMap.keySet()) {
          if (fieldName == 'Id') {
            recordID = String.valueOf(OpportunityMap.get(fieldName));
          }

          OpportunityIDList.add(ID.valueOf(recordID));
        }
      }

      if (OpportunityIDList.size() > 0) {
        for (Id OpportunityId : OpportunityIDList) {
          for (
            scaleMatters__Funnel_Conversion_Cycle__c smRecord : sMRecordList
          ) {
            if (OpportunityId == smRecord.scaleMatters__Opportunity__c) {
              smRecord.scaleMatters__Funnel_Group__c = funnelList[0].Name;
            }
          }
        }

        updateOpportunity(sMRecordList);
      } else {
        updateFunnelMethod41(ids);
      }
    } else {
      updateFunnelMethod41(ids);
    }
  }

  public static void updateFunnelMethod41(List<Id> ids) {
    Integer order = 10;

    List<scaleMatters__Funnel_Conversion_Cycle__c> sMRecordList = [
      SELECT id, scaleMatters__Opportunity__c, scaleMatters__Funnel_Group__c
      FROM scaleMatters__Funnel_Conversion_Cycle__c
      WHERE
        scaleMatters__Opportunity__c IN :ids
        AND scaleMatters__Record_Closed__c != TRUE
      LIMIT 1
    ];

    List<Opportunity> Opportunitys = [
      SELECT id, scaleMatters__Funnel_Group__c
      FROM Opportunity
      WHERE Id IN :ids
    ];

    List<scaleMatters__Funnel_Configuration_Mapping__c> funnelList = [
      SELECT Name, scaleMatters__SOQL_Condition__c, scaleMatters__SOQL_Order__c
      FROM scaleMatters__Funnel_Configuration_Mapping__c
      WHERE
        scaleMatters__SOQL_Order__c = :order
        AND scaleMatters__Object__c LIKE 'Opportunity'
    ];

    if (funnelList.size() > 0) {
      String query =
        'Select Id from Opportunity where ' +
        funnelList[0].scaleMatters__SOQL_Condition__c +
        ' AND ID IN : ids';
      List<Opportunity> OpportunityList = database.query(query);
      List<ID> OpportunityIDList = new List<ID>();

      String recordID = '';

      for (Opportunity Opportunity : OpportunityList) {
        Map<String, Object> OpportunityMap = Opportunity.getPopulatedFieldsAsMap();
        for (String fieldName : OpportunityMap.keySet()) {
          if (fieldName == 'Id') {
            recordID = String.valueOf(OpportunityMap.get(fieldName));
          }

          OpportunityIDList.add(ID.valueOf(recordID));
        }
      }

      if (OpportunityIDList.size() > 0) {
        for (Id OpportunityId : OpportunityIDList) {
          for (
            scaleMatters__Funnel_Conversion_Cycle__c smRecord : sMRecordList
          ) {
            if (OpportunityId == smRecord.scaleMatters__Opportunity__c) {
              smRecord.scaleMatters__Funnel_Group__c = funnelList[0].Name;
            }
          }
        }

        updateOpportunity(sMRecordList);
      } else {
        updateFunnelMethod42(ids);
      }
    } else {
      updateFunnelMethod42(ids);
    }
  }

  public static void updateFunnelMethod42(List<Id> ids) {
    Integer order = 42;

    List<scaleMatters__Funnel_Conversion_Cycle__c> sMRecordList = [
      SELECT id, scaleMatters__Opportunity__c, scaleMatters__Funnel_Group__c
      FROM scaleMatters__Funnel_Conversion_Cycle__c
      WHERE
        scaleMatters__Opportunity__c IN :ids
        AND scaleMatters__Record_Closed__c != TRUE
      LIMIT 1
    ];

    List<Opportunity> Opportunitys = [
      SELECT id, scaleMatters__Funnel_Group__c
      FROM Opportunity
      WHERE Id IN :ids
    ];

    List<scaleMatters__Funnel_Configuration_Mapping__c> funnelList = [
      SELECT Name, scaleMatters__SOQL_Condition__c, scaleMatters__SOQL_Order__c
      FROM scaleMatters__Funnel_Configuration_Mapping__c
      WHERE
        scaleMatters__SOQL_Order__c = :order
        AND scaleMatters__Object__c LIKE 'Opportunity'
    ];

    if (funnelList.size() > 0) {
      String query =
        'Select Id from Opportunity where ' +
        funnelList[0].scaleMatters__SOQL_Condition__c +
        ' AND ID IN : ids';
      List<Opportunity> OpportunityList = database.query(query);
      List<ID> OpportunityIDList = new List<ID>();

      String recordID = '';

      for (Opportunity Opportunity : OpportunityList) {
        Map<String, Object> OpportunityMap = Opportunity.getPopulatedFieldsAsMap();
        for (String fieldName : OpportunityMap.keySet()) {
          if (fieldName == 'Id') {
            recordID = String.valueOf(OpportunityMap.get(fieldName));
          }

          OpportunityIDList.add(ID.valueOf(recordID));
        }
      }

      if (OpportunityIDList.size() > 0) {
        for (Id OpportunityId : OpportunityIDList) {
          for (
            scaleMatters__Funnel_Conversion_Cycle__c smRecord : sMRecordList
          ) {
            if (OpportunityId == smRecord.scaleMatters__Opportunity__c) {
              smRecord.scaleMatters__Funnel_Group__c = funnelList[0].Name;
            }
          }
        }

        updateOpportunity(sMRecordList);
      } else {
        updateFunnelMethod42(ids);
      }
    } else {
      updateFunnelMethod42(ids);
    }
  }

  public static void updateFunnelMethod43(List<Id> ids) {
    Integer order = 43;

    List<scaleMatters__Funnel_Conversion_Cycle__c> sMRecordList = [
      SELECT id, scaleMatters__Opportunity__c, scaleMatters__Funnel_Group__c
      FROM scaleMatters__Funnel_Conversion_Cycle__c
      WHERE
        scaleMatters__Opportunity__c IN :ids
        AND scaleMatters__Record_Closed__c != TRUE
      LIMIT 1
    ];

    List<Opportunity> Opportunitys = [
      SELECT id, scaleMatters__Funnel_Group__c
      FROM Opportunity
      WHERE Id IN :ids
    ];

    List<scaleMatters__Funnel_Configuration_Mapping__c> funnelList = [
      SELECT Name, scaleMatters__SOQL_Condition__c, scaleMatters__SOQL_Order__c
      FROM scaleMatters__Funnel_Configuration_Mapping__c
      WHERE
        scaleMatters__SOQL_Order__c = :order
        AND scaleMatters__Object__c LIKE 'Opportunity'
    ];

    if (funnelList.size() > 0) {
      String query =
        'Select Id from Opportunity where ' +
        funnelList[0].scaleMatters__SOQL_Condition__c +
        ' AND ID IN : ids';
      List<Opportunity> OpportunityList = database.query(query);
      List<ID> OpportunityIDList = new List<ID>();

      String recordID = '';

      for (Opportunity Opportunity : OpportunityList) {
        Map<String, Object> OpportunityMap = Opportunity.getPopulatedFieldsAsMap();
        for (String fieldName : OpportunityMap.keySet()) {
          if (fieldName == 'Id') {
            recordID = String.valueOf(OpportunityMap.get(fieldName));
          }

          OpportunityIDList.add(ID.valueOf(recordID));
        }
      }

      if (OpportunityIDList.size() > 0) {
        for (Id OpportunityId : OpportunityIDList) {
          for (
            scaleMatters__Funnel_Conversion_Cycle__c smRecord : sMRecordList
          ) {
            if (OpportunityId == smRecord.scaleMatters__Opportunity__c) {
              smRecord.scaleMatters__Funnel_Group__c = funnelList[0].Name;
            }
          }
        }

        updateOpportunity(sMRecordList);
      }
    } else {
      updateOpportunity(sMRecordList);
    }
  }

  public static void updateOpportunity(
    List<scaleMatters__Funnel_Conversion_Cycle__c> smRecordsList
  ) {
    try {
      update smRecordsList;
    } catch (Exception ex) {
      system.debug('Exception: ' + ex);
    }
  }
}

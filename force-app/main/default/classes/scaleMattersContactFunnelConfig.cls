public class scaleMattersContactFunnelConfig {
  @InvocableMethod(label='Run Contact Funnel Update')
  public static void updateFunnelMethod1(List<Id> ids) {
    List<scaleMatters__Funnel_Conversion_Cycle__c> sMRecordList = [
      SELECT id, scaleMatters__Contact__c, scaleMatters__Funnel_Group__c
      FROM scaleMatters__Funnel_Conversion_Cycle__c
      WHERE
        scaleMatters__Contact__c IN :ids
        AND scaleMatters__Record_Closed__c != TRUE
      LIMIT 1
    ];

    List<scaleMatters__Funnel_Configuration_Mapping__c> funnelList = [
      SELECT Name, scaleMatters__SOQL_Condition__c, scaleMatters__SOQL_Order__c
      FROM scaleMatters__Funnel_Configuration_Mapping__c
      WHERE scaleMatters__Object__c LIKE 'Contact'
    ];

    String conditions = getFunnelConditions(1, funnelList);
    String name = getFunnelName(1, funnelList);

    if (conditions != '') {
      String query =
        'Select Id from Contact where ' +
        conditions +
        ' AND ID IN : ids';
      List<Contact> ContactList = database.query(query);
      List<ID> ContactIDList = new List<ID>();

      String recordID = '';

      for (Contact Contact : ContactList) {
        Map<String, Object> ContactMap = Contact.getPopulatedFieldsAsMap();
        for (String fieldName : ContactMap.keySet()) {
          if (fieldName == 'Id') {
            recordID = String.valueOf(ContactMap.get(fieldName));
          }

          ContactIDList.add(ID.valueOf(recordID));
        }
      }

      system.debug('ContactList: ' + ContactList);

      if (ContactIDList.size() > 0) {
        for (Id ContactId : ContactIDList) {
          for (
            scaleMatters__Funnel_Conversion_Cycle__c smRecord : sMRecordList
          ) {
            if (ContactId == smRecord.scaleMatters__Contact__c) {
              smRecord.scaleMatters__Funnel_Group__c = name;
            }
          }
        }

        updateContact(sMRecordList);
      } else {
        updateFunnelMethod2(ids, funnelList, sMRecordList);
      }
    } else {
      updateFunnelMethod2(ids, funnelList, sMRecordList);
    }
  }

  public static void updateFunnelMethod2(
    List<Id> ids,
    List<scaleMatters__Funnel_Configuration_Mapping__c> funnelList,
    List<scaleMatters__Funnel_Conversion_Cycle__c> sMRecordList
  ) {
    system.debug('1');

    String conditions = getFunnelConditions(2, funnelList);
    String name = getFunnelName(2, funnelList);

    if (conditions != '') {
      String query =
        'Select Id from Contact where ' +
        conditions +
        ' AND ID IN : ids';
      List<Contact> ContactList = database.query(query);
      List<ID> ContactIDList = new List<ID>();

      String recordID = '';

      for (Contact Contact : ContactList) {
        Map<String, Object> ContactMap = Contact.getPopulatedFieldsAsMap();
        for (String fieldName : ContactMap.keySet()) {
          if (fieldName == 'Id') {
            recordID = String.valueOf(ContactMap.get(fieldName));
          }

          ContactIDList.add(ID.valueOf(recordID));
        }
      }

      if (ContactIDList.size() > 0) {
        for (Id ContactId : ContactIDList) {
          for (
            scaleMatters__Funnel_Conversion_Cycle__c smRecord : sMRecordList
          ) {
            if (ContactId == smRecord.scaleMatters__Contact__c) {
              smRecord.scaleMatters__Funnel_Group__c = name;
            }
          }
        }

        updateContact(sMRecordList);
      } else {
        updateFunnelMethod3(ids, funnelList, sMRecordList);
      }
    } else {
      updateFunnelMethod3(ids, funnelList, sMRecordList);
    }
  }

  public static void updateFunnelMethod3(
    List<Id> ids,
    List<scaleMatters__Funnel_Configuration_Mapping__c> funnelList,
    List<scaleMatters__Funnel_Conversion_Cycle__c> sMRecordList
  ) {
    system.debug('3');

    String conditions = getFunnelConditions(3, funnelList);
    String name = getFunnelName(3, funnelList);

    if (conditions != '') {
      String query =
        'Select Id from Contact where ' +
        conditions +
        ' AND ID IN : ids';
      List<Contact> ContactList = database.query(query);
      List<ID> ContactIDList = new List<ID>();

      String recordID = '';

      for (Contact Contact : ContactList) {
        Map<String, Object> ContactMap = Contact.getPopulatedFieldsAsMap();
        for (String fieldName : ContactMap.keySet()) {
          if (fieldName == 'Id') {
            recordID = String.valueOf(ContactMap.get(fieldName));
          }

          ContactIDList.add(ID.valueOf(recordID));
        }
      }

      if (ContactIDList.size() > 0) {
        for (Id ContactId : ContactIDList) {
          for (
            scaleMatters__Funnel_Conversion_Cycle__c smRecord : sMRecordList
          ) {
            if (ContactId == smRecord.scaleMatters__Contact__c) {
              smRecord.scaleMatters__Funnel_Group__c = name;
            }
          }
        }

        updateContact(sMRecordList);
      } else {
        updateFunnelMethod4(ids, funnelList, sMRecordList);
      }
    } else {
      updateFunnelMethod4(ids, funnelList, sMRecordList);
    }
  }

  public static void updateFunnelMethod4(
    List<Id> ids,
    List<scaleMatters__Funnel_Configuration_Mapping__c> funnelList,
    List<scaleMatters__Funnel_Conversion_Cycle__c> sMRecordList
  ) {
    system.debug('4');

    String conditions = getFunnelConditions(4, funnelList);
    String name = getFunnelName(4, funnelList);

    if (conditions != '') {
      String query =
        'Select Id from Contact where ' +
        conditions +
        ' AND ID IN : ids';
      List<Contact> ContactList = database.query(query);
      List<ID> ContactIDList = new List<ID>();

      String recordID = '';

      for (Contact Contact : ContactList) {
        Map<String, Object> ContactMap = Contact.getPopulatedFieldsAsMap();
        for (String fieldName : ContactMap.keySet()) {
          if (fieldName == 'Id') {
            recordID = String.valueOf(ContactMap.get(fieldName));
          }

          ContactIDList.add(ID.valueOf(recordID));
        }
      }

      if (ContactIDList.size() > 0) {
        for (Id ContactId : ContactIDList) {
          for (
            scaleMatters__Funnel_Conversion_Cycle__c smRecord : sMRecordList
          ) {
            if (ContactId == smRecord.scaleMatters__Contact__c) {
              smRecord.scaleMatters__Funnel_Group__c = name;
            }
          }
        }

        updateContact(sMRecordList);
      } else {
        updateFunnelMethod5(ids, funnelList, sMRecordList);
      }
    } else {
      updateFunnelMethod5(ids, funnelList, sMRecordList);
    }
  }

  public static void updateFunnelMethod5(
    List<Id> ids,
    List<scaleMatters__Funnel_Configuration_Mapping__c> funnelList,
    List<scaleMatters__Funnel_Conversion_Cycle__c> sMRecordList
  ) {
    system.debug('5');

    String conditions = getFunnelConditions(5, funnelList);
    String name = getFunnelName(5, funnelList);

    if (conditions != '') {
      String query =
        'Select Id from Contact where ' +
        conditions +
        ' AND ID IN : ids';
      List<Contact> ContactList = database.query(query);
      List<ID> ContactIDList = new List<ID>();

      String recordID = '';

      for (Contact Contact : ContactList) {
        Map<String, Object> ContactMap = Contact.getPopulatedFieldsAsMap();
        for (String fieldName : ContactMap.keySet()) {
          if (fieldName == 'Id') {
            recordID = String.valueOf(ContactMap.get(fieldName));
          }

          ContactIDList.add(ID.valueOf(recordID));
        }
      }

      if (ContactIDList.size() > 0) {
        for (Id ContactId : ContactIDList) {
          for (
            scaleMatters__Funnel_Conversion_Cycle__c smRecord : sMRecordList
          ) {
            if (ContactId == smRecord.scaleMatters__Contact__c) {
              smRecord.scaleMatters__Funnel_Group__c = name;
            }
          }
        }

        updateContact(sMRecordList);
      } else {
        updateFunnelMethod6(ids, funnelList, sMRecordList);
      }
    } else {
      updateFunnelMethod6(ids, funnelList, sMRecordList);
    }
  }

  public static void updateFunnelMethod6(
    List<Id> ids,
    List<scaleMatters__Funnel_Configuration_Mapping__c> funnelList,
    List<scaleMatters__Funnel_Conversion_Cycle__c> sMRecordList
  ) {
    system.debug('6');

    String conditions = getFunnelConditions(6, funnelList);
    String name = getFunnelName(6, funnelList);

    if (conditions != '') {
      String query =
        'Select Id from Contact where ' +
        conditions +
        ' AND ID IN : ids';
      List<Contact> ContactList = database.query(query);
      List<ID> ContactIDList = new List<ID>();

      String recordID = '';

      for (Contact Contact : ContactList) {
        Map<String, Object> ContactMap = Contact.getPopulatedFieldsAsMap();
        for (String fieldName : ContactMap.keySet()) {
          if (fieldName == 'Id') {
            recordID = String.valueOf(ContactMap.get(fieldName));
          }

          ContactIDList.add(ID.valueOf(recordID));
        }
      }

      if (ContactIDList.size() > 0) {
        for (Id ContactId : ContactIDList) {
          for (
            scaleMatters__Funnel_Conversion_Cycle__c smRecord : sMRecordList
          ) {
            if (ContactId == smRecord.scaleMatters__Contact__c) {
              smRecord.scaleMatters__Funnel_Group__c = funnelList[0].Name;
            }
          }
        }

        updateContact(sMRecordList);
      } else {
        updateFunnelMethod7(ids, funnelList, sMRecordList);
      }
    } else {
      updateFunnelMethod7(ids, funnelList, sMRecordList);
    }
  }

  public static void updateFunnelMethod7(
    List<Id> ids,
    List<scaleMatters__Funnel_Configuration_Mapping__c> funnelList,
    List<scaleMatters__Funnel_Conversion_Cycle__c> sMRecordList
  ) {
    system.debug('7');

    String conditions = getFunnelConditions(7, funnelList);
    String name = getFunnelName(7, funnelList);

    if (conditions != '') {
      String query =
        'Select Id from Contact where ' +
        conditions +
        ' AND ID IN : ids';
      List<Contact> ContactList = database.query(query);
      List<ID> ContactIDList = new List<ID>();

      String recordID = '';

      for (Contact Contact : ContactList) {
        Map<String, Object> ContactMap = Contact.getPopulatedFieldsAsMap();
        for (String fieldName : ContactMap.keySet()) {
          if (fieldName == 'Id') {
            recordID = String.valueOf(ContactMap.get(fieldName));
          }

          ContactIDList.add(ID.valueOf(recordID));
        }
      }

      if (ContactIDList.size() > 0) {
        for (Id ContactId : ContactIDList) {
          for (
            scaleMatters__Funnel_Conversion_Cycle__c smRecord : sMRecordList
          ) {
            if (ContactId == smRecord.scaleMatters__Contact__c) {
              smRecord.scaleMatters__Funnel_Group__c = name;
            }
          }
        }

        updateContact(sMRecordList);
      } else {
        updateFunnelMethod8(ids, funnelList, sMRecordList);
      }
    } else {
      updateFunnelMethod8(ids, funnelList, sMRecordList);
    }
  }

  public static void updateFunnelMethod8(
    List<Id> ids,
    List<scaleMatters__Funnel_Configuration_Mapping__c> funnelList,
    List<scaleMatters__Funnel_Conversion_Cycle__c> sMRecordList
  ) {
    system.debug('8');

    String conditions = getFunnelConditions(8, funnelList);
    String name = getFunnelName(8, funnelList);

    if (conditions != '') {
      String query =
        'Select Id from Contact where ' +
        conditions +
        ' AND ID IN : ids';
      List<Contact> ContactList = database.query(query);
      List<ID> ContactIDList = new List<ID>();

      String recordID = '';

      for (Contact Contact : ContactList) {
        Map<String, Object> ContactMap = Contact.getPopulatedFieldsAsMap();
        for (String fieldName : ContactMap.keySet()) {
          if (fieldName == 'Id') {
            recordID = String.valueOf(ContactMap.get(fieldName));
          }

          ContactIDList.add(ID.valueOf(recordID));
        }
      }

      if (ContactIDList.size() > 0) {
        for (Id ContactId : ContactIDList) {
          for (
            scaleMatters__Funnel_Conversion_Cycle__c smRecord : sMRecordList
          ) {
            if (ContactId == smRecord.scaleMatters__Contact__c) {
              smRecord.scaleMatters__Funnel_Group__c = name;
            }
          }
        }

        updateContact(sMRecordList);
      } else {
        updateFunnelMethod9(ids, funnelList, sMRecordList);
      }
    } else {
      updateFunnelMethod9(ids, funnelList, sMRecordList);
    }
  }

  public static void updateFunnelMethod9(
    List<Id> ids,
    List<scaleMatters__Funnel_Configuration_Mapping__c> funnelList,
    List<scaleMatters__Funnel_Conversion_Cycle__c> sMRecordList
  ) {
    system.debug('9');

    String conditions = getFunnelConditions(9, funnelList);
    String name = getFunnelName(9, funnelList);

    if (conditions != '') {
      String query =
        'Select Id from Contact where ' +
        conditions +
        ' AND ID IN : ids';
      List<Contact> ContactList = database.query(query);
      List<ID> ContactIDList = new List<ID>();

      String recordID = '';

      for (Contact Contact : ContactList) {
        Map<String, Object> ContactMap = Contact.getPopulatedFieldsAsMap();
        for (String fieldName : ContactMap.keySet()) {
          if (fieldName == 'Id') {
            recordID = String.valueOf(ContactMap.get(fieldName));
          }

          ContactIDList.add(ID.valueOf(recordID));
        }
      }

      if (ContactIDList.size() > 0) {
        for (Id ContactId : ContactIDList) {
          for (
            scaleMatters__Funnel_Conversion_Cycle__c smRecord : sMRecordList
          ) {
            if (ContactId == smRecord.scaleMatters__Contact__c) {
              smRecord.scaleMatters__Funnel_Group__c = name;
            }
          }
        }

        updateContact(sMRecordList);
      } else {
        updateFunnelMethod10(ids, funnelList, sMRecordList);
      }
    } else {
      updateFunnelMethod10(ids, funnelList, sMRecordList);
    }
  }

  public static void updateFunnelMethod10(
    List<Id> ids,
    List<scaleMatters__Funnel_Configuration_Mapping__c> funnelList,
    List<scaleMatters__Funnel_Conversion_Cycle__c> sMRecordList
  ) {
    system.debug('10');

    String conditions = getFunnelConditions(10, funnelList);
    String name = getFunnelName(10, funnelList);

    if (conditions != '') {
      String query =
        'Select Id from Contact where ' +
        conditions +
        ' AND ID IN : ids';
      List<Contact> ContactList = database.query(query);
      List<ID> ContactIDList = new List<ID>();

      String recordID = '';

      for (Contact Contact : ContactList) {
        Map<String, Object> ContactMap = Contact.getPopulatedFieldsAsMap();
        for (String fieldName : ContactMap.keySet()) {
          if (fieldName == 'Id') {
            recordID = String.valueOf(ContactMap.get(fieldName));
          }

          ContactIDList.add(ID.valueOf(recordID));
        }
      }

      if (ContactIDList.size() > 0) {
        for (Id ContactId : ContactIDList) {
          for (
            scaleMatters__Funnel_Conversion_Cycle__c smRecord : sMRecordList
          ) {
            if (ContactId == smRecord.scaleMatters__Contact__c) {
              smRecord.scaleMatters__Funnel_Group__c = name;
            }
          }
        }

        updateContact(sMRecordList);
      } else {
        updateFunnelMethod11(ids, funnelList, sMRecordList);
      }
    } else {
      updateFunnelMethod11(ids, funnelList, sMRecordList);
    }
  }

  public static void updateFunnelMethod11(
    List<Id> ids,
    List<scaleMatters__Funnel_Configuration_Mapping__c> funnelList,
    List<scaleMatters__Funnel_Conversion_Cycle__c> sMRecordList
  ) {
    system.debug('11');

    String conditions = getFunnelConditions(11, funnelList);
    String name = getFunnelName(11, funnelList);

    if (conditions != '') {
      String query =
        'Select Id from Contact where ' +
        conditions +
        ' AND ID IN : ids';
      List<Contact> ContactList = database.query(query);
      List<ID> ContactIDList = new List<ID>();

      String recordID = '';

      for (Contact Contact : ContactList) {
        Map<String, Object> ContactMap = Contact.getPopulatedFieldsAsMap();
        for (String fieldName : ContactMap.keySet()) {
          if (fieldName == 'Id') {
            recordID = String.valueOf(ContactMap.get(fieldName));
          }

          ContactIDList.add(ID.valueOf(recordID));
        }
      }

      if (ContactIDList.size() > 0) {
        for (Id ContactId : ContactIDList) {
          for (
            scaleMatters__Funnel_Conversion_Cycle__c smRecord : sMRecordList
          ) {
            if (ContactId == smRecord.scaleMatters__Contact__c) {
              smRecord.scaleMatters__Funnel_Group__c = name;
            }
          }
        }

        updateContact(sMRecordList);
      } else {
        updateFunnelMethod12(ids, funnelList, sMRecordList);
      }
    } else {
      updateFunnelMethod12(ids, funnelList, sMRecordList);
    }
  }

  public static void updateFunnelMethod12(
    List<Id> ids,
    List<scaleMatters__Funnel_Configuration_Mapping__c> funnelList,
    List<scaleMatters__Funnel_Conversion_Cycle__c> sMRecordList
  ) {
    system.debug('12');

    String conditions = getFunnelConditions(12, funnelList);
    String name = getFunnelName(12, funnelList);

    if (conditions != '') {
      String query =
        'Select Id from Contact where ' +
        conditions +
        ' AND ID IN : ids';
      List<Contact> ContactList = database.query(query);
      List<ID> ContactIDList = new List<ID>();

      String recordID = '';

      for (Contact Contact : ContactList) {
        Map<String, Object> ContactMap = Contact.getPopulatedFieldsAsMap();
        for (String fieldName : ContactMap.keySet()) {
          if (fieldName == 'Id') {
            recordID = String.valueOf(ContactMap.get(fieldName));
          }

          ContactIDList.add(ID.valueOf(recordID));
        }
      }

      if (ContactIDList.size() > 0) {
        for (Id ContactId : ContactIDList) {
          for (
            scaleMatters__Funnel_Conversion_Cycle__c smRecord : sMRecordList
          ) {
            if (ContactId == smRecord.scaleMatters__Contact__c) {
              smRecord.scaleMatters__Funnel_Group__c = name;
            }
          }
        }

        updateContact(sMRecordList);
      } else {
        updateFunnelMethod13(ids, funnelList, sMRecordList);
      }
    } else {
      updateFunnelMethod13(ids, funnelList, sMRecordList);
    }
  }

  public static void updateFunnelMethod13(
    List<Id> ids,
    List<scaleMatters__Funnel_Configuration_Mapping__c> funnelList,
    List<scaleMatters__Funnel_Conversion_Cycle__c> sMRecordList
  ) {
    system.debug('13');

    String conditions = getFunnelConditions(13, funnelList);
    String name = getFunnelName(13, funnelList);

    if (conditions != '') {
      String query =
        'Select Id from Contact where ' +
        conditions +
        ' AND ID IN : ids';
      List<Contact> ContactList = database.query(query);
      List<ID> ContactIDList = new List<ID>();

      String recordID = '';

      for (Contact Contact : ContactList) {
        Map<String, Object> ContactMap = Contact.getPopulatedFieldsAsMap();
        for (String fieldName : ContactMap.keySet()) {
          if (fieldName == 'Id') {
            recordID = String.valueOf(ContactMap.get(fieldName));
          }

          ContactIDList.add(ID.valueOf(recordID));
        }
      }

      if (ContactIDList.size() > 0) {
        for (Id ContactId : ContactIDList) {
          for (
            scaleMatters__Funnel_Conversion_Cycle__c smRecord : sMRecordList
          ) {
            if (ContactId == smRecord.scaleMatters__Contact__c) {
              smRecord.scaleMatters__Funnel_Group__c = name;
            }
          }
        }

        updateContact(sMRecordList);
      } else {
        updateFunnelMethod14(ids, funnelList, sMRecordList);
      }
    } else {
      updateFunnelMethod14(ids, funnelList, sMRecordList);
    }
  }

  public static void updateFunnelMethod14(
    List<Id> ids,
    List<scaleMatters__Funnel_Configuration_Mapping__c> funnelList,
    List<scaleMatters__Funnel_Conversion_Cycle__c> sMRecordList
  ) {
    system.debug('14');

    String conditions = getFunnelConditions(14, funnelList);
    String name = getFunnelName(14, funnelList);

    if (conditions != '') {
      String query =
        'Select Id from Contact where ' +
        conditions +
        ' AND ID IN : ids';
      List<Contact> ContactList = database.query(query);
      List<ID> ContactIDList = new List<ID>();

      String recordID = '';

      for (Contact Contact : ContactList) {
        Map<String, Object> ContactMap = Contact.getPopulatedFieldsAsMap();
        for (String fieldName : ContactMap.keySet()) {
          if (fieldName == 'Id') {
            recordID = String.valueOf(ContactMap.get(fieldName));
          }

          ContactIDList.add(ID.valueOf(recordID));
        }
      }

      if (ContactIDList.size() > 0) {
        for (Id ContactId : ContactIDList) {
          for (
            scaleMatters__Funnel_Conversion_Cycle__c smRecord : sMRecordList
          ) {
            if (ContactId == smRecord.scaleMatters__Contact__c) {
              smRecord.scaleMatters__Funnel_Group__c = name;
            }
          }
        }

        updateContact(sMRecordList);
      } else {
        updateFunnelMethod15(ids, funnelList, sMRecordList);
      }
    } else {
      updateFunnelMethod15(ids, funnelList, sMRecordList);
    }
  }

  public static void updateFunnelMethod15(
    List<Id> ids,
    List<scaleMatters__Funnel_Configuration_Mapping__c> funnelList,
    List<scaleMatters__Funnel_Conversion_Cycle__c> sMRecordList
  ) {
    system.debug('15');

    String conditions = getFunnelConditions(15, funnelList);
    String name = getFunnelName(15, funnelList);

    if (conditions != '') {
      String query =
        'Select Id from Contact where ' +
        conditions +
        ' AND ID IN : ids';
      List<Contact> ContactList = database.query(query);
      List<ID> ContactIDList = new List<ID>();

      String recordID = '';

      for (Contact Contact : ContactList) {
        Map<String, Object> ContactMap = Contact.getPopulatedFieldsAsMap();
        for (String fieldName : ContactMap.keySet()) {
          if (fieldName == 'Id') {
            recordID = String.valueOf(ContactMap.get(fieldName));
          }

          ContactIDList.add(ID.valueOf(recordID));
        }
      }

      if (ContactIDList.size() > 0) {
        for (Id ContactId : ContactIDList) {
          for (
            scaleMatters__Funnel_Conversion_Cycle__c smRecord : sMRecordList
          ) {
            if (ContactId == smRecord.scaleMatters__Contact__c) {
              smRecord.scaleMatters__Funnel_Group__c = name;
            }
          }
        }

        updateContact(sMRecordList);
      } else {
        updateFunnelMethod16(ids, funnelList, sMRecordList);
      }
    } else {
      updateFunnelMethod16(ids, funnelList, sMRecordList);
    }
  }

  public static void updateFunnelMethod16(
    List<Id> ids,
    List<scaleMatters__Funnel_Configuration_Mapping__c> funnelList,
    List<scaleMatters__Funnel_Conversion_Cycle__c> sMRecordList
  ) {
    system.debug('16');

    String conditions = getFunnelConditions(16, funnelList);
    String name = getFunnelName(16, funnelList);

    if (conditions != '') {
      String query =
        'Select Id from Contact where ' +
        conditions +
        ' AND ID IN : ids';
      List<Contact> ContactList = database.query(query);
      List<ID> ContactIDList = new List<ID>();

      String recordID = '';

      for (Contact Contact : ContactList) {
        Map<String, Object> ContactMap = Contact.getPopulatedFieldsAsMap();
        for (String fieldName : ContactMap.keySet()) {
          if (fieldName == 'Id') {
            recordID = String.valueOf(ContactMap.get(fieldName));
          }

          ContactIDList.add(ID.valueOf(recordID));
        }
      }

      if (ContactIDList.size() > 0) {
        for (Id ContactId : ContactIDList) {
          for (
            scaleMatters__Funnel_Conversion_Cycle__c smRecord : sMRecordList
          ) {
            if (ContactId == smRecord.scaleMatters__Contact__c) {
              smRecord.scaleMatters__Funnel_Group__c = name;
            }
          }
        }

        updateContact(sMRecordList);
      } else {
        updateFunnelMethod17(ids, funnelList, sMRecordList);
      }
    } else {
      updateFunnelMethod17(ids, funnelList, sMRecordList);
    }
  }

  public static void updateFunnelMethod17(
    List<Id> ids,
    List<scaleMatters__Funnel_Configuration_Mapping__c> funnelList,
    List<scaleMatters__Funnel_Conversion_Cycle__c> sMRecordList
  ) {
    system.debug('17');

    String conditions = getFunnelConditions(17, funnelList);
    String name = getFunnelName(17, funnelList);

    if (conditions != '') {
      String query =
        'Select Id from Contact where ' +
        conditions +
        ' AND ID IN : ids';
      List<Contact> ContactList = database.query(query);
      List<ID> ContactIDList = new List<ID>();

      String recordID = '';

      for (Contact Contact : ContactList) {
        Map<String, Object> ContactMap = Contact.getPopulatedFieldsAsMap();
        for (String fieldName : ContactMap.keySet()) {
          if (fieldName == 'Id') {
            recordID = String.valueOf(ContactMap.get(fieldName));
          }

          ContactIDList.add(ID.valueOf(recordID));
        }
      }

      if (ContactIDList.size() > 0) {
        for (Id ContactId : ContactIDList) {
          for (
            scaleMatters__Funnel_Conversion_Cycle__c smRecord : sMRecordList
          ) {
            if (ContactId == smRecord.scaleMatters__Contact__c) {
              smRecord.scaleMatters__Funnel_Group__c = name;
            }
          }
        }

        updateContact(sMRecordList);
      } else {
        updateFunnelMethod18(ids, funnelList, sMRecordList);
      }
    } else {
      updateFunnelMethod18(ids, funnelList, sMRecordList);
    }
  }

  public static void updateFunnelMethod18(
    List<Id> ids,
    List<scaleMatters__Funnel_Configuration_Mapping__c> funnelList,
    List<scaleMatters__Funnel_Conversion_Cycle__c> sMRecordList
  ) {
    system.debug('18');

    String conditions = getFunnelConditions(18, funnelList);
    String name = getFunnelName(18, funnelList);

    if (conditions != '') {
      String query =
        'Select Id from Contact where ' +
        conditions +
        ' AND ID IN : ids';
      List<Contact> ContactList = database.query(query);
      List<ID> ContactIDList = new List<ID>();

      String recordID = '';

      for (Contact Contact : ContactList) {
        Map<String, Object> ContactMap = Contact.getPopulatedFieldsAsMap();
        for (String fieldName : ContactMap.keySet()) {
          if (fieldName == 'Id') {
            recordID = String.valueOf(ContactMap.get(fieldName));
          }

          ContactIDList.add(ID.valueOf(recordID));
        }
      }

      if (ContactIDList.size() > 0) {
        for (Id ContactId : ContactIDList) {
          for (
            scaleMatters__Funnel_Conversion_Cycle__c smRecord : sMRecordList
          ) {
            if (ContactId == smRecord.scaleMatters__Contact__c) {
              smRecord.scaleMatters__Funnel_Group__c = name;
            }
          }
        }

        updateContact(sMRecordList);
      } else {
        updateFunnelMethod19(ids, funnelList, sMRecordList);
      }
    } else {
      updateFunnelMethod19(ids, funnelList, sMRecordList);
    }
  }

  public static void updateFunnelMethod19(
    List<Id> ids,
    List<scaleMatters__Funnel_Configuration_Mapping__c> funnelList,
    List<scaleMatters__Funnel_Conversion_Cycle__c> sMRecordList
  ) {
    system.debug('19');

    String conditions = getFunnelConditions(19, funnelList);
    String name = getFunnelName(19, funnelList);

    if (conditions != '') {
      String query =
        'Select Id from Contact where ' +
        conditions +
        ' AND ID IN : ids';
      List<Contact> ContactList = database.query(query);
      List<ID> ContactIDList = new List<ID>();

      String recordID = '';

      for (Contact Contact : ContactList) {
        Map<String, Object> ContactMap = Contact.getPopulatedFieldsAsMap();
        for (String fieldName : ContactMap.keySet()) {
          if (fieldName == 'Id') {
            recordID = String.valueOf(ContactMap.get(fieldName));
          }

          ContactIDList.add(ID.valueOf(recordID));
        }
      }

      if (ContactIDList.size() > 0) {
        for (Id ContactId : ContactIDList) {
          for (
            scaleMatters__Funnel_Conversion_Cycle__c smRecord : sMRecordList
          ) {
            if (ContactId == smRecord.scaleMatters__Contact__c) {
              smRecord.scaleMatters__Funnel_Group__c = name;
            }
          }
        }

        updateContact(sMRecordList);
      } else {
        updateFunnelMethod20(ids, funnelList, sMRecordList);
      }
    } else {
      updateFunnelMethod20(ids, funnelList, sMRecordList);
    }
  }

  public static void updateFunnelMethod20(
    List<Id> ids,
    List<scaleMatters__Funnel_Configuration_Mapping__c> funnelList,
    List<scaleMatters__Funnel_Conversion_Cycle__c> sMRecordList
  ) {
    system.debug('20');

    String conditions = getFunnelConditions(20, funnelList);
    String name = getFunnelName(20, funnelList);

    if (conditions != '') {
      String query =
        'Select Id from Contact where ' +
        conditions +
        ' AND ID IN : ids';
      List<Contact> ContactList = database.query(query);
      List<ID> ContactIDList = new List<ID>();

      String recordID = '';

      for (Contact Contact : ContactList) {
        Map<String, Object> ContactMap = Contact.getPopulatedFieldsAsMap();
        for (String fieldName : ContactMap.keySet()) {
          if (fieldName == 'Id') {
            recordID = String.valueOf(ContactMap.get(fieldName));
          }

          ContactIDList.add(ID.valueOf(recordID));
        }
      }

      if (ContactIDList.size() > 0) {
        for (Id ContactId : ContactIDList) {
          for (
            scaleMatters__Funnel_Conversion_Cycle__c smRecord : sMRecordList
          ) {
            if (ContactId == smRecord.scaleMatters__Contact__c) {
              smRecord.scaleMatters__Funnel_Group__c = name;
            }
          }
        }

        updateContact(sMRecordList);
      } else {
        updateFunnelMethod21(ids, funnelList, sMRecordList);
      }
    } else {
      updateFunnelMethod21(ids, funnelList, sMRecordList);
    }
  }

  public static void updateFunnelMethod21(
    List<Id> ids,
    List<scaleMatters__Funnel_Configuration_Mapping__c> funnelList,
    List<scaleMatters__Funnel_Conversion_Cycle__c> sMRecordList
  ) {
    system.debug('21');

    String conditions = getFunnelConditions(21, funnelList);
    String name = getFunnelName(21, funnelList);

    if (conditions != '') {
      String query =
        'Select Id from Contact where ' +
        conditions +
        ' AND ID IN : ids';
      List<Contact> ContactList = database.query(query);
      List<ID> ContactIDList = new List<ID>();

      String recordID = '';

      for (Contact Contact : ContactList) {
        Map<String, Object> ContactMap = Contact.getPopulatedFieldsAsMap();
        for (String fieldName : ContactMap.keySet()) {
          if (fieldName == 'Id') {
            recordID = String.valueOf(ContactMap.get(fieldName));
          }

          ContactIDList.add(ID.valueOf(recordID));
        }
      }

      if (ContactIDList.size() > 0) {
        for (Id ContactId : ContactIDList) {
          for (
            scaleMatters__Funnel_Conversion_Cycle__c smRecord : sMRecordList
          ) {
            if (ContactId == smRecord.scaleMatters__Contact__c) {
              smRecord.scaleMatters__Funnel_Group__c = name;
            }
          }
        }

        updateContact(sMRecordList);
      } else {
        updateFunnelMethod22(ids, funnelList, sMRecordList);
      }
    } else {
      updateFunnelMethod22(ids, funnelList, sMRecordList);
    }
  }

  public static void updateFunnelMethod22(
    List<Id> ids,
    List<scaleMatters__Funnel_Configuration_Mapping__c> funnelList,
    List<scaleMatters__Funnel_Conversion_Cycle__c> sMRecordList
  ) {
    system.debug('22');

    String conditions = getFunnelConditions(22, funnelList);
    String name = getFunnelName(22, funnelList);

    if (conditions != '') {
      String query =
        'Select Id from Contact where ' +
        conditions +
        ' AND ID IN : ids';
      List<Contact> ContactList = database.query(query);
      List<ID> ContactIDList = new List<ID>();

      String recordID = '';

      for (Contact Contact : ContactList) {
        Map<String, Object> ContactMap = Contact.getPopulatedFieldsAsMap();
        for (String fieldName : ContactMap.keySet()) {
          if (fieldName == 'Id') {
            recordID = String.valueOf(ContactMap.get(fieldName));
          }

          ContactIDList.add(ID.valueOf(recordID));
        }
      }

      if (ContactIDList.size() > 0) {
        for (Id ContactId : ContactIDList) {
          for (
            scaleMatters__Funnel_Conversion_Cycle__c smRecord : sMRecordList
          ) {
            if (ContactId == smRecord.scaleMatters__Contact__c) {
              smRecord.scaleMatters__Funnel_Group__c = name;
            }
          }
        }

        updateContact(sMRecordList);
      } else {
        updateFunnelMethod23(ids, funnelList, sMRecordList);
      }
    } else {
      updateFunnelMethod23(ids, funnelList, sMRecordList);
    }
  }

  public static void updateFunnelMethod23(
    List<Id> ids,
    List<scaleMatters__Funnel_Configuration_Mapping__c> funnelList,
    List<scaleMatters__Funnel_Conversion_Cycle__c> sMRecordList
  ) {
    system.debug('23');

    String conditions = getFunnelConditions(23, funnelList);
    String name = getFunnelName(23, funnelList);

    if (conditions != '') {
      String query =
        'Select Id from Contact where ' +
        conditions +
        ' AND ID IN : ids';
      List<Contact> ContactList = database.query(query);
      List<ID> ContactIDList = new List<ID>();

      String recordID = '';

      for (Contact Contact : ContactList) {
        Map<String, Object> ContactMap = Contact.getPopulatedFieldsAsMap();
        for (String fieldName : ContactMap.keySet()) {
          if (fieldName == 'Id') {
            recordID = String.valueOf(ContactMap.get(fieldName));
          }

          ContactIDList.add(ID.valueOf(recordID));
        }
      }

      if (ContactIDList.size() > 0) {
        for (Id ContactId : ContactIDList) {
          for (
            scaleMatters__Funnel_Conversion_Cycle__c smRecord : sMRecordList
          ) {
            if (ContactId == smRecord.scaleMatters__Contact__c) {
              smRecord.scaleMatters__Funnel_Group__c = name;
            }
          }
        }

        updateContact(sMRecordList);
      } else {
        updateFunnelMethod24(ids, funnelList, sMRecordList);
      }
    } else {
      updateFunnelMethod24(ids, funnelList, sMRecordList);
    }
  }

  public static void updateFunnelMethod24(
    List<Id> ids,
    List<scaleMatters__Funnel_Configuration_Mapping__c> funnelList,
    List<scaleMatters__Funnel_Conversion_Cycle__c> sMRecordList
  ) {
    system.debug('24');

    String conditions = getFunnelConditions(24, funnelList);
    String name = getFunnelName(24, funnelList);

    if (conditions != '') {
      String query =
        'Select Id from Contact where ' +
        conditions +
        ' AND ID IN : ids';
      List<Contact> ContactList = database.query(query);
      List<ID> ContactIDList = new List<ID>();

      String recordID = '';

      for (Contact Contact : ContactList) {
        Map<String, Object> ContactMap = Contact.getPopulatedFieldsAsMap();
        for (String fieldName : ContactMap.keySet()) {
          if (fieldName == 'Id') {
            recordID = String.valueOf(ContactMap.get(fieldName));
          }

          ContactIDList.add(ID.valueOf(recordID));
        }
      }

      if (ContactIDList.size() > 0) {
        for (Id ContactId : ContactIDList) {
          for (
            scaleMatters__Funnel_Conversion_Cycle__c smRecord : sMRecordList
          ) {
            if (ContactId == smRecord.scaleMatters__Contact__c) {
              smRecord.scaleMatters__Funnel_Group__c = name;
            }
          }
        }

        updateContact(sMRecordList);
      } else {
        updateFunnelMethod25(ids, funnelList, sMRecordList);
      }
    } else {
      updateFunnelMethod25(ids, funnelList, sMRecordList);
    }
  }

  public static void updateFunnelMethod25(
    List<Id> ids,
    List<scaleMatters__Funnel_Configuration_Mapping__c> funnelList,
    List<scaleMatters__Funnel_Conversion_Cycle__c> sMRecordList
  ) {
    system.debug('25');

    String conditions = getFunnelConditions(25, funnelList);
    String name = getFunnelName(25, funnelList);

    if (conditions != '') {
      String query =
        'Select Id from Contact where ' +
        conditions +
        ' AND ID IN : ids';
      List<Contact> ContactList = database.query(query);
      List<ID> ContactIDList = new List<ID>();

      String recordID = '';

      for (Contact Contact : ContactList) {
        Map<String, Object> ContactMap = Contact.getPopulatedFieldsAsMap();
        for (String fieldName : ContactMap.keySet()) {
          if (fieldName == 'Id') {
            recordID = String.valueOf(ContactMap.get(fieldName));
          }

          ContactIDList.add(ID.valueOf(recordID));
        }
      }

      if (ContactIDList.size() > 0) {
        for (Id ContactId : ContactIDList) {
          for (
            scaleMatters__Funnel_Conversion_Cycle__c smRecord : sMRecordList
          ) {
            if (ContactId == smRecord.scaleMatters__Contact__c) {
              smRecord.scaleMatters__Funnel_Group__c = name;
            }
          }
        }

        updateContact(sMRecordList);
      } else {
        updateFunnelMethod26(ids, funnelList, sMRecordList);
      }
    } else {
      updateFunnelMethod26(ids, funnelList, sMRecordList);
    }
  }

  public static void updateFunnelMethod26(
    List<Id> ids,
    List<scaleMatters__Funnel_Configuration_Mapping__c> funnelList,
    List<scaleMatters__Funnel_Conversion_Cycle__c> sMRecordList
  ) {
    system.debug('26');

    String conditions = getFunnelConditions(26, funnelList);
    String name = getFunnelName(26, funnelList);

    if (conditions != '') {
      String query =
        'Select Id from Contact where ' +
        conditions +
        ' AND ID IN : ids';
      List<Contact> ContactList = database.query(query);
      List<ID> ContactIDList = new List<ID>();

      String recordID = '';

      for (Contact Contact : ContactList) {
        Map<String, Object> ContactMap = Contact.getPopulatedFieldsAsMap();
        for (String fieldName : ContactMap.keySet()) {
          if (fieldName == 'Id') {
            recordID = String.valueOf(ContactMap.get(fieldName));
          }

          ContactIDList.add(ID.valueOf(recordID));
        }
      }

      if (ContactIDList.size() > 0) {
        for (Id ContactId : ContactIDList) {
          for (
            scaleMatters__Funnel_Conversion_Cycle__c smRecord : sMRecordList
          ) {
            if (ContactId == smRecord.scaleMatters__Contact__c) {
              smRecord.scaleMatters__Funnel_Group__c = name;
            }
          }
        }

        updateContact(sMRecordList);
      } else {
        updateFunnelMethod27(ids, funnelList, sMRecordList);
      }
    } else {
      updateFunnelMethod27(ids, funnelList, sMRecordList);
    }
  }

  public static void updateFunnelMethod27(
    List<Id> ids,
    List<scaleMatters__Funnel_Configuration_Mapping__c> funnelList,
    List<scaleMatters__Funnel_Conversion_Cycle__c> sMRecordList
  ) {
    system.debug('27');

    String conditions = getFunnelConditions(27, funnelList);
    String name = getFunnelName(27, funnelList);

    if (conditions != '') {
      String query =
        'Select Id from Contact where ' +
        conditions +
        ' AND ID IN : ids';
      List<Contact> ContactList = database.query(query);
      List<ID> ContactIDList = new List<ID>();

      String recordID = '';

      for (Contact Contact : ContactList) {
        Map<String, Object> ContactMap = Contact.getPopulatedFieldsAsMap();
        for (String fieldName : ContactMap.keySet()) {
          if (fieldName == 'Id') {
            recordID = String.valueOf(ContactMap.get(fieldName));
          }

          ContactIDList.add(ID.valueOf(recordID));
        }
      }

      if (ContactIDList.size() > 0) {
        for (Id ContactId : ContactIDList) {
          for (
            scaleMatters__Funnel_Conversion_Cycle__c smRecord : sMRecordList
          ) {
            if (ContactId == smRecord.scaleMatters__Contact__c) {
              smRecord.scaleMatters__Funnel_Group__c = name;
            }
          }
        }

        updateContact(sMRecordList);
      } else {
        updateFunnelMethod28(ids, funnelList, sMRecordList);
      }
    } else {
      updateFunnelMethod28(ids, funnelList, sMRecordList);
    }
  }

  public static void updateFunnelMethod28(
    List<Id> ids,
    List<scaleMatters__Funnel_Configuration_Mapping__c> funnelList,
    List<scaleMatters__Funnel_Conversion_Cycle__c> sMRecordList
  ) {
    system.debug('28');

    String conditions = getFunnelConditions(28, funnelList);
    String name = getFunnelName(28, funnelList);

    if (conditions != '') {
      String query =
        'Select Id from Contact where ' +
        conditions +
        ' AND ID IN : ids';
      List<Contact> ContactList = database.query(query);
      List<ID> ContactIDList = new List<ID>();

      String recordID = '';

      for (Contact Contact : ContactList) {
        Map<String, Object> ContactMap = Contact.getPopulatedFieldsAsMap();
        for (String fieldName : ContactMap.keySet()) {
          if (fieldName == 'Id') {
            recordID = String.valueOf(ContactMap.get(fieldName));
          }

          ContactIDList.add(ID.valueOf(recordID));
        }
      }

      if (ContactIDList.size() > 0) {
        for (Id ContactId : ContactIDList) {
          for (
            scaleMatters__Funnel_Conversion_Cycle__c smRecord : sMRecordList
          ) {
            if (ContactId == smRecord.scaleMatters__Contact__c) {
              smRecord.scaleMatters__Funnel_Group__c = name;
            }
          }
        }

        updateContact(sMRecordList);
      } else {
        updateFunnelMethod29(ids, funnelList, sMRecordList);
      }
    } else {
      updateFunnelMethod29(ids, funnelList, sMRecordList);
    }
  }

  public static void updateFunnelMethod29(
    List<Id> ids,
    List<scaleMatters__Funnel_Configuration_Mapping__c> funnelList,
    List<scaleMatters__Funnel_Conversion_Cycle__c> sMRecordList
  ) {
    system.debug('29');

    String conditions = getFunnelConditions(29, funnelList);
    String name = getFunnelName(29, funnelList);

    if (conditions != '') {
      String query =
        'Select Id from Contact where ' +
        conditions +
        ' AND ID IN : ids';
      List<Contact> ContactList = database.query(query);
      List<ID> ContactIDList = new List<ID>();

      String recordID = '';

      for (Contact Contact : ContactList) {
        Map<String, Object> ContactMap = Contact.getPopulatedFieldsAsMap();
        for (String fieldName : ContactMap.keySet()) {
          if (fieldName == 'Id') {
            recordID = String.valueOf(ContactMap.get(fieldName));
          }

          ContactIDList.add(ID.valueOf(recordID));
        }
      }

      if (ContactIDList.size() > 0) {
        for (Id ContactId : ContactIDList) {
          for (
            scaleMatters__Funnel_Conversion_Cycle__c smRecord : sMRecordList
          ) {
            if (ContactId == smRecord.scaleMatters__Contact__c) {
              smRecord.scaleMatters__Funnel_Group__c = name;
            }
          }
        }

        updateContact(sMRecordList);
      } else {
        updateFunnelMethod30(ids, funnelList, sMRecordList);
      }
    } else {
      updateFunnelMethod30(ids, funnelList, sMRecordList);
    }
  }

  public static void updateFunnelMethod30(
    List<Id> ids,
    List<scaleMatters__Funnel_Configuration_Mapping__c> funnelList,
    List<scaleMatters__Funnel_Conversion_Cycle__c> sMRecordList
  ) {
    system.debug('30');

    String conditions = getFunnelConditions(30, funnelList);
    String name = getFunnelName(30, funnelList);

    if (conditions != '') {
      String query =
        'Select Id from Contact where ' +
        conditions +
        ' AND ID IN : ids';
      List<Contact> ContactList = database.query(query);
      List<ID> ContactIDList = new List<ID>();

      String recordID = '';

      for (Contact Contact : ContactList) {
        Map<String, Object> ContactMap = Contact.getPopulatedFieldsAsMap();
        for (String fieldName : ContactMap.keySet()) {
          if (fieldName == 'Id') {
            recordID = String.valueOf(ContactMap.get(fieldName));
          }

          ContactIDList.add(ID.valueOf(recordID));
        }
      }

      if (ContactIDList.size() > 0) {
        for (Id ContactId : ContactIDList) {
          for (
            scaleMatters__Funnel_Conversion_Cycle__c smRecord : sMRecordList
          ) {
            if (ContactId == smRecord.scaleMatters__Contact__c) {
              smRecord.scaleMatters__Funnel_Group__c = name;
            }
          }
        }

        updateContact(sMRecordList);
      } else {
        updateFunnelMethod31(ids, funnelList, sMRecordList);
      }
    } else {
      updateFunnelMethod31(ids, funnelList, sMRecordList);
    }
  }

  public static void updateFunnelMethod31(
    List<Id> ids,
    List<scaleMatters__Funnel_Configuration_Mapping__c> funnelList,
    List<scaleMatters__Funnel_Conversion_Cycle__c> sMRecordList
  ) {
    system.debug('31');

    String conditions = getFunnelConditions(31, funnelList);
    String name = getFunnelName(31, funnelList);

    if (conditions != '') {
      String query =
        'Select Id from Contact where ' +
        conditions +
        ' AND ID IN : ids';
      List<Contact> ContactList = database.query(query);
      List<ID> ContactIDList = new List<ID>();

      String recordID = '';

      for (Contact Contact : ContactList) {
        Map<String, Object> ContactMap = Contact.getPopulatedFieldsAsMap();
        for (String fieldName : ContactMap.keySet()) {
          if (fieldName == 'Id') {
            recordID = String.valueOf(ContactMap.get(fieldName));
          }

          ContactIDList.add(ID.valueOf(recordID));
        }
      }

      if (ContactIDList.size() > 0) {
        for (Id ContactId : ContactIDList) {
          for (
            scaleMatters__Funnel_Conversion_Cycle__c smRecord : sMRecordList
          ) {
            if (ContactId == smRecord.scaleMatters__Contact__c) {
              smRecord.scaleMatters__Funnel_Group__c = name;
            }
          }
        }

        updateContact(sMRecordList);
      } else {
        updateFunnelMethod32(ids, funnelList, sMRecordList);
      }
    } else {
      updateFunnelMethod32(ids, funnelList, sMRecordList);
    }
  }

  public static void updateFunnelMethod32(
    List<Id> ids,
    List<scaleMatters__Funnel_Configuration_Mapping__c> funnelList,
    List<scaleMatters__Funnel_Conversion_Cycle__c> sMRecordList
  ) {
    system.debug('32');

    String conditions = getFunnelConditions(32, funnelList);
    String name = getFunnelName(32, funnelList);

    if (conditions != '') {
      String query =
        'Select Id from Contact where ' +
        conditions +
        ' AND ID IN : ids';
      List<Contact> ContactList = database.query(query);
      List<ID> ContactIDList = new List<ID>();

      String recordID = '';

      for (Contact Contact : ContactList) {
        Map<String, Object> ContactMap = Contact.getPopulatedFieldsAsMap();
        for (String fieldName : ContactMap.keySet()) {
          if (fieldName == 'Id') {
            recordID = String.valueOf(ContactMap.get(fieldName));
          }

          ContactIDList.add(ID.valueOf(recordID));
        }
      }

      if (ContactIDList.size() > 0) {
        for (Id ContactId : ContactIDList) {
          for (
            scaleMatters__Funnel_Conversion_Cycle__c smRecord : sMRecordList
          ) {
            if (ContactId == smRecord.scaleMatters__Contact__c) {
              smRecord.scaleMatters__Funnel_Group__c = name;
            }
          }
        }

        updateContact(sMRecordList);
      } else {
        updateFunnelMethod33(ids, funnelList, sMRecordList);
      }
    } else {
      updateFunnelMethod33(ids, funnelList, sMRecordList);
    }
  }

  public static void updateFunnelMethod33(
    List<Id> ids,
    List<scaleMatters__Funnel_Configuration_Mapping__c> funnelList,
    List<scaleMatters__Funnel_Conversion_Cycle__c> sMRecordList
  ) {
    system.debug('33');

    String conditions = getFunnelConditions(33, funnelList);
    String name = getFunnelName(33, funnelList);

    if (conditions != '') {
      String query =
        'Select Id from Contact where ' +
        conditions +
        ' AND ID IN : ids';
      List<Contact> ContactList = database.query(query);
      List<ID> ContactIDList = new List<ID>();

      String recordID = '';

      for (Contact Contact : ContactList) {
        Map<String, Object> ContactMap = Contact.getPopulatedFieldsAsMap();
        for (String fieldName : ContactMap.keySet()) {
          if (fieldName == 'Id') {
            recordID = String.valueOf(ContactMap.get(fieldName));
          }

          ContactIDList.add(ID.valueOf(recordID));
        }
      }

      if (ContactIDList.size() > 0) {
        for (Id ContactId : ContactIDList) {
          for (
            scaleMatters__Funnel_Conversion_Cycle__c smRecord : sMRecordList
          ) {
            if (ContactId == smRecord.scaleMatters__Contact__c) {
              smRecord.scaleMatters__Funnel_Group__c = name;
            }
          }
        }

        updateContact(sMRecordList);
      } else {
        updateFunnelMethod34(ids, funnelList, sMRecordList);
      }
    } else {
      updateFunnelMethod34(ids, funnelList, sMRecordList);
    }
  }

  public static void updateFunnelMethod34(
    List<Id> ids,
    List<scaleMatters__Funnel_Configuration_Mapping__c> funnelList,
    List<scaleMatters__Funnel_Conversion_Cycle__c> sMRecordList
  ) {
    system.debug('34');

    String conditions = getFunnelConditions(34, funnelList);
    String name = getFunnelName(34, funnelList);

    if (conditions != '') {
      String query =
        'Select Id from Contact where ' +
        conditions +
        ' AND ID IN : ids';
      List<Contact> ContactList = database.query(query);
      List<ID> ContactIDList = new List<ID>();

      String recordID = '';

      for (Contact Contact : ContactList) {
        Map<String, Object> ContactMap = Contact.getPopulatedFieldsAsMap();
        for (String fieldName : ContactMap.keySet()) {
          if (fieldName == 'Id') {
            recordID = String.valueOf(ContactMap.get(fieldName));
          }

          ContactIDList.add(ID.valueOf(recordID));
        }
      }

      if (ContactIDList.size() > 0) {
        for (Id ContactId : ContactIDList) {
          for (
            scaleMatters__Funnel_Conversion_Cycle__c smRecord : sMRecordList
          ) {
            if (ContactId == smRecord.scaleMatters__Contact__c) {
              smRecord.scaleMatters__Funnel_Group__c = name;
            }
          }
        }

        updateContact(sMRecordList);
      } else {
        updateFunnelMethod35(ids, funnelList, sMRecordList);
      }
    } else {
      updateFunnelMethod35(ids, funnelList, sMRecordList);
    }
  }

  public static void updateFunnelMethod35(
    List<Id> ids,
    List<scaleMatters__Funnel_Configuration_Mapping__c> funnelList,
    List<scaleMatters__Funnel_Conversion_Cycle__c> sMRecordList
  ) {
    system.debug('35');

    String conditions = getFunnelConditions(35, funnelList);
    String name = getFunnelName(35, funnelList);

    if (conditions != '') {
      String query =
        'Select Id from Contact where ' +
        conditions +
        ' AND ID IN : ids';
      List<Contact> ContactList = database.query(query);
      List<ID> ContactIDList = new List<ID>();

      String recordID = '';

      for (Contact Contact : ContactList) {
        Map<String, Object> ContactMap = Contact.getPopulatedFieldsAsMap();
        for (String fieldName : ContactMap.keySet()) {
          if (fieldName == 'Id') {
            recordID = String.valueOf(ContactMap.get(fieldName));
          }

          ContactIDList.add(ID.valueOf(recordID));
        }
      }

      if (ContactIDList.size() > 0) {
        for (Id ContactId : ContactIDList) {
          for (
            scaleMatters__Funnel_Conversion_Cycle__c smRecord : sMRecordList
          ) {
            if (ContactId == smRecord.scaleMatters__Contact__c) {
              smRecord.scaleMatters__Funnel_Group__c = name;
            }
          }
        }

        updateContact(sMRecordList);
      } else {
        updateFunnelMethod36(ids, funnelList, sMRecordList);
      }
    } else {
      updateFunnelMethod36(ids, funnelList, sMRecordList);
    }
  }

  public static void updateFunnelMethod36(
    List<Id> ids,
    List<scaleMatters__Funnel_Configuration_Mapping__c> funnelList,
    List<scaleMatters__Funnel_Conversion_Cycle__c> sMRecordList
  ) {
    system.debug('36');

    String conditions = getFunnelConditions(36, funnelList);
    String name = getFunnelName(36, funnelList);

    if (conditions != '') {
      String query =
        'Select Id from Contact where ' +
        conditions +
        ' AND ID IN : ids';
      List<Contact> ContactList = database.query(query);
      List<ID> ContactIDList = new List<ID>();

      String recordID = '';

      for (Contact Contact : ContactList) {
        Map<String, Object> ContactMap = Contact.getPopulatedFieldsAsMap();
        for (String fieldName : ContactMap.keySet()) {
          if (fieldName == 'Id') {
            recordID = String.valueOf(ContactMap.get(fieldName));
          }

          ContactIDList.add(ID.valueOf(recordID));
        }
      }

      if (ContactIDList.size() > 0) {
        for (Id ContactId : ContactIDList) {
          for (
            scaleMatters__Funnel_Conversion_Cycle__c smRecord : sMRecordList
          ) {
            if (ContactId == smRecord.scaleMatters__Contact__c) {
              smRecord.scaleMatters__Funnel_Group__c = name;
            }
          }
        }

        updateContact(sMRecordList);
      } else {
        updateFunnelMethod37(ids, funnelList, sMRecordList);
      }
    } else {
      updateFunnelMethod37(ids, funnelList, sMRecordList);
    }
  }

  public static void updateFunnelMethod37(
    List<Id> ids,
    List<scaleMatters__Funnel_Configuration_Mapping__c> funnelList,
    List<scaleMatters__Funnel_Conversion_Cycle__c> sMRecordList
  ) {
    system.debug('37');

    String conditions = getFunnelConditions(37, funnelList);
    String name = getFunnelName(37, funnelList);

    if (conditions != '') {
      String query =
        'Select Id from Contact where ' +
        conditions +
        ' AND ID IN : ids';
      List<Contact> ContactList = database.query(query);
      List<ID> ContactIDList = new List<ID>();

      String recordID = '';

      for (Contact Contact : ContactList) {
        Map<String, Object> ContactMap = Contact.getPopulatedFieldsAsMap();
        for (String fieldName : ContactMap.keySet()) {
          if (fieldName == 'Id') {
            recordID = String.valueOf(ContactMap.get(fieldName));
          }

          ContactIDList.add(ID.valueOf(recordID));
        }
      }

      if (ContactIDList.size() > 0) {
        for (Id ContactId : ContactIDList) {
          for (
            scaleMatters__Funnel_Conversion_Cycle__c smRecord : sMRecordList
          ) {
            if (ContactId == smRecord.scaleMatters__Contact__c) {
              smRecord.scaleMatters__Funnel_Group__c = name;
            }
          }
        }

        updateContact(sMRecordList);
      } else {
        updateFunnelMethod38(ids, funnelList, sMRecordList);
      }
    } else {
      updateFunnelMethod38(ids, funnelList, sMRecordList);
    }
  }

  public static void updateFunnelMethod38(
    List<Id> ids,
    List<scaleMatters__Funnel_Configuration_Mapping__c> funnelList,
    List<scaleMatters__Funnel_Conversion_Cycle__c> sMRecordList
  ) {
    system.debug('38');

    String conditions = getFunnelConditions(38, funnelList);
    String name = getFunnelName(38, funnelList);

    if (conditions != '') {
      String query =
        'Select Id from Contact where ' +
        conditions +
        ' AND ID IN : ids';
      List<Contact> ContactList = database.query(query);
      List<ID> ContactIDList = new List<ID>();

      String recordID = '';

      for (Contact Contact : ContactList) {
        Map<String, Object> ContactMap = Contact.getPopulatedFieldsAsMap();
        for (String fieldName : ContactMap.keySet()) {
          if (fieldName == 'Id') {
            recordID = String.valueOf(ContactMap.get(fieldName));
          }

          ContactIDList.add(ID.valueOf(recordID));
        }
      }

      if (ContactIDList.size() > 0) {
        for (Id ContactId : ContactIDList) {
          for (
            scaleMatters__Funnel_Conversion_Cycle__c smRecord : sMRecordList
          ) {
            if (ContactId == smRecord.scaleMatters__Contact__c) {
              smRecord.scaleMatters__Funnel_Group__c = name;
            }
          }
        }

        updateContact(sMRecordList);
      } else {
        updateFunnelMethod39(ids, funnelList, sMRecordList);
      }
    } else {
      updateFunnelMethod39(ids, funnelList, sMRecordList);
    }
  }

  public static void updateFunnelMethod39(
    List<Id> ids,
    List<scaleMatters__Funnel_Configuration_Mapping__c> funnelList,
    List<scaleMatters__Funnel_Conversion_Cycle__c> sMRecordList
  ) {
    system.debug('39');

    String conditions = getFunnelConditions(39, funnelList);
    String name = getFunnelName(39, funnelList);

    if (conditions != '') {
      String query =
        'Select Id from Contact where ' +
        conditions +
        ' AND ID IN : ids';
      List<Contact> ContactList = database.query(query);
      List<ID> ContactIDList = new List<ID>();

      String recordID = '';

      for (Contact Contact : ContactList) {
        Map<String, Object> ContactMap = Contact.getPopulatedFieldsAsMap();
        for (String fieldName : ContactMap.keySet()) {
          if (fieldName == 'Id') {
            recordID = String.valueOf(ContactMap.get(fieldName));
          }

          ContactIDList.add(ID.valueOf(recordID));
        }
      }

      if (ContactIDList.size() > 0) {
        for (Id ContactId : ContactIDList) {
          for (
            scaleMatters__Funnel_Conversion_Cycle__c smRecord : sMRecordList
          ) {
            if (ContactId == smRecord.scaleMatters__Contact__c) {
              smRecord.scaleMatters__Funnel_Group__c = name;
            }
          }
        }

        updateContact(sMRecordList);
      } else {
        updateFunnelMethod40(ids, funnelList, sMRecordList);
      }
    } else {
      updateFunnelMethod40(ids, funnelList, sMRecordList);
    }
  }

  public static void updateFunnelMethod40(
    List<Id> ids,
    List<scaleMatters__Funnel_Configuration_Mapping__c> funnelList,
    List<scaleMatters__Funnel_Conversion_Cycle__c> sMRecordList
  ) {
    system.debug('40');

    String conditions = getFunnelConditions(40, funnelList);
    String name = getFunnelName(40, funnelList);

    if (conditions != '') {
      String query =
        'Select Id from Contact where ' +
        conditions +
        ' AND ID IN : ids';
      List<Contact> ContactList = database.query(query);
      List<ID> ContactIDList = new List<ID>();

      String recordID = '';

      for (Contact Contact : ContactList) {
        Map<String, Object> ContactMap = Contact.getPopulatedFieldsAsMap();
        for (String fieldName : ContactMap.keySet()) {
          if (fieldName == 'Id') {
            recordID = String.valueOf(ContactMap.get(fieldName));
          }

          ContactIDList.add(ID.valueOf(recordID));
        }
      }

      if (ContactIDList.size() > 0) {
        for (Id ContactId : ContactIDList) {
          for (
            scaleMatters__Funnel_Conversion_Cycle__c smRecord : sMRecordList
          ) {
            if (ContactId == smRecord.scaleMatters__Contact__c) {
              smRecord.scaleMatters__Funnel_Group__c = name;
            }
          }
        }

        updateContact(sMRecordList);
      } else {
        updateFunnelMethod41(ids, funnelList, sMRecordList);
      }
    } else {
      updateFunnelMethod41(ids, funnelList, sMRecordList);
    }
  }

  public static void updateFunnelMethod41(
    List<Id> ids,
    List<scaleMatters__Funnel_Configuration_Mapping__c> funnelList,
    List<scaleMatters__Funnel_Conversion_Cycle__c> sMRecordList
  ) {
    system.debug('41');

    String conditions = getFunnelConditions(41, funnelList);
    String name = getFunnelName(41, funnelList);

    if (conditions != '') {
      String query =
        'Select Id from Contact where ' +
        conditions +
        ' AND ID IN : ids';
      List<Contact> ContactList = database.query(query);
      List<ID> ContactIDList = new List<ID>();

      String recordID = '';

      for (Contact Contact : ContactList) {
        Map<String, Object> ContactMap = Contact.getPopulatedFieldsAsMap();
        for (String fieldName : ContactMap.keySet()) {
          if (fieldName == 'Id') {
            recordID = String.valueOf(ContactMap.get(fieldName));
          }

          ContactIDList.add(ID.valueOf(recordID));
        }
      }

      if (ContactIDList.size() > 0) {
        for (Id ContactId : ContactIDList) {
          for (
            scaleMatters__Funnel_Conversion_Cycle__c smRecord : sMRecordList
          ) {
            if (ContactId == smRecord.scaleMatters__Contact__c) {
              smRecord.scaleMatters__Funnel_Group__c = name;
            }
          }
        }

        updateContact(sMRecordList);
      } else {
        updateFunnelMethod42(ids, funnelList, sMRecordList);
      }
    } else {
      updateFunnelMethod42(ids, funnelList, sMRecordList);
    }
  }

  public static void updateFunnelMethod42(
    List<Id> ids,
    List<scaleMatters__Funnel_Configuration_Mapping__c> funnelList,
    List<scaleMatters__Funnel_Conversion_Cycle__c> sMRecordList
  ) {
    system.debug('42');

    String conditions = getFunnelConditions(42, funnelList);
    String name = getFunnelName(42, funnelList);

    if (conditions != '') {
      String query =
        'Select Id from Contact where ' +
        conditions +
        ' AND ID IN : ids';
      List<Contact> ContactList = database.query(query);
      List<ID> ContactIDList = new List<ID>();

      String recordID = '';

      for (Contact Contact : ContactList) {
        Map<String, Object> ContactMap = Contact.getPopulatedFieldsAsMap();
        for (String fieldName : ContactMap.keySet()) {
          if (fieldName == 'Id') {
            recordID = String.valueOf(ContactMap.get(fieldName));
          }

          ContactIDList.add(ID.valueOf(recordID));
        }
      }

      if (ContactIDList.size() > 0) {
        for (Id ContactId : ContactIDList) {
          for (
            scaleMatters__Funnel_Conversion_Cycle__c smRecord : sMRecordList
          ) {
            if (ContactId == smRecord.scaleMatters__Contact__c) {
              smRecord.scaleMatters__Funnel_Group__c = name;
            }
          }
        }

        updateContact(sMRecordList);
      } else {
        updateFunnelMethod43(ids, funnelList, sMRecordList);
      }
    } else {
      updateFunnelMethod43(ids, funnelList, sMRecordList);
    }
  }

  public static void updateFunnelMethod43(
    List<Id> ids,
    List<scaleMatters__Funnel_Configuration_Mapping__c> funnelList,
    List<scaleMatters__Funnel_Conversion_Cycle__c> sMRecordList
  ) {
    system.debug('43');

    String conditions = getFunnelConditions(43, funnelList);
    String name = getFunnelName(43, funnelList);

    if (conditions != '') {
      String query =
        'Select Id from Contact where ' +
        conditions +
        ' AND ID IN : ids';
      List<Contact> ContactList = database.query(query);
      List<ID> ContactIDList = new List<ID>();

      String recordID = '';

      for (Contact Contact : ContactList) {
        Map<String, Object> ContactMap = Contact.getPopulatedFieldsAsMap();
        for (String fieldName : ContactMap.keySet()) {
          if (fieldName == 'Id') {
            recordID = String.valueOf(ContactMap.get(fieldName));
          }

          ContactIDList.add(ID.valueOf(recordID));
        }
      }

      if (ContactIDList.size() > 0) {
        for (Id ContactId : ContactIDList) {
          for (
            scaleMatters__Funnel_Conversion_Cycle__c smRecord : sMRecordList
          ) {
            if (ContactId == smRecord.scaleMatters__Contact__c) {
              smRecord.scaleMatters__Funnel_Group__c = name;
            }
          }
        }

        updateContact(sMRecordList);
      } else {
        system.debug('setting undefined');

        for (Id ContactId : ContactIDList) {
          for (
            scaleMatters__Funnel_Conversion_Cycle__c smRecord : sMRecordList
          ) {
            if (ContactId == smRecord.scaleMatters__Contact__c) {
              smRecord.scaleMatters__Funnel_Group__c = 'Undefined';
            }
          }
        }

        updateContact(sMRecordList);
      }
    } else {
      system.debug('setting undefined');

      for (Id ContactId : ids) {
        for (scaleMatters__Funnel_Conversion_Cycle__c smRecord : sMRecordList) {
          if (ContactId == smRecord.scaleMatters__Contact__c) {
            smRecord.scaleMatters__Funnel_Group__c = 'Undefined';
          }
        }
      }

      updateContact(sMRecordList);
    }
  }

  public static void updateContact(
    List<scaleMatters__Funnel_Conversion_Cycle__c> smRecordsList
  ) {
    for (scaleMatters__Funnel_Conversion_Cycle__c sm : smRecordsList) {
      sm.scaleMatters__Fetch_Funnel_Group__c = false;
    }

    try {
      update smRecordsList;
    } catch (Exception ex) {
      system.debug('Exception: ' + ex);
    }
  }

  public static String getFunnelConditions(
    Integer Order,
    List<scaleMatters__Funnel_Configuration_Mapping__c> funnelList
  ) {
    String condition = '';

    for (
      scaleMatters__Funnel_Configuration_Mapping__c funnelRecord : funnelList
    ) {
      if (funnelRecord.scaleMatters__SOQL_Order__c == Order) {
        condition = funnelRecord.scaleMatters__SOQL_Condition__c;
      }
    }

    return condition;
  }

  public static String getFunnelName(
    Integer Order,
    List<scaleMatters__Funnel_Configuration_Mapping__c> funnelList
  ) {
    String name = '';

    for (
      scaleMatters__Funnel_Configuration_Mapping__c funnelRecord : funnelList
    ) {
      if (funnelRecord.scaleMatters__SOQL_Order__c == Order) {
        name = funnelRecord.Name;
      }
    }

    return name;
  }
}

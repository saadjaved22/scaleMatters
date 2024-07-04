public class scaleMattersUpdateMappedDates {
  public static boolean firstRun = true;

  public static List<scaleMatters__Funnel_Conversion_Cycle__c> sMRecordList = new List<scaleMatters__Funnel_Conversion_Cycle__c>();

  public static void updateSMRecords(
    String Obj,
    List<Id> leadIdsList,
    Map<Id, String> oldMappedDate,
    Map<Id, String> newMappedDate
  ) {
    if (Obj == 'Lead') {
      sMRecordList = [
        SELECT
          id,
          scaleMatters__Lead__c,
          scaleMatters__New_Recycle_Mapped_Date__c,
          scaleMatters__Old_Recycle_Mapped_Date__c
        FROM scaleMatters__Funnel_Conversion_Cycle__c
        WHERE
          scaleMatters__Lead__c IN :leadIdsList
          AND scaleMatters__Record_Closed__c = FALSE
      ];

      for (scaleMatters__Funnel_Conversion_Cycle__c sMRecord : sMRecordList) {
        for (ID newleadID : newMappedDate.keySet()) {
          for (Id oldLeadId : oldMappedDate.keySet()) {
            if (newMappedDate.get(newleadID) != oldMappedDate.get(oldLeadId)) {
              sMRecord.scaleMatters__New_Recycle_Mapped_Date__c = DateTime.valueOf(
                newMappedDate.get(newleadID)
              );
              sMRecord.scaleMatters__Old_Recycle_Mapped_Date__c = DateTime.valueOf(
                oldMappedDate.get(oldLeadId)
              );
            }
          }
        }
      }
    } else if (Obj == 'Contact') {
      sMRecordList = [
        SELECT
          id,
          scaleMatters__Lead__c,
          scaleMatters__New_Recycle_Mapped_Date__c,
          scaleMatters__Old_Recycle_Mapped_Date__c
        FROM scaleMatters__Funnel_Conversion_Cycle__c
        WHERE
          scaleMatters__Contact__c IN :leadIdsList
          AND scaleMatters__Record_Closed__c = FALSE
      ];

      for (scaleMatters__Funnel_Conversion_Cycle__c sMRecord : sMRecordList) {
        for (ID newleadID : newMappedDate.keySet()) {
          for (Id oldLeadId : oldMappedDate.keySet()) {
            if (newMappedDate.get(newleadID) != oldMappedDate.get(oldLeadId)) {
              sMRecord.scaleMatters__New_Recycle_Mapped_Date__c = DateTime.valueOf(
                newMappedDate.get(newleadID)
              );
              sMRecord.scaleMatters__Old_Recycle_Mapped_Date__c = DateTime.valueOf(
                oldMappedDate.get(oldLeadId)
              );
            }
          }
        }
      }
    }

    try {
      system.debug('updating smrecords: ' + sMRecordList);

      update sMRecordList;
    } catch (Exception ex) {
      system.debug('Ex: ' + ex.getMessage());
    }

    firstRun = false;
  }
}

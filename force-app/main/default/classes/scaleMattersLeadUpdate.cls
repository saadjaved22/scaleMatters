public class scaleMattersLeadUpdate {
  //invocable method is used to toggle Lead valid and Discard record checkbox and to update Release to Candence Date
  @invocableMethod(Description='Update Lead')
  public static void updateLead(List<Id> ids) {
    List<scaleMatters__Run_Triggers__c> permissionsList = [
      SELECT scaleMatters__Run_Lead_Trigger__c, scaleMatters__Deactivate_All__c
      FROM scaleMatters__Run_Triggers__c
      WHERE
        scaleMatters__Name__c LIKE 'scaleMatters Run Triggers'
        AND isDeleted = FALSE
    ];

    if (
      permissionsList.size() > 0 &&
      !permissionsList[0].scaleMatters__Deactivate_All__c &&
      permissionsList[0].scaleMatters__Run_Lead_Trigger__c
    ) {
      //quering Leads from list of ids passed in this invocable Method from scaleMattersLeadProcess
      List<Lead> leadList = [
        SELECT
          id,
          scaleMatters__sM_Valid_Lead_Record__c,
          scaleMatters__Lead_Discard__c,
          scaleMatters__Valid_Record__c,
          CreatedDate,
          scaleMatters__Released_to_Cadence__c,
          scaleMatters__Lead_2_Date__c
        FROM Lead
        WHERE id IN :ids
      ];

      //quering Valid records mappings list from custom settings records
      List<scaleMatters__Valid_Record_Mapping__c> dateConfigList = [
        SELECT scaleMatters__DLD__c, scaleMatters__HRD__c
        FROM scaleMatters__Valid_Record_Mapping__c
        WHERE
          scaleMatters__Name__c LIKE 'scaleMatters Date Config'
          AND isDeleted = FALSE
      ];

      //quering scaleMatters Excluded Records Object , if A record exists in this list with same id as Lead Record Id it will Check the Discard Chechbox to tue and Valid Checkbox to false
      List<scaleMatters__scaleMatters_Excluded_Records__c> exList = [
        SELECT scaleMatters__Lead__c, scaleMatters__Contact__c
        FROM scaleMatters__scaleMatters_Excluded_Records__c
      ];

      //quering Tasks to update Release to cadence date , value is Task's Activity Date
      List<Task> taskList = [
        SELECT ActivityDate, WhoId, id
        FROM Task
        WHERE WhoId IN :ids AND isClosed = TRUE AND isDeleted = FALSE
        ORDER BY ActivityDate DESC
        ALL ROWS
      ];

      Map<ID, List<DateTime>> taskMapList = new Map<Id, List<DateTime>>();

      for (Task tsk : taskList) {
        taskMapList.put(tsk.WhoId, new List<DateTime>{ tsk.ActivityDate });
      }

      //quering Events to update Release to cadence date , value is Events's Activity Date
      List<Event> eventList = [
        SELECT ActivityDate, id
        FROM Event
        WHERE WhoId IN :ids
        ORDER BY ActivityDate ASC
      ];

      //nested for loop to setting record values

      for (Lead lead : leadList) {
        if (taskList.size() > 0) {
          for (Id taskWhoid : taskMapList.keySet()) {
            if (taskWhoid == lead.id) {
              //checking if tasks exist for this record, if yes than populate release to cadence date
              if (taskList.size() > 0) {
                lead.scaleMatters__Released_to_Cadence__c = Date.newInstance(
                  taskMapList.get(taskWhoid)[0].year(),
                  taskMapList.get(taskWhoid)[0].month(),
                  taskMapList.get(taskWhoid)[0].day() + 1
                );
              }
            }
          }
        } else {
          lead.scaleMatters__Released_to_Cadence__c = null;
        }
      }

      for (Lead leadObj : leadList) {
        if (String.valueOf(exList).contains(leadObj.id)) {
          leadObj.scaleMatters__Lead_Discard__c = true;
          leadObj.scaleMatters__Valid_Record__c = false;
        } else {
          //checking if record is valid as per Mappings stored in scaleMattersValidRecord Custom settings
          if (
            leadObj.CreatedDate >=
            date.newInstance(
              dateConfigList[0].scaleMatters__HRD__c.year(),
              dateConfigList[0].scaleMatters__HRD__c.month(),
              dateConfigList[0].scaleMatters__HRD__c.day()
            ) ||
            leadObj.scaleMatters__Released_to_Cadence__c >=
            date.newInstance(
              dateConfigList[0].scaleMatters__HRD__c.year(),
              dateConfigList[0].scaleMatters__HRD__c.month(),
              dateConfigList[0].scaleMatters__HRD__c.day()
            ) ||
            leadObj.scaleMatters__Lead_2_Date__c >=
            date.newInstance(
              dateConfigList[0].scaleMatters__HRD__c.year(),
              dateConfigList[0].scaleMatters__HRD__c.month(),
              dateConfigList[0].scaleMatters__HRD__c.day()
            )
          ) {
            leadObj.scaleMatters__Valid_Record__c = true;
            leadObj.scaleMatters__Lead_Discard__c = false;
          } else {
            leadObj.scaleMatters__Valid_Record__c = false;
            leadObj.scaleMatters__Lead_Discard__c = true;
          }
        }
      }

      try {
        //updating Lead List

        update leadList;
      } catch (Exception ex) {
        system.debug('Exception: ' + ex);
      }
    } else {
      //permission to run this update was not found, do nothing
    }
  }
}

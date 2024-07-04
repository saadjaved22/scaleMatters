public class scaleMattersTaskUpdate {
  public String linkedInMapping { get; set; }
  public String emailMapping { get; set; }
  public String callMapping { get; set; }

  //method used as default action on Task Mapping VFP to create Default Record in scaleMattersTaskConfig Custom Settings
  public static void createTaskMapping() {
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

    List<scaleMatters__Task_Mapping__c> taskMappingList = [
      SELECT id
      FROM scaleMatters__Task_Mapping__c
      WHERE
        scaleMatters__Name__c LIKE 'scaleMatters Task Mapping'
        AND isdeleted = FALSE
    ];
    if (taskMappingList.size() == 0) {
      scaleMatters__Task_Mapping__c taskMapping = new scaleMatters__Task_Mapping__c();
      taskMapping.scaleMatters__Name__c = 'scaleMatters Task Mapping';
      taskMapping.scaleMatters__LinkedIn_Mapping__c = '';
      taskMapping.scaleMatters__Email_Mapping__c = '';
      taskMapping.scaleMatters__Call_Mapping__c = '';

      insert taskMapping;
    }
  }

  //method used for storing updated values in scaleMattersTaskConfig Custom Setting from Task Mapping VFP
  public void updateTaskMapping() {
    List<scaleMatters__Task_Mapping__c> taskMappingList = [
      SELECT
        id,
        scaleMatters__LinkedIn_Mapping__c,
        scaleMatters__Email_Mapping__c,
        scaleMatters__Call_Mapping__c
      FROM scaleMatters__Task_Mapping__c
      WHERE
        scaleMatters__Name__c LIKE 'scaleMatters Task Mapping'
        AND isdeleted = FALSE
    ];
    if (taskMappingList.size() > 0) {
      taskMappingList[0].scaleMatters__LinkedIn_Mapping__c = linkedInMapping;
      taskMappingList[0].scaleMatters__Email_Mapping__c = emailMapping;
      taskMappingList[0].scaleMatters__Call_Mapping__c = callMapping;

      update taskMappingList;
    }
  }

  //invocable method is being called from scaleMattersActivityProcess whenever a task is created to Stamp Activity Type field
  @invocableMethod(Description='Update Tasks')
  public static void updateTask(List<Id> ids) {
    List<scaleMatters__Run_Triggers__c> permissionsList = [
      SELECT
        scaleMatters__Run_Activity_Trigger__c,
        scaleMatters__Deactivate_All__c
      FROM scaleMatters__Run_Triggers__c
      WHERE
        scaleMatters__Name__c LIKE 'scaleMatters Run Triggers'
        AND isDeleted = FALSE
    ];

    if (
      permissionsList.size() > 0 &&
      !permissionsList[0].scaleMatters__Deactivate_All__c &&
      permissionsList[0].scaleMatters__Run_Activity_Trigger__c
    ) {
      //quering mappings stored in scaleMattersTaskConfig Custom Settings Object
      List<scaleMatters__Task_Mapping__c> taskMappingList = [
        SELECT
          scaleMatters__Call_Mapping__c,
          scaleMatters__Email_Mapping__c,
          scaleMatters__LinkedIn_Mapping__c
        FROM scaleMatters__Task_Mapping__c
        WHERE
          scaleMatters__Name__c LIKE 'scaleMatters Task Mapping'
          AND isDeleted = FALSE
      ];

      //List of ids to store owner ids from activity object
      List<ID> ownerIDList = new List<Id>();

      //quering Tasks from ids passed in as list in this Invocable Method
      List<Task> activityList = [
        SELECT
          OwnerId,
          scaleMatters__Owner_Role__c,
          WhatId,
          WhoId,
          Subject,
          scaleMatters__Activity_Type__c,
          scaleMatters__Original_WhatID__c,
          scaleMatters__Original_WhoID__c
        FROM Task
        WHERE Id IN :ids
      ];

      //inserting Task owners ids to ownerIDList
      for (Task tsk : activityList) {
        ownerIDList.add(tsk.OwnerId);
      }

      //quering Task's Owners Roles
      List<User> userRoleList = [
        SELECT scaleMatters__Current_Role__c, UserRole.Name, id
        FROM User
        WHERE Id IN :ownerIDList
      ];

      //nested for loop to update records
      for (Task tsk : activityList) {
        for (User usr : userRoleList) {
          //checking if task ownerid is equal to users ids to update owners roles
          if (tsk.OwnerId == usr.id) {
            tsk.scaleMatters__Original_WhatID__c = tsk.WhatId;
            tsk.scaleMatters__Original_WhoID__c = tsk.WhoId;
            tsk.scaleMatters__Owner_Role__c = usr.scaleMatters__Current_Role__c;
          }
        }
      }

      //getting LinkedIn Mapping stored in custom settings and passing to getLinkedInTasks to be used in Dynamic SOQL Query
      if (taskMappingList[0].scaleMatters__LinkedIn_Mapping__c != null) {
        getLinkedInTasks(taskMappingList, ids, activityList);
      } else {
        UpdateTask(activityList);
      }

      //getting Email Mapping stored in custom settings and passing to getEmailTasks to be used in Dynamic SOQL Query
      if (
        taskMappingList[0].scaleMatters__Email_Mapping__c != null &&
        taskMappingList[0].scaleMatters__LinkedIn_Mapping__c == null
      ) {
        getEmailTasks(taskMappingList, ids, activityList);
      }

      //getting Call Mapping stored in custom settings and passing to getCallTasks to be used in Dynamic SOQL Query
      if (
        taskMappingList[0].scaleMatters__Email_Mapping__c == null &&
        taskMappingList[0].scaleMatters__LinkedIn_Mapping__c == null &&
        taskMappingList[0].scaleMatters__Call_Mapping__c != null
      ) {
        getCallTasks(taskMappingList, ids, activityList);
      }
    } else {
      //permission to run this update was not found, do nothing
    }
  }

  //method used to query / set values for linkedIn Tasks
  public static void getLinkedInTasks(
    List<scaleMatters__Task_Mapping__c> taskMappingList,
    List<Id> newSet,
    List<Task> tasks
  ) {
    List<ID> taskIDList = new List<ID>();

    String Conditions = '';

    if (taskMappingList[0].scaleMatters__LinkedIn_Mapping__c != null) {
      Conditions = taskMappingList[0].scaleMatters__LinkedIn_Mapping__c;
    }

    String query =
      'Select Id from Task where ' +
      conditions +
      ' AND ID IN : newSet';
    List<Task> taskList = database.query(query);

    String recordID = '';

    for (Task tsk : taskList) {
      Map<String, Object> taskMap = tsk.getPopulatedFieldsAsMap();
      for (String fieldName : taskMap.keySet()) {
        if (fieldName == 'Id') {
          recordID = String.valueOf(taskMap.get(fieldName));
        }
      }

      taskIDList.add(recordID);
    }

    for (Task tsk : tasks) {
      for (Id tskId : taskIDList) {
        if (tsk.Id == tskId) {
          tsk.scaleMatters__Activity_Type__c = 'LinkedIn';
        }
      }
    }

    if (taskMappingList[0].scaleMatters__Email_Mapping__c != null) {
      getEmailTasks(taskMappingList, newSet, tasks);
    } else {
      UpdateTask(tasks);
    }
  }

  //method used to query / set values for Email Tasks
  public static void getEmailTasks(
    List<scaleMatters__Task_Mapping__c> taskMappingList,
    List<Id> newSet,
    List<Task> tasks
  ) {
    List<ID> taskIDList = new List<ID>();

    String Conditions = '';

    if (taskMappingList[0].scaleMatters__Email_Mapping__c != null) {
      Conditions = taskMappingList[0].scaleMatters__Email_Mapping__c;
    }

    String query =
      'Select Id from Task where ' +
      conditions +
      ' AND ID IN : newSet';
    List<Task> taskList = database.query(query);

    String recordID = '';

    for (Task tsk : taskList) {
      Map<String, Object> taskMap = tsk.getPopulatedFieldsAsMap();
      for (String fieldName : taskMap.keySet()) {
        if (fieldName == 'Id') {
          recordID = String.valueOf(taskMap.get(fieldName));
        }
      }

      taskIDList.add(recordID);
    }

    for (Task tsk : tasks) {
      for (Id tskId : taskIDList) {
        if (tsk.Id == tskId) {
          tsk.scaleMatters__Activity_Type__c = 'Email';
        }
      }
    }

    if (taskMappingList[0].scaleMatters__Call_Mapping__c != null) {
      getCallTasks(taskMappingList, newSet, tasks);
    } else {
      updateTask(tasks);
    }
  }

  //method used to query / set values for Call Tasks
  public static void getCallTasks(
    List<scaleMatters__Task_Mapping__c> taskMappingList,
    List<Id> newSet,
    List<Task> tasks
  ) {
    List<ID> taskIDList = new List<ID>();

    String Conditions = '';

    if (taskMappingList[0].scaleMatters__Call_Mapping__c != null) {
      Conditions = taskMappingList[0].scaleMatters__Call_Mapping__c;
    }

    String query =
      'Select Id from Task where ' +
      conditions +
      ' AND ID IN : newSet';
    List<Task> taskList = database.query(query);

    String recordID = '';

    for (Task tsk : taskList) {
      Map<String, Object> taskMap = tsk.getPopulatedFieldsAsMap();
      for (String fieldName : taskMap.keySet()) {
        if (fieldName == 'Id') {
          recordID = String.valueOf(taskMap.get(fieldName));
        }
      }

      taskIDList.add(recordID);
    }

    for (Task tsk : tasks) {
      for (Id tskId : taskIDList) {
        if (tsk.Id == tskId) {
          tsk.scaleMatters__Activity_Type__c = 'Call';
        }
      }
    }

    UpdateTask(tasks);
  }

  //method used to update Task List
  public static void UpdateTask(List<Task> tasks) {
    for (Task ts : tasks) {
      if (
        ts.scaleMatters__Activity_Type__c != 'LinkedIn' &&
        ts.scaleMatters__Activity_Type__c != 'Call' &&
        ts.scaleMatters__Activity_Type__c != 'Email'
      ) {
        ts.scaleMatters__Activity_Type__c = 'Other';
      }
    }

    update tasks;
  }
}

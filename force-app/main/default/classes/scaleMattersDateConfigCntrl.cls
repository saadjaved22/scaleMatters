public class scaleMattersDateConfigCntrl {
  public Date hrd { get; set; }
  public Date dld { get; set; }

  public static void createDateConfig() {
    List<scaleMatters__Valid_Record_Mapping__c> dateConfigList = [
      SELECT scaleMatters__DLD__c, scaleMatters__HRD__c
      FROM scaleMatters__Valid_Record_Mapping__c
      WHERE
        scaleMatters__Name__c LIKE 'scaleMatters Date Config'
        AND isDeleted = FALSE
    ];
    if (dateConfigList.size() == 0) {
      scaleMatters__Valid_Record_Mapping__c dateConfig = new scaleMatters__Valid_Record_Mapping__c();
      dateConfig.scaleMatters__Name__c = 'scaleMatters Date Config';
      insert dateConfig;
    }

    createPermissionRecord();
  }

  public static void createPermissionRecord() {
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
  }

  public void updateDateConfig() {
    List<scaleMatters__Valid_Record_Mapping__c> dateConfigList = [
      SELECT scaleMatters__DLD__c, scaleMatters__HRD__c
      FROM scaleMatters__Valid_Record_Mapping__c
      WHERE
        scaleMatters__Name__c LIKE 'scaleMatters Date Config'
        AND isDeleted = FALSE
    ];

    if (dateConfigList.size() > 0) {
      dateConfigList[0].scaleMatters__DLD__c = dld;
      dateConfigList[0].scaleMatters__HRD__c = hrd;

      update dateConfigList;
    }
  }
}

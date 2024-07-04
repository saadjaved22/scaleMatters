trigger scaleMattersOpportunityTrigger on Opportunity(after delete) {
  List<scaleMatters__Run_Triggers__c> runTriggersList = [
    SELECT
      scaleMatters__Deactivate_All__c,
      scaleMatters__Run_Delete_Trigger__c,
      scaleMatters__Run_Discard_Trigger__c
    FROM scaleMatters__Run_Triggers__c
    WHERE
      scaleMatters__Name__c LIKE 'scaleMatters Run Triggers'
      AND isDeleted = FALSE
  ];
  if (
    runTriggersList.size() > 0 &&
    runTriggersList[0].scaleMatters__Run_Discard_Trigger__c &&
    runTriggersList[0].scaleMatters__Deactivate_All__c != true
  ) {
    /**
     if(Trigger.isUpdate){
        
        //creating Map to store record ids and Discard value from Trigger.Old context variable    
        Map<ID,Boolean> oldDiscardMap = new Map<ID,Boolean>();
        
        //creating List of Discard Object to create bulkified discard records 
        List<scaleMatters__Discarded_Record__c> discList = new List<scaleMatters__Discarded_Record__c>();
        
        for(Opportunity opp: Trigger.Old){
            
        oldDiscardMap.put(opp.ID, opp.scaleMatters__Opportunity_Discard__c);
            
        }    
    	
        for(Opportunity opp: Trigger.New){
            
            //running loop on Old Discard Map to verify if Discard checkbox was set to true and its old values was not true
            for(Id oppId : oldDiscardMap.keyset()){
                if(opp.ID == oppId && opp.scaleMatters__Opportunity_Discard__c != oldDiscardMap.get(oppId) && opp.scaleMatters__Opportunity_Discard__c){
                    scaleMatters__Discarded_Record__c discObj = new scaleMatters__Discarded_Record__c();
           			discObj.scaleMatters__Discarded_Business_Unit__c = opp.scaleMatters__Business_Unit__c;
           			discObj.scaleMatters__Discarded_Date_Time__c = system.Now();
           			discObj.scaleMatters__Discarded_Object__c = 'Opportunity'; 
           			discObj.scaleMatters__Discarded_SafeID__c = opp.Id;
           			discList.add(discObj);  
                    
                }
            }    
                   
       }
        
        //checking if Discard List contains any records, if yes insert this List 
        if(discList.size()>0){
            system.debug('creating discards' + discList);
            insert discList;
        }
         

    }
       **/

    //execute this block whenever Opportunityn record is deleted
    if (Trigger.isDelete) {
      //creating list of Deleted Records to insert bulkified delete records
      List<scaleMatters__Deleted_Record__c> delList = new List<scaleMatters__Deleted_Record__c>();

      for (Opportunity opp : Trigger.Old) {
        scaleMatters__Deleted_Record__c delObj = new scaleMatters__Deleted_Record__c();
        delObj.scaleMatters__Deleted_Business_Unit__c = opp.scaleMatters__Business_Unit__c;
        delObj.scaleMatters__Deleted_Date_Time__c = system.Now();
        delObj.scaleMatters__Deleted_Object__c = 'Opportunity';
        delObj.scaleMatters__Deleted_SafeID__c = opp.ID;
        delList.add(delObj);
      }
      //checking if delete List contains any records, if yes insert this List
      if (delList.size() > 0) {
        insert delList;
      }
    }
  } else {
    //do nothing as permission to run this trigger was revoked
  }

}

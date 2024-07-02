trigger scaleMattersContactTrigger on Contact (after Delete, after Update) {
    
    //checking if permission to run triggers exists in custom settings object
    List<scaleMatters__Run_Triggers__c> runTriggersList = [Select scaleMatters__Deactivate_All__c, scaleMatters__Run_Delete_Trigger__c	, scaleMatters__Run_Discard_Trigger__c from scaleMatters__Run_Triggers__c where scaleMatters__Name__c LIKE 'scaleMatters Run Triggers' AND isDeleted = false ];
	
    if(runTriggersList.size()>0 && runTriggersList[0].scaleMatters__Deactivate_All__c != true){
    
    if(runTriggersList[0].scaleMatters__Run_Discard_Trigger__c){
    //execute this block whenever Contact record is Updated    
    if(Trigger.isUpdate){
        
        
    List<scaleMatters__CycleMapping__c> cycleList = [ select scaleMatters__Contact_Cycle_Date__c from scaleMatters__CycleMapping__c where scaleMatters__Cycle_Name__c Like 'scaleMatters Cycle Mapping' AND Isdeleted = false];
    ID leadObjId;
    List<ID> leadIdsList = new List<Id>();    
        
    Map<Id, String> oldMappedDate = new Map<Id,String>();
    Map<Id, String> newMappedDate = new Map<Id,String>();
        
    for(Contact lead: Trigger.new){
        
            leadIdsList.add(lead.id);
        
        	leadObjId = lead.id;
            
            Map<String, Object> leadMap = lead.getPopulatedFieldsAsMap();
        
             String recordID;
        
            for (String fieldName : leadMap.keySet()){
                
                if( fieldName == 'Id' ){
                    
                    recordID = String.valueOf(leadMap.get(fieldName));
                    system.debug('recordID' + recordID);
                    
                }                
                if(fieldName == cycleList[0].scaleMatters__Contact_Cycle_Date__c){
                    
                    newMappedDate.put(recordID, String.valueOf(leadMap.get(fieldName)));
                    
                }
                
               
                
                     
                
            }
            
            
        }
        
    for(Contact lead: Trigger.old){
            
            Map<String, Object> leadMap = lead.getPopulatedFieldsAsMap();
        
            String recordID;
            
            for (String fieldName : leadMap.keySet()){
                
                 if( fieldName == 'Id' ){
                    
                    recordID = String.valueOf(leadMap.get(fieldName));
                    
                }   
                
                if(fieldName == cycleList[0].scaleMatters__Contact_Cycle_Date__c){
                    
                    oldMappedDate.put(recordID, String.valueOf(leadMap.get(fieldName)));
                    
                }
                
               
                
                     
                
            }
            
            
        }
        
    if(scaleMattersUpdateMappedDates.firstRun){  
            
     scaleMattersUpdateMappedDates.updateSMRecords('Contact',leadIdsList , oldMappedDate , newMappedDate );
            
    }
        
        //creating Map to store record ids and Discard value from Trigger.Old context variable
        Map<ID,Boolean> oldDiscardMap = new Map<ID,Boolean>();
        //creating List of Discard Object to create bulkified discard records
    	List<scaleMatters__Discarded_Record__c> discList = new List<scaleMatters__Discarded_Record__c>();
        
        for(Contact con : Trigger.Old){
            oldDiscardMap.put(con.id, con.scaleMatters__Contact_Discard__c);
        }
        
    	for(Contact con: Trigger.New){
            //running loop on Old Discard Map to verify if Discard checkbox was set to true and its old values was not true
            for(ID conID: oldDiscardMap.keySet()){
                if(con.id == conID && con.scaleMatters__Contact_Discard__c != oldDiscardMap.get(conID) && con.scaleMatters__Contact_Discard__c ){
                    scaleMatters__Discarded_Record__c discObj = new scaleMatters__Discarded_Record__c();
            		discObj.scaleMatters__Discarded_Business_Unit__c = con.scaleMatters__Business_Unit__c;
            		discObj.scaleMatters__Discarded_Date_Time__c = system.Now();
            		discObj.scaleMatters__Discarded_Object__c = 'Contact'; 
            		discObj.scaleMatters__Discarded_SafeID__c = con.ID;
            		discList.add(discObj);  
                }
            }
            
                
    }
        //checking if Discard List contains any records, if yes insert this List
        if(discList.size()>0){
    	insert discList;   
        }
    
    }
    }else{
        
        //do nothing as permission to run this trigger was revoked
        
    }
        
    if(runTriggersList[0].scaleMatters__Run_Delete_Trigger__c){
    //execute this block whenever Contact record is deleted    
    if(Trigger.isDelete){
    //creating List of Delete Object to create bulkified discard records     
    List<scaleMatters__Deleted_Record__c> delList = new List<scaleMatters__Deleted_Record__c>();
        
    for(Contact con: Trigger.Old){
        
        scaleMatters__Deleted_Record__c delObj = new scaleMatters__Deleted_Record__c();
        delObj.scaleMatters__Deleted_Business_Unit__c = con.scaleMatters__Business_Unit__c;
        delObj.scaleMatters__Deleted_Date_Time__c = system.Now();
        delObj.scaleMatters__Deleted_Object__c = 'Contact'; 
        delObj.scaleMatters__Deleted_SafeID__c = con.Id;
        delList.add(delObj);

    }
    //checking if delete List contains any records, if yes insert this List
    if(delList.size()>0){    
    insert delList;
    }
    
    }    
    }else{
        
       //do nothing as permission to run this trigger was revoked 
        
    }
    }else{
        
        //do nothing as permission to run this trigger was revoked
        
    }
}
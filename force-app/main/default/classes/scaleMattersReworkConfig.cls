public class scaleMattersReworkConfig {
    
    @InvocableMethod(label='Run Rework Update')
    public static void updateRework(List<Id> ids){
        
        
        List<scaleMatters__Funnel_Conversion_Cycle__c> sMRecordList = [Select scaleMatters__Contact__c, Contact__r.AccountId , Opportunity__r.AccountId, Lead__r.Name, id,scaleMatters__Lead__c, scaleMatters__Cycle_Attempt__c,  scaleMatters__New_Recycle_Mapped_Date__c, scaleMatters__Old_Recycle_Mapped_Date__c,scaleMatters__Opportunity__c, scaleMatters__Opportunity_IsClosed__c, scaleMatters__Record_Closed__c from scaleMatters__Funnel_Conversion_Cycle__c where ID IN :ids AND scaleMatters__Record_Closed__c = false ];
        List<scaleMatters__CycleMapping__c> cycleMappingList = [select scaleMatters__Lead_Cycle_Date__c , scaleMatters__Number_of_Days_for_New_Record__c , scaleMatters__ScheduledDays__c from scaleMatters__CycleMapping__c where scaleMatters__Cycle_Name__c Like 'scaleMatters Cycle Mapping' AND isDeleted = false ];
                
        for(scaleMatters__Funnel_Conversion_Cycle__c smRecord: sMRecordList){
            
            
            if(smRecord.scaleMatters__New_Recycle_Mapped_Date__c != Null && smRecord.scaleMatters__Old_Recycle_Mapped_Date__c != Null){
                
            
            if((Date.valueOf(smRecord.scaleMatters__Old_Recycle_Mapped_Date__c).daysBetween(Date.valueof(smRecord.scaleMatters__New_Recycle_Mapped_Date__c)) >= cycleMappingList[0].scaleMatters__Number_of_Days_for_New_Record__c && smRecord.scaleMatters__Opportunity__c == Null &&  smRecord.scaleMatters__Opportunity_IsClosed__c == false )){
                
                smRecord.scaleMatters__Record_Closed__c = true;
                createSMRecord(sMRecordList);
                
            }
                
            }
            
            
        }
        
        try{
            
            update sMRecordList;
            
        }catch(Exception ex){
            
            system.debug('Exception: ' + ex.getMessage());
            
        }
        
        
    }
   
    public static void createSMRecord(List<scaleMatters__Funnel_Conversion_Cycle__c> sMRecordList){
        
        scaleMatters__Funnel_Conversion_Cycle__c sMObj = new scaleMatters__Funnel_Conversion_Cycle__c();        
        sMObj.scaleMatters__Cycle_Type__c = 'Rework';
        sMObj.scaleMatters__Cycle_Object__c = 'Contact';
       	sMObj.scaleMatters__Cycle_Attempt__c = sMRecordList[0].scaleMatters__Cycle_Attempt__c + 1;
        sMObj.scaleMatters__Lead__c = sMRecordList[0].scaleMatters__Lead__c;
        sMObj.scaleMatters__Contact__c = sMRecordList[0].scaleMatters__Contact__c;
        sMObj.scaleMatters__Opportunity__c = sMRecordList[0].scaleMatters__Opportunity__c;
        sMObj.scaleMatters__Cycle_Closed_Date__c = System.today();
        
        try{
            
            insert sMObj;
            
        }catch(Exception ex){
            
            system.debug('Exception: ' + ex);
            
        }
        
        
        
    }

}
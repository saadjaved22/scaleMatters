public class scaleMattersDiscardCNTRL {
    
     //method to create Discard Object records 
    @invocableMethod(label='Create Discards')
    public static void createDiscard(List<Id> ids){
        
        system.debug('inside discard contrl');
        
        
    List<Opportunity> oppList = [Select scaleMatters__Business_Unit__c from Opportunity where ID IN: ids];
        
        
    List<scaleMatters__Discarded_Record__c> discList = new List<scaleMatters__Discarded_Record__c>();
        
            for(Opportunity opp: oppList){
                    
                scaleMatters__Discarded_Record__c discObj = new scaleMatters__Discarded_Record__c();
                discObj.scaleMatters__Discarded_Business_Unit__c = opp.scaleMatters__Business_Unit__c;
                discObj.scaleMatters__Discarded_Date_Time__c = system.Now();
                discObj.scaleMatters__Discarded_Object__c = 'Opportunity'; 
                discObj.scaleMatters__Discarded_SafeID__c = opp.id;
                discList.add(discObj);
                    
                
            }
        
        
        try{
            
            insert discList;
            
        }catch(Exception ex){
            
            system.debug('Exception occurs: ' + ex);
            
        }
        
        

    }
    
    

}
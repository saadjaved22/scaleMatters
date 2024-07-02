public class scaleMattersAccountUpdate {
    
    @invocableMethod(Description='Update Account')
    public static void updateAccount(List<Id> ids){
        
        List<scaleMatters__Run_Triggers__c> permissionsList = [Select scaleMatters__Run_Account_Triggers__c, scaleMatters__Deactivate_All__c from scaleMatters__Run_Triggers__c where scaleMatters__Name__c Like 'scaleMatters Run Triggers' and isDeleted = false];
	
        if(permissionsList.size()>0 && !permissionsList[0].scaleMatters__Deactivate_All__c && permissionsList[0].scaleMatters__Run_Account_Triggers__c ){
               
        //quering Leads from list of ids passed in this invocable Method from scaleMattersLeadProcess        
        List<Account> accList = [Select id ,scaleMatters__Account_Discard__c,scaleMatters__Valid_Record__c from Account where id IN : ids];
           
        //quering scaleMatters Excluded Records Object , if A record exists in this list with same id as Lead Record Id it will Check the Discard Chechbox to tue and Valid Checkbox to false 
		List<scaleMatters__scaleMatters_Excluded_Records__c> exList = [select scaleMatters__Account__c , scaleMatters__Contact__c from scaleMatters__scaleMatters_Excluded_Records__c];
        
        for(Account acc: accList){
                    
                    if( String.valueOf(exList).contains(acc.Id)){
                        
                        acc.scaleMatters__Valid_Record__c = false;
                        acc.scaleMatters__Account_Discard__c = true;
                        
                    }else{
                        
                        acc.scaleMatters__Valid_Record__c = true;
                        acc.scaleMatters__Account_Discard__c = false;
                        
                    }
                    
                    
                    
                    
                
            }
            
            
         update accList;
            
            
            
        
        }
    
    
    }
    
        
        
        
        
        
    }
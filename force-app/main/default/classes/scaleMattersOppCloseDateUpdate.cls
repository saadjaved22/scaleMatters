public class scaleMattersOppCloseDateUpdate {
    
    @InvocableMethod(label='Run Close Date Update')
    public static void closeDateUpdate(List<ID> ids){
        
        //quering if permission to run Opportunity Batch update was found
        List<scaleMatters__Run_Triggers__c> permissionsList = [select scaleMatters__Deactivate_All__c , scaleMatters__Run_Opportunity_Triggers__c from scaleMatters__Run_Triggers__c where scaleMatters__Name__c Like 'scaleMatters Run Triggers' AND isDeleted = false];
        
        if(permissionsList.size()>0 && permissionsList[0].scaleMatters__Run_Opportunity_Triggers__c && permissionsList[0].scaleMatters__Deactivate_All__c != true){
        
        List<Opportunity> oppList = [select CreatedDate, scaleMatters__Opportunity_Sync__c, id, CloseDate , scaleMatters__S1_Date__c,scaleMatters__S2_Date__c,scaleMatters__S3_Date__c,scaleMatters__S4_Date__c,scaleMatters__S5_Date__c,scaleMatters__S6_Date__c,scaleMatters__S7_Date__c,scaleMatters__S8_Date__c,scaleMatters__S9_Date__c,scaleMatters__S10_Date__c from Opportunity where id IN : ids AND isClosed = true];
        
        if(oppList.size()>0){
            
            for(Opportunity opp: oppList){
                
                
                if(opp.CloseDate < opp.scaleMatters__S2_Date__c ){
                    
                    opp.scaleMatters__S2_Date__c = opp.CloseDate;
                    
                }                
                if( opp.CloseDate < opp.scaleMatters__S3_Date__c ){
                    
                    opp.scaleMatters__S3_Date__c = opp.CloseDate;
                    
                }
                if( opp.CloseDate < opp.scaleMatters__S4_Date__c){
                    
                    opp.scaleMatters__S4_Date__c = opp.CloseDate;
                    
                }
                if( opp.CloseDate < opp.scaleMatters__S5_Date__c ){
                    
                    opp.scaleMatters__S5_Date__c = opp.CloseDate;
                    
                }
                if( opp.CloseDate < opp.scaleMatters__S6_Date__c ){
                    
                    opp.scaleMatters__S6_Date__c = opp.CloseDate;
                    
                }
                if( opp.CloseDate < opp.scaleMatters__S7_Date__c ){
                    
                    opp.scaleMatters__S7_Date__c = opp.CloseDate;
                    
                }
                if( opp.CloseDate < opp.scaleMatters__S8_Date__c ){
                    
                    opp.scaleMatters__S8_Date__c = opp.CloseDate;
                    
                }
                if( opp.CloseDate < opp.scaleMatters__S9_Date__c ){
                    
                    opp.scaleMatters__S9_Date__c = opp.CloseDate;
                    
                }
                if( opp.CloseDate < opp.scaleMatters__S10_Date__c ){
                    
                    opp.scaleMatters__S10_Date__c = opp.CloseDate;
                    
                }
                
                
                
            }
                
       try{
            
           updateList(oppList);
            
            
        }catch(Exception ex){
            
            system.debug('Exception: ' + ex);
            
        }
            
        }
        
        
        }else{
            
            //do nothing as permission to run opportunity Update was not found
        }
        
    }
    
    //method to update opportunity list 
    public static void updateList(List<Opportunity> oppList){
        
        
    //quering scaleMatters Excluded Records Object , if A record exists in this list with same id as Contact Record Id it will Check the Discard Chechbox to tue and Valid Checkbox to false     
	List<scaleMatters__scaleMatters_Excluded_Records__c> exList = [select scaleMatters__Opportunity__c from scaleMatters__scaleMatters_Excluded_Records__c ];
    
    //quering Valid records mappings list from custom settings records     
    List<scaleMatters__Valid_Record_Mapping__c> dateConfigList = [select scaleMatters__DLD__c , scaleMatters__HRD__c from scaleMatters__Valid_Record_Mapping__c where scaleMatters__Name__c Like 'scaleMatters Date Config' and isDeleted = false];
    
	for(Opportunity opp : oppList){
        
    if(String.valueOf(exList).contains(opp.Id)){
        

                
    opp.scaleMatters__Valid_Record__c = false ;
    opp.scaleMatters__Opportunity_Discard__c = true ;
                
                
    }
    else{
        
        
        if(opp.scaleMatters__Opportunity_Sync__c){
            
    		
            if(opp.CreatedDate >= Date.newInstance(dateConfigList[0].scaleMatters__DLD__c.year(), dateConfigList[0].scaleMatters__DLD__c.month(), dateConfigList[0].scaleMatters__DLD__c.day()) || opp.CloseDate >=  Date.newInstance(dateConfigList[0].scaleMatters__DLD__c.year(), dateConfigList[0].scaleMatters__DLD__c.month(), dateConfigList[0].scaleMatters__DLD__c.day()) ){
                           

               opp.scaleMatters__Valid_Record__c = true ;
               opp.scaleMatters__Opportunity_Discard__c = false ; 
                
                    
                    
            }else{
                

             
             opp.scaleMatters__Valid_Record__c = false ;
                
                
            }
        
        }else{
            
        opp.scaleMatters__Valid_Record__c = false ;

            
        }
                
    }    
            
                
    }    

        
        //updating opportunity list and catching any exceptions if found
        try{
            
            
            
            update oppList ; 
            
            
        }catch(Exception ex){
            system.debug('Exception occurs: ' + ex);
        }
    }
    
}
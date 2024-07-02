public class scaleMattersContactUpdate {
    
    
    
   //invocable method is used to toggle Contact valid and Discard record checkbox and to update Release to Candence Date
    @invocableMethod(Description='Update Contact' Label='Contact invocable Method')
    public static void updateContact(List<Id> ids){
    
    List<scaleMatters__Run_Triggers__c> permissionsList = [Select scaleMatters__Run_Contact_Trigger__c, scaleMatters__Deactivate_All__c from scaleMatters__Run_Triggers__c where scaleMatters__Name__c Like 'scaleMatters Run Triggers' and isDeleted = false];
	
        
    if(permissionsList.size()>0 && !permissionsList[0].scaleMatters__Deactivate_All__c && permissionsList[0].scaleMatters__Run_Contact_Trigger__c ){        
    
        
    //quering Contact from list of ids passed in this invocable Method from scaleMattersLeadProcess            
    List<Contact> conList = [Select CreatedDate, scaleMatters__Valid_Record__c, scaleMatters__Released_to_Cadence__c, scaleMatters__Lead_2_Date__c, id ,scaleMatters__sM_Valid_Contact_Record__c, scaleMatters__Contact_Discard__c from Contact where id IN : ids];
    
    //quering Valid records mappings list from custom settings records     
    List<scaleMatters__Valid_Record_Mapping__c> dateConfigList = [select scaleMatters__DLD__c , scaleMatters__HRD__c from scaleMatters__Valid_Record_Mapping__c where scaleMatters__Name__c Like 'scaleMatters Date Config' and isDeleted = false];
    
    //quering scaleMatters Excluded Records Object , if A record exists in this list with same id as Contact Record Id it will Check the Discard Chechbox to tue and Valid Checkbox to false     
	List<scaleMatters__scaleMatters_Excluded_Records__c> exList = [select scaleMatters__Contact__c from scaleMatters__scaleMatters_Excluded_Records__c ];
   
    //quering Tasks to update Release to cadence date , value is Task's Activity Date              
    List<Task> taskList = [select WhoId, ActivityDate , id from Task where WhoId IN : ids AND isclosed = true AND isDeleted = false Order By ActivityDate DESC ALL ROWS];
    
    //quering Events to update Release to cadence date , value is Events's Activity Date      
    List<Event> eventList = [select ActivityDate , id from Event where WhoId IN : ids Order By ActivityDate ASC ];
        
    Map<ID, List<DateTime>> taskMapList = new Map<Id,List<DateTime>>();
        
    for(Task tsk: taskList ){
            
             taskMapList.put(tsk.WhoId, new List<DateTime>{tsk.ActivityDate});            
            
        }
        
        
    //nested for loop to setting record values
        
   	for(Contact con: conList){
        
        if(taskList.size()>0){
            
         for(Id taskWhoid : taskMapList.keySet()){                        
        
                if(taskWhoid == con.id){ 

                                 
                    //checking if tasks exist for this record, if yes than populate release to cadence date                    
                  
                     con.scaleMatters__Released_to_Cadence__c = Date.newInstance(taskMapList.get(taskWhoid)[0].year(), taskMapList.get(taskWhoid)[0].month(), taskMapList.get(taskWhoid)[0].day() + 1);
            

                    
                       
                }
         }
        
        }else{
        
        con.scaleMatters__Released_to_Cadence__c = Null;
        
    }
            
     	}
        
    for(Contact con:conList){
        
        if(!String.valueOf(exList).contains(con.Id)){
            

        
        //checking if record is valid as per Mappings stored in scaleMattersValidRecord Custom settings
    	if(con.CreatedDate >= date.newInstance(dateConfigList[0].scaleMatters__HRD__c.year(), dateConfigList[0].scaleMatters__HRD__c.month(), dateConfigList[0].scaleMatters__HRD__c.day())  ||  con.scaleMatters__Released_to_Cadence__c >= date.newInstance(dateConfigList[0].scaleMatters__HRD__c.year(), dateConfigList[0].scaleMatters__HRD__c.month(), dateConfigList[0].scaleMatters__HRD__c.day()) ||  con.scaleMatters__Lead_2_Date__c >= date.newInstance(dateConfigList[0].scaleMatters__HRD__c.year(), dateConfigList[0].scaleMatters__HRD__c.month(), dateConfigList[0].scaleMatters__HRD__c.day())){

            con.scaleMatters__Valid_Record__c = true ;
            con.scaleMatters__Contact_Discard__c = false;
                                    
        }else{
                            
            con.scaleMatters__Valid_Record__c =  false ;
            con.scaleMatters__Contact_Discard__c = true ;
                            
                            
        }
        
        }
        else{
            
        
            con.scaleMatters__Valid_Record__c = false ;
            con.scaleMatters__Contact_Discard__c = true;
            
            
            
        }
        
        }
            
        
        
        
 	try{
        
        //updating Contact List 
        update conList;
        
        }catch(Exception ex){
            
            system.debug('Exception: ' + ex);
            
        }
        
        }
        else{
            
            //permission to run this update was not found, do nothing 
        }
        
    }
     

}
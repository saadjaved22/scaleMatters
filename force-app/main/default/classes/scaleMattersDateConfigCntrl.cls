public class scaleMattersDateConfigCntrl {
    
    
    Public Date hrd {get; set;}
    Public Date dld {get; set;}

    
    public Static void createDateConfig(){
        
        
        List<scaleMatters__Valid_Record_Mapping__c> dateConfigList = [select scaleMatters__DLD__c , scaleMatters__HRD__c from scaleMatters__Valid_Record_Mapping__c where scaleMatters__Name__c Like 'scaleMatters Date Config' AND isDeleted = false];
        if(dateConfigList.size() == 0){
            scaleMatters__Valid_Record_Mapping__c dateConfig = new scaleMatters__Valid_Record_Mapping__c();
            dateConfig.scaleMatters__Name__c = 'scaleMatters Date Config';
            insert dateConfig;
            
        }
        
        createPermissionRecord();
        
    }
    
    public static void createPermissionRecord(){
        
        List<scaleMatters__Run_Triggers__c> permissionCS = [select scaleMatters__Name__c from scaleMatters__Run_Triggers__c where scaleMatters__Name__c Like 'scaleMatters Run Triggers' AND isDeleted = false];
        
        if(permissionCS.size() == 0){
            
            scaleMatters__Run_Triggers__c permissionsObj = new scaleMatters__Run_Triggers__c();
            permissionsObj.scaleMatters__Name__c = 'scaleMatters Run Triggers';
            insert permissionsObj;
            
        }
        
        
    }
    
    public void updateDateConfig(){
        
     List<scaleMatters__Valid_Record_Mapping__c> dateConfigList = [select scaleMatters__DLD__c , scaleMatters__HRD__c from scaleMatters__Valid_Record_Mapping__c where scaleMatters__Name__c Like 'scaleMatters Date Config' AND isDeleted = false];
	 
     if(dateConfigList.size()>0){
        
        dateConfigList[0].scaleMatters__DLD__c = dld;
     	dateConfigList[0].scaleMatters__HRD__c = hrd;
        
      
            update dateConfigList;
            
        
        
        
        }
        
        
    }

}
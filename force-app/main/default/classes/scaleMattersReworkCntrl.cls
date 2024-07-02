public class scaleMattersReworkCntrl {
    
    public List<String> datesList {get; set;}  
    public static List<String> getDateFields(){
        
        List<String> dList = new List<String>();
        String SobjectApiName = 'Lead';
        Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
        Map<String, Schema.SObjectField> fieldMap = schemaMap.get(SobjectApiName).getDescribe().fields.getMap();
        system.debug('fieldMap: ' + fieldMap);
        
        for(String fieldName : fieldMap.keyset() )
            {


                String fieldLabel = fieldMap.get(fieldName).getDescribe().getName();
                Schema.DisplayType fielddataType = fieldMap.get(fieldName).getDescribe().getType();
                
                
                if(String.valueOf(fielddataType) == 'Date' || String.valueOf(fielddataType) == 'DateTime'  ){
                    
                    dList.add(fieldLabel);
                    
                    
                    
                }
                
               
                
            }
        
        return dList;
                
    }
    
    Public String Items {set;}  
    public List<SelectOption> getItems() {
        List<SelectOption> options = new List<SelectOption>();
        List < String > strList = new List < String > { 'None'};  

        datesList = getDateFields();
        datesList.add(0, 'None');
        
        for(String d: datesList){
            
                    options.add(new SelectOption(d,d));

        }
        
        return options;
    }
    
    public String leadDate{get; set;}
    public Integer leaddays{get; set;}
    public Integer leadSchddays{get; set;}

    
    public void saveMapping(){
        
        List<scaleMatters__CycleMapping__c> cycleMappingList = [select id ,scaleMatters__ScheduledDays__c,scaleMatters__Lead_Cycle_Date__c, scaleMatters__Number_of_Days_for_New_Record__c from scaleMatters__CycleMapping__c where scaleMatters__Cycle_Name__c Like 'scaleMatters Cycle Mapping' And isDeleted=false];
        
        if(cycleMappingList.size()>0){
            
            cycleMappingList[0].scaleMatters__Lead_Cycle_Date__c = leadDate ;
            cycleMappingList[0].scaleMatters__Number_of_Days_for_New_Record__c = leaddays ;
            cycleMappingList[0].scaleMatters__ScheduledDays__c = leadSchddays;
            
            update cycleMappingList;
            
            
        }
        
        
    }
    
    
    public static List<String> getContactDateFields(){
        
        List<String> dList = new List<String>();
        String SobjectApiName = 'Contact';
        Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
        Map<String, Schema.SObjectField> fieldMap = schemaMap.get(SobjectApiName).getDescribe().fields.getMap();
        system.debug('fieldMap: ' + fieldMap);
        
        for(String fieldName : fieldMap.keyset() )
            {


                String fieldLabel = fieldMap.get(fieldName).getDescribe().getName();
                Schema.DisplayType fielddataType = fieldMap.get(fieldName).getDescribe().getType();
                
                
                if(String.valueOf(fielddataType) == 'Date' || String.valueOf(fielddataType) == 'DateTime'  ){
                    
                    dList.add(fieldLabel);
                    
                    
                    
                }
                
               
                
            }
        
        return dList;
                
    }
    
    
    
    Public String ItemsContact {set;}  
    public List<SelectOption> getItemsContact() {
        List<SelectOption> options = new List<SelectOption>();
        List < String > strList = new List < String > { 'None'};  

        datesList = getContactDateFields();
        datesList.add(0, 'None');
        
        for(String d: datesList){
            
                    options.add(new SelectOption(d,d));

        }
        
        return options;
    }
    
    public String contactDate{get; set;}
    public Integer contactdays{get; set;}
    public Integer contactSchddays{get; set;}

    
    public void saveContactMapping(){
        
        List<scaleMatters__CycleMapping__c> cycleMappingList = [select id ,scaleMatters__Number_of_Scheduled_Days_for_New_Contact__c,scaleMatters__Contact_Cycle_Date__c, scaleMatters__Number_of_Days_for_New_Contact_Record__c from scaleMatters__CycleMapping__c where scaleMatters__Cycle_Name__c Like 'scaleMatters Cycle Mapping' And isDeleted=false];
        
        if(cycleMappingList.size()>0){
            
            cycleMappingList[0].scaleMatters__Contact_Cycle_Date__c = contactDate ;
            cycleMappingList[0].scaleMatters__Number_of_Days_for_New_Contact_Record__c = contactdays ;
            cycleMappingList[0].scaleMatters__Number_of_Scheduled_Days_for_New_Contact__c = contactSchddays ;
            
            update cycleMappingList;
            
            
        }
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    

}
public class scaleMattersTaskUpdate {
    
    Public String linkedInMapping {get; set;}
    Public String emailMapping {get; set;}
    Public String callMapping {get; set;}
    
    //method used as default action on Task Mapping VFP to create Default Record in scaleMattersTaskConfig Custom Settings
    public Static void createTaskMapping(){
        
        List<scaleMatters__Run_Triggers__c> permissionCS = [select scaleMatters__Name__c from scaleMatters__Run_Triggers__c where scaleMatters__Name__c Like 'scaleMatters Run Triggers' AND isDeleted = false];
        
        if(permissionCS.size() == 0){
            
            scaleMatters__Run_Triggers__c permissionsObj = new scaleMatters__Run_Triggers__c();
            permissionsObj.scaleMatters__Name__c = 'scaleMatters Run Triggers';
            insert permissionsObj;
            
        }
        
        List<scaleMatters__Task_Mapping__c> taskMappingList = [Select id from scaleMatters__Task_Mapping__c where scaleMatters__Name__c Like 'scaleMatters Task Mapping' AND isdeleted = false];
        if(taskMappingList.size()==0){
            
            scaleMatters__Task_Mapping__c taskMapping = new scaleMatters__Task_Mapping__c();
            taskMapping.scaleMatters__Name__c = 'scaleMatters Task Mapping';
            taskMapping.scaleMatters__LinkedIn_Mapping__c = '';
            taskMapping.scaleMatters__Email_Mapping__c = '';
            taskMapping.scaleMatters__Call_Mapping__c = '';
           
                
                insert taskMapping;
                
            
                
            
        }
        
    }
    
    //method used for storing updated values in scaleMattersTaskConfig Custom Setting from Task Mapping VFP
    public void updateTaskMapping(){
        
    List<scaleMatters__Task_Mapping__c> taskMappingList = [Select id, scaleMatters__LinkedIn_Mapping__c, scaleMatters__Email_Mapping__c, scaleMatters__Call_Mapping__c   from scaleMatters__Task_Mapping__c where scaleMatters__Name__c Like 'scaleMatters Task Mapping' AND isdeleted = false];
        if(taskMappingList.size()>0){
            
            taskMappingList[0].scaleMatters__LinkedIn_Mapping__c = linkedInMapping;
            taskMappingList[0].scaleMatters__Email_Mapping__c = emailMapping;
            taskMappingList[0].scaleMatters__Call_Mapping__c = callMapping;
            
            
                update taskMappingList;
            

        }
        
        
        
        
    }
    
    //invocable method is being called from scaleMattersActivityProcess whenever a task is created to Stamp Activity Type field
    @invocableMethod(Description = 'Update Tasks')
    public Static void updateTask(List<Id> ids){
        
        List<scaleMatters__Run_Triggers__c> permissionsList = [Select scaleMatters__Run_Activity_Trigger__c, scaleMatters__Deactivate_All__c from scaleMatters__Run_Triggers__c where scaleMatters__Name__c Like 'scaleMatters Run Triggers' and isDeleted = false];
	
        if(permissionsList.size()>0 && !permissionsList[0].scaleMatters__Deactivate_All__c && permissionsList[0].scaleMatters__Run_Activity_Trigger__c ){
        
        //quering mappings stored in scaleMattersTaskConfig Custom Settings Object 
        List<scaleMatters__Task_Mapping__c> taskMappingList = [select scaleMatters__Call_Mapping__c, scaleMatters__Email_Mapping__c, scaleMatters__LinkedIn_Mapping__c from scaleMatters__Task_Mapping__c where scaleMatters__Name__c Like 'scaleMatters Task Mapping' AND isDeleted = false ];
        
        //List of ids to store owner ids from activity object
        List<ID> ownerIDList = new List<Id>();        
        
        //quering Tasks from ids passed in as list in this Invocable Method
        List<Task> activityList = [Select OwnerId, scaleMatters__Owner_Role__c, WhatId, WhoId, Subject, scaleMatters__Activity_Type__c, scaleMatters__Original_WhatID__c , scaleMatters__Original_WhoID__c  from Task where Id IN : ids];
        
        //inserting Task owners ids to ownerIDList
        for(Task tsk: activityList){
            
            ownerIDList.add(tsk.OwnerId);
            
        }
        
        //quering Task's Owners Roles 
        List<User> userRoleList  = [select scaleMatters__Current_Role__c , UserRole.Name , id from User where Id IN : ownerIDList];
        
        //nested for loop to update records
        for(Task tsk: activityList){
            for(User usr: userRoleList){
                
                //checking if task ownerid is equal to users ids to update owners roles
                if(tsk.OwnerId == usr.id){
                    
                    tsk.scaleMatters__Original_WhatID__c = tsk.WhatId;
                    tsk.scaleMatters__Original_WhoID__c = tsk.WhoId;
                    tsk.scaleMatters__Owner_Role__c =  usr.scaleMatters__Current_Role__c;
                
                }            
            }
        }
        
        //getting LinkedIn Mapping stored in custom settings and passing to getLinkedInTasks to be used in Dynamic SOQL Query
        if(taskMappingList[0].scaleMatters__LinkedIn_Mapping__c != Null){
        
            getLinkedInTasks(taskMappingList, ids, activityList);
        
        }else{
            
          UpdateTask(activityList);  
            
        }
        
        //getting Email Mapping stored in custom settings and passing to getEmailTasks to be used in Dynamic SOQL Query        
        if(taskMappingList[0].scaleMatters__Email_Mapping__c != Null && taskMappingList[0].scaleMatters__LinkedIn_Mapping__c == Null){
            
           getEmailTasks(taskMappingList, ids, activityList);
            
        }
        
         //getting Call Mapping stored in custom settings and passing to getCallTasks to be used in Dynamic SOQL Query        
        if(taskMappingList[0].scaleMatters__Email_Mapping__c == Null && taskMappingList[0].scaleMatters__LinkedIn_Mapping__c == Null && taskMappingList[0].scaleMatters__Call_Mapping__c != Null){
            
           getCallTasks(taskMappingList, ids, activityList);
            
        }
        
        
        }
        else{
            
            //permission to run this update was not found, do nothing 
            
        }
        
        
        
        
    }
    
    //method used to query / set values for linkedIn Tasks
    public static void getLinkedInTasks(List<scaleMatters__Task_Mapping__c> taskMappingList , List<Id> newSet, List<Task> tasks){
        
        List<ID> taskIDList = new List<ID>();
        
        String Conditions = '';
        
        if(taskMappingList[0].scaleMatters__LinkedIn_Mapping__c != Null){
            
            Conditions = taskMappingList[0].scaleMatters__LinkedIn_Mapping__c ;
            
        }
        
        
        
        
        String query = 'Select Id from Task where '+ conditions + ' AND ID IN : newSet';       
        List<Task> taskList = database.query(query);
           
        String recordID = '';
        
        for(Task tsk : taskList){
            
            Map<String, Object> taskMap = tsk.getPopulatedFieldsAsMap();
            for (String fieldName : taskMap.keySet()){
                
                if(fieldName == 'Id'){
                    
                     recordID = String.valueOf(taskMap.get(fieldName));
                        
                    }
                
            }
            
            taskIDList.add(recordID);
            
            
                

        }
        
        for(Task tsk : tasks){
            for(Id tskId : taskIDList){                
                if(tsk.Id == tskId){
                    
                    tsk.scaleMatters__Activity_Type__c = 'LinkedIn';
                    
                }
                
            }
            
            
            
        }
        
        
        if(taskMappingList[0].scaleMatters__Email_Mapping__c != Null){
            
        getEmailTasks(taskMappingList, newSet, tasks);
        
        }else{
            
            UpdateTask(tasks);
        
        }
        
        
        
    }
    
    //method used to query / set values for Email Tasks
    public static void getEmailTasks(List<scaleMatters__Task_Mapping__c> taskMappingList , List<Id> newSet, List<Task> tasks){
        
        List<ID> taskIDList = new List<ID>();
        
        String Conditions = '';
        
        if(taskMappingList[0].scaleMatters__Email_Mapping__c != Null){
            
            Conditions = taskMappingList[0].scaleMatters__Email_Mapping__c ;
            
        }
        
        
        
        
        String query = 'Select Id from Task where '+ conditions + ' AND ID IN : newSet';       
        List<Task> taskList = database.query(query);
           
        String recordID = '';
        
        for(Task tsk : taskList){
            
            Map<String, Object> taskMap = tsk.getPopulatedFieldsAsMap();
            for (String fieldName : taskMap.keySet()){
                
                if(fieldName == 'Id'){
                    
                     recordID = String.valueOf(taskMap.get(fieldName));
                        
                    }
                
            }
            
            taskIDList.add(recordID);
            
            
                

        }
        
        for(Task tsk : tasks){
            for(Id tskId : taskIDList){                
                if(tsk.Id == tskId){
                    
                    tsk.scaleMatters__Activity_Type__c = 'Email';
                    
                }
                
            }
            
            
            
        }
        
        if(taskMappingList[0].scaleMatters__Call_Mapping__c != Null){
        
    	getCallTasks(taskMappingList, newSet, tasks );    
        
        }else{
            
        updateTask(tasks);        
            
        }
        
    }
    
    //method used to query / set values for Call Tasks
    public static void getCallTasks(List<scaleMatters__Task_Mapping__c> taskMappingList , List<Id> newSet, List<Task> tasks){
        
        List<ID> taskIDList = new List<ID>();
        
        String Conditions = '';
        
        if(taskMappingList[0].scaleMatters__Call_Mapping__c != Null){
            
            Conditions = taskMappingList[0].scaleMatters__Call_Mapping__c ;
            
        }
        
        
        
        
        String query = 'Select Id from Task where '+ conditions + ' AND ID IN : newSet';       
        List<Task> taskList = database.query(query);
           
        String recordID = '';
        
        for(Task tsk : taskList){
            
            Map<String, Object> taskMap = tsk.getPopulatedFieldsAsMap();
            for (String fieldName : taskMap.keySet()){
                
                if(fieldName == 'Id'){
                    
                     recordID = String.valueOf(taskMap.get(fieldName));
                        
                    }
                
            }
            
            taskIDList.add(recordID);
            
            
                

        }
        
        for(Task tsk : tasks){
            for(Id tskId : taskIDList){                
                if(tsk.Id == tskId){
                    
                    tsk.scaleMatters__Activity_Type__c = 'Call';
                    
                }
                
            }
            
            
            
        }
        
        
        
        UpdateTask(tasks);
        
        
    
        
    }    
    
    //method used to update Task List
    public static void UpdateTask(List<Task> tasks){
        
        for(Task ts : tasks){
            
            if(ts.scaleMatters__Activity_Type__c != 'LinkedIn' && ts.scaleMatters__Activity_Type__c != 'Call' && ts.scaleMatters__Activity_Type__c != 'Email'){
                
                ts.scaleMatters__Activity_Type__c = 'Other';
                
            }
            
        }
        
    
            update tasks;
            
        
        
        
        
    }


}
public class scaleMattersOppCreate {
    
     
    @InvocableMethod(label='Run Opportunity Stage Date Create')
    public static void oppCreate(List<ID> ids){
        
        //quering if permission to run Opportunity Batch update was found
        List<scaleMatters__Run_Triggers__c> permissionsList = [select scaleMatters__Deactivate_All__c , scaleMatters__Run_Opportunity_Triggers__c from scaleMatters__Run_Triggers__c where scaleMatters__Name__c Like 'scaleMatters Run Triggers' AND isDeleted = false];
        
        if(permissionsList.size()>0 && permissionsList[0].scaleMatters__Run_Opportunity_Triggers__c && permissionsList[0].scaleMatters__Deactivate_All__c != true){
        
      
        
         //quering stage mapping custom setting object             
        List<scaleMatters__Stage_Mapping__c> csList = [select scaleMatters__LSBL1__c,scaleMatters__LSBL2__c,scaleMatters__LSBL3__c,scaleMatters__LSBL4__c,scaleMatters__LSBL5__c,scaleMatters__LSBL6__c,scaleMatters__LSBL7__c,scaleMatters__LSBL8__c,scaleMatters__LSBLCW__c,scaleMatters__LSBLCL__c,scaleMatters__LSBLIC__c,scaleMatters__LSBLIG__c, scaleMatters__isGhosted_Mapping__c, scaleMatters__isCertified_Mapping__c, scaleMatters__Closed_Won_Mapping__c, scaleMatters__Closed_Lost_Mapping__c, scaleMatters__Stage_1_Mapping__c,scaleMatters__Stage_2_Mapping__c,scaleMatters__Stage_3_Mapping__c,scaleMatters__Stage_4_Mapping__c,scaleMatters__Stage_5_Mapping__c,scaleMatters__Stage_6_Mapping__c,scaleMatters__Stage_7_Mapping__c,scaleMatters__Stage_8_Mapping__c from scaleMatters__Stage_Mapping__c where scaleMatters__Name__c Like 'scaleMatters Stage Mapping' AND isDeleted = false];    
        
        
        List<Opportunity> oppList = [select scaleMatters__Opportunity_Sync__c, CreatedDate, StageName, id, CloseDate , scaleMatters__S1_Date__c,scaleMatters__S2_Date__c,scaleMatters__S3_Date__c,scaleMatters__S4_Date__c,scaleMatters__S5_Date__c,scaleMatters__S6_Date__c,scaleMatters__S7_Date__c,scaleMatters__S8_Date__c,scaleMatters__S9_Date__c,scaleMatters__S10_Date__c from Opportunity where id IN : ids];
        if(oppList.size()>0){
            
            
            
            for(Opportunity oppNew: oppList){
                
                   String stageNew = setStageValue(oppNew.StageName, csList);
                
                
                if(oppNew.scaleMatters__S1_Date__c == Null){
                    
                        oppNew.scaleMatters__S1_Date__c = date.newinstance(oppNew.CreatedDate.year(), oppNew.CreatedDate.month(), oppNew.CreatedDate.day());
                    
                    }
                
                
                     if(stageNew == '1'){
                    
                        oppNew.scaleMatters__S1_Date__c = date.newinstance(oppNew.CreatedDate.year(), oppNew.CreatedDate.month(), oppNew.CreatedDate.day());
                        oppNew.scaleMatters__Last_Stage_Before_Loss__c = csList[0].scaleMatters__LSBL1__c;
                        oppNew.scaleMatters__IsGhosted__c = false;
                        oppNew.scaleMatters__IsCertifiedDeal__c = false;

                    
                        }
                    
                
                        else if(stageNew == '2'){
                    
                        oppNew.scaleMatters__S2_Date__c = system.today();
                        oppNew.scaleMatters__Last_Stage_Before_Loss__c = csList[0].scaleMatters__LSBL2__c;
                        oppNew.scaleMatters__IsGhosted__c = false;
                        oppNew.scaleMatters__IsCertifiedDeal__c = false;
                            
                       }
                        else if(stageNew=='3'){
                            
                            oppNew.scaleMatters__S2_Date__c = system.today();
                            oppNew.scaleMatters__S3_Date__c = system.today();
                            oppNew.scaleMatters__Last_Stage_Before_Loss__c = csList[0].scaleMatters__LSBL3__c;
                            oppNew.scaleMatters__IsGhosted__c = false;
                            oppNew.scaleMatters__IsCertifiedDeal__c = false;

                        }
                        else if(stageNew=='4'){
                            
                            oppNew.scaleMatters__S2_Date__c = system.today();                       
                            oppNew.scaleMatters__S3_Date__c = system.today();                       
                            oppNew.scaleMatters__S4_Date__c = system.today();
                            oppNew.scaleMatters__Last_Stage_Before_Loss__c = csList[0].scaleMatters__LSBL4__c;
                            oppNew.scaleMatters__IsGhosted__c = false;
                            oppNew.scaleMatters__IsCertifiedDeal__c = false;


                        }
                        else if(stageNew=='5'){
                            
                            oppNew.scaleMatters__S2_Date__c = system.today();                       
                            oppNew.scaleMatters__S3_Date__c = system.today();                       
                            oppNew.scaleMatters__S4_Date__c = system.today();                       
                            oppNew.scaleMatters__S5_Date__c = system.today();
                            oppNew.scaleMatters__Last_Stage_Before_Loss__c = csList[0].scaleMatters__LSBL5__c;
                            oppNew.scaleMatters__IsGhosted__c = false;
                            oppNew.scaleMatters__IsCertifiedDeal__c = false;


                        }else if(stageNew=='6'){
                                
                            oppNew.scaleMatters__S2_Date__c = system.today();                       
                            oppNew.scaleMatters__S3_Date__c = system.today();                       
                            oppNew.scaleMatters__S4_Date__c = system.today();                       
                            oppNew.scaleMatters__S5_Date__c = system.today();                       
                            oppNew.scaleMatters__S6_Date__c = system.today();
                            oppNew.scaleMatters__Last_Stage_Before_Loss__c = csList[0].scaleMatters__LSBL6__c;
                            oppNew.scaleMatters__IsGhosted__c = false;
                            oppNew.scaleMatters__IsCertifiedDeal__c = false;



                        }
                        else if(stageNew=='7'){
                            
                            oppNew.scaleMatters__S2_Date__c = system.today();
                            oppNew.scaleMatters__S3_Date__c = system.today();
                            oppNew.scaleMatters__S4_Date__c = system.today();
                            oppNew.scaleMatters__S5_Date__c = system.today();
                            oppNew.scaleMatters__S6_Date__c = system.today();
                            oppNew.scaleMatters__S7_Date__c = system.today();
                            oppNew.scaleMatters__Last_Stage_Before_Loss__c =csList[0].scaleMatters__LSBL7__c;
                            oppNew.scaleMatters__IsGhosted__c = false;
                            oppNew.scaleMatters__IsCertifiedDeal__c = false;
                
                            }
                        else if(stageNew=='8'){
                            oppNew.scaleMatters__S2_Date__c = system.today();
                            
                            oppNew.scaleMatters__S3_Date__c = system.today();
                            
                            oppNew.scaleMatters__S4_Date__c = system.today();
                            
                            oppNew.scaleMatters__S5_Date__c = system.today();
                            
                            oppNew.scaleMatters__S6_Date__c = system.today();
                            
                            oppNew.scaleMatters__S7_Date__c = system.today();
                            
                            oppNew.scaleMatters__S8_Date__c = system.today();
                            oppNew.scaleMatters__Last_Stage_Before_Loss__c =csList[0].scaleMatters__LSBL8__c;
                            oppNew.scaleMatters__IsGhosted__c = false;
                            oppNew.scaleMatters__IsCertifiedDeal__c = false;

    
                
                            }
                        else if(stageNew=='9'){
                            //opportunity reaches Closed Lost Stage , we dont have to update anything in this stage
    
                            }
                        else if(stageNew=='10'){
                
                            oppNew.scaleMatters__S2_Date__c = system.today();
                            
                            oppNew.scaleMatters__S3_Date__c = system.today();
                            
                            oppNew.scaleMatters__S4_Date__c = system.today();
                            
                            oppNew.scaleMatters__S5_Date__c = system.today();
                            
                            oppNew.scaleMatters__S6_Date__c = system.today();
                            
                            oppNew.scaleMatters__S7_Date__c = system.today();
                            
                            oppNew.scaleMatters__S8_Date__c = system.today();
                            
                            oppNew.scaleMatters__S9_Date__c = system.today();
                            
                            oppNew.scaleMatters__S10_Date__c = system.today();
                            oppNew.scaleMatters__Last_Stage_Before_Loss__c =csList[0].scaleMatters__LSBLCW__c;
                            oppNew.scaleMatters__IsGhosted__c = false;
                            oppNew.scaleMatters__IsCertifiedDeal__c = false;

                        }else if(stageNew == '11'){
                            oppNew.scaleMatters__S2_Date__c = system.today();                            
                            oppNew.scaleMatters__S3_Date__c = system.today();                            
                            oppNew.scaleMatters__S4_Date__c = system.today();                            
                            oppNew.scaleMatters__S5_Date__c = system.today();                            
                            oppNew.scaleMatters__S6_Date__c = system.today();                            
                            oppNew.scaleMatters__S7_Date__c = system.today();                            
                            oppNew.scaleMatters__S8_Date__c = system.today();                            
                            oppNew.scaleMatters__S9_Date__c = system.today();                            
                            oppNew.scaleMatters__S10_Date__c = system.today();
                            oppNew.scaleMatters__IsGhosted__c = false;
                            oppNew.scaleMatters__IsCertifiedDeal__c = true;
                            oppNew.scaleMatters__Last_Stage_Before_Loss__c =csList[0].scaleMatters__LSBLIC__c;
                
                            }            
                            else if(stageNew == '12'){
                            
                            oppNew.scaleMatters__IsGhosted__c = true;
                            oppNew.scaleMatters__IsCertifiedDeal__c = false;

    
    
    
                            }
                        
                
                
                
                
            }
                
       try{
            
            updateList(oppList);
            
            
        }catch(Exception ex){
            
            system.debug('Exception: ' + ex);
            
        }
            
         
        
    }
            
        }else{
            
            
            //do nothing as permission to run Opportunity Update was not found 
            
        }

        
        }
    
 
    //method to return numeric stage based on value stored in custom settings
    Public static String setStageValue(String key, List<scaleMatters__Stage_Mapping__c> cmd){
        
        String currentStage = '0';
        
        //setting stage dates if stage move forward 
        if(cmd[0].scaleMatters__Stage_1_Mapping__c!=null && String.valueOf(cmd[0].scaleMatters__Stage_1_Mapping__c).contains(key) ){
            currentStage = '1';        
        }else if(cmd[0].scaleMatters__Stage_2_Mapping__c!=null && String.valueOf(cmd[0].scaleMatters__Stage_2_Mapping__c).contains(key)){
            currentStage = '2';
        }else if(cmd[0].scaleMatters__Stage_3_Mapping__c!=null && String.valueOf(cmd[0].scaleMatters__Stage_3_Mapping__c).contains(key)){
            currentStage = '3';
        }else if(cmd[0].scaleMatters__Stage_4_Mapping__c!=null &&  String.valueOf(cmd[0].scaleMatters__Stage_4_Mapping__c).contains(key)){
            currentStage = '4';
        }else if(cmd[0].scaleMatters__Stage_5_Mapping__c!=null && String.valueOf(cmd[0].scaleMatters__Stage_5_Mapping__c).contains(key)){
            currentStage = '5';
        }else if(cmd[0].scaleMatters__Stage_6_Mapping__c!=null && String.valueOf(cmd[0].scaleMatters__Stage_6_Mapping__c).contains(key)){
            currentStage = '6';
        }else if( cmd[0].scaleMatters__Stage_7_Mapping__c!=null && String.valueOf(cmd[0].scaleMatters__Stage_7_Mapping__c).contains(key)){
            currentStage = '7';
        }else if(cmd[0].scaleMatters__Stage_8_Mapping__c!=null && String.valueOf(cmd[0].scaleMatters__Stage_8_Mapping__c).contains(key)){
            currentStage = '8';
        }else if(cmd[0].scaleMatters__Closed_Lost_Mapping__c != null && String.valueOf(cmd[0].scaleMatters__Closed_Lost_Mapping__c).contains(key)){
            currentStage = '9';
        }else if(cmd[0].scaleMatters__Closed_Won_Mapping__c!=null && String.valueOf(cmd[0].scaleMatters__Closed_Won_Mapping__c).contains(key)){
            currentStage = '10';
        }else if(cmd[0].scaleMatters__isCertified_Mapping__c!=null && String.valueOf(cmd[0].scaleMatters__isCertified_Mapping__c).contains(key)){
            currentStage = '11';
        }else if(cmd[0].scaleMatters__isGhosted_Mapping__c!=null && String.valueOf(cmd[0].scaleMatters__isGhosted_Mapping__c).contains(key)){
            currentStage = '12';
        }else{
            
            currentStage = '';
        
        }
        
        
        return currentStage;
        
       
        
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
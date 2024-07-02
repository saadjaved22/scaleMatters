public class scaleMattersStageMappingCNTRL {
    
    //checking if stage mapping record exists in custom settings, if not create one
    public static void createCustomSettings(){
        
        List<scaleMatters__Run_Triggers__c> permissionCS = [select scaleMatters__Name__c from scaleMatters__Run_Triggers__c where scaleMatters__Name__c Like 'scaleMatters Run Triggers' AND isDeleted = false];
        
        if(permissionCS.size() == 0){
            
            scaleMatters__Run_Triggers__c permissionsObj = new scaleMatters__Run_Triggers__c();
            permissionsObj.scaleMatters__Name__c = 'scaleMatters Run Triggers';
            insert permissionsObj;
            
        }
        
        List<scaleMatters__Stage_Mapping__c> cmd = [select scaleMatters__Name__c from scaleMatters__Stage_Mapping__c where scaleMatters__Name__c Like 'scaleMatters Stage Mapping' AND isDeleted = false ];
        
        if(cmd.size() == 0){
            scaleMatters__Stage_Mapping__c cs = new scaleMatters__Stage_Mapping__c();
            cs.scaleMatters__Name__c = 'scaleMatters Stage Mapping';
            insert cs;
            
            
        }
    }

    //methods used to query StageName Values on Opportunity Object and insert in DropDown
    public List<String> stageList {get; set;}
    public static List<String> getStageValues(){
        
        List<String> sPList = new List<String>();
        String SobjectApiName = 'Opportunity';
        String FieldApiName = 'StageName';
        Schema.SObjectType s = Schema.getGlobalDescribe().get(SobjectApiName) ;
        Schema.DescribeSObjectResult r = s.getDescribe() ;
        Map<String,Schema.SObjectField> fields = r.fields.getMap() ;
        Schema.DescribeFieldResult fieldResult = fields.get(FieldApiName).getDescribe();
        List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
        
        for( Schema.PicklistEntry pickListVal : ple){
            
            sPList.add(String.valueOf(pickListVal.getValue()));
            
        } 
           
       
        return sPList;
                
    }
    Public String Items {set;}  
    public List<SelectOption> getItems() {
        List<SelectOption> options = new List<SelectOption>();
        List < String > strList = new List < String > { 'None'};  

        stageList = getStageValues();
        stageList.add(0, 'None');
        
        for(String val: stageList){
            
                    options.add(new SelectOption(val,val));

        }
        
        return options;
    }
    
  
    //all methods which are used to set Field 1 Mapping 
    public String smMapping1;
    public String getsmMapping1() {
        return smMapping1;
    }
    public void setsmMapping1(String smMapping1) {
        this.smMapping1 = smMapping1;
    }
    public Integer LSBL1;
    public Integer getLSBL1() {
        LSBL1 = 1;
        return LSBL1;
    }
    public void setLSBL1(Integer LSBL1) {
        this.LSBL1 = LSBL1;
    }
    public void stage1Mapping() {
        
        List<scaleMatters__Stage_Mapping__c> cmd = [select scaleMatters__LSBL1__c,scaleMatters__Stage_1_Mapping__c from scaleMatters__Stage_Mapping__c where scaleMatters__Name__c Like 'scaleMatters Stage Mapping' AND isDeleted = false];
        cmd[0].scaleMatters__Stage_1_Mapping__c = smMapping1 ;
        cmd[0].scaleMatters__LSBL1__c = LSBL1;
        update cmd;
       
        
        }
    
   
    
    //all methods which are used to set Field 2 Mapping
     public String smMapping2;
     public String getsmMapping2() {
        return smMapping2;
    }
     public void setsmMapping2(String smMapping2) {
        this.smMapping2 = smMapping2;
    }
     public Integer LSBL2;
     public Integer getLSBL2() {
		LSBL2 = 2;    
        return LSBL2;
    }
     public void setLSBL2(Integer LSBL2) {
        this.LSBL2 = LSBL2;
    }
     public void stage2Mapping() {
        
        List<scaleMatters__Stage_Mapping__c> cmd = [select scaleMatters__LSBL2__c,scaleMatters__Stage_2_Mapping__c from scaleMatters__Stage_Mapping__c where scaleMatters__Name__c Like 'scaleMatters Stage Mapping' AND isDeleted = false  ];
        cmd[0].scaleMatters__Stage_2_Mapping__c = smMapping2 ;
        cmd[0].scaleMatters__LSBL2__c = LSBL2;
         
        update cmd;
       
        }
    
    
    //all methods used to set Field 3 Mapping 
     public String smMapping3;
     public String getsmMapping3() {
        return smMapping3;
    }
     public void setsmMapping3(String smMapping3) {
        this.smMapping3 = smMapping3;
    }
     public Integer LSBL3;
     public Integer getLSBL3() {
        LSBL3 = 3;
        return LSBL3;
    }
     public void setLSBL3(Integer LSBL3) {
        this.LSBL3 = LSBL3;
    }
     public void stage3Mapping() {
        
        List<scaleMatters__Stage_Mapping__c> cmd = [select scaleMatters__LSBL3__c,scaleMatters__Stage_3_Mapping__c from scaleMatters__Stage_Mapping__c where scaleMatters__Name__c Like 'scaleMatters Stage Mapping' AND isDeleted = false ];
        cmd[0].scaleMatters__Stage_3_Mapping__c = smMapping3 ;
        cmd[0].scaleMatters__LSBL3__c =LSBL3;
         
        update cmd;
       
        
        }
    
    //all methods used to set Field 4 Mapping 
    public String smMapping4;
    public String getsmMapping4() {
        return smMapping4;
    }
    public void setsmMapping4(String smMapping4) {
        this.smMapping4 = smMapping4;
    }
    public Integer LSBL4;
    public Integer getLSBL4() {
        LSBL4 = 4;  
        return LSBL4;
          
    }
    public void setLSBL4(Integer LSBL4) {
        this.LSBL4 = LSBL4;
    }
    public void stage4Mapping() {
        
        List<scaleMatters__Stage_Mapping__c> cmd = [select scaleMatters__LSBL4__c,scaleMatters__Stage_4_Mapping__c from scaleMatters__Stage_Mapping__c where scaleMatters__Name__c Like 'scaleMatters Stage Mapping' AND isDeleted = false ];
        cmd[0].scaleMatters__Stage_4_Mapping__c = smMapping4 ;
        cmd[0].scaleMatters__LSBL4__c = LSBL4;
         
        update cmd;
       
        
        }
    
    
    //all methods used to set Field 5 Mapping
     public String smMapping5;
     public String getsmMapping5() {
        return smMapping5;
    }
     public void setsmMapping5(String smMapping5) {
        this.smMapping5 = smMapping5;
    }
     public Integer LSBL5;
     public Integer getLSBL5() {
        LSBL5 = 5; 
        return LSBL5;
         
    }
     public void setLSBL5(Integer LSBL5) {
        this.LSBL5 = LSBL5;
    }
     public void stage5Mapping() {
        
        List<scaleMatters__Stage_Mapping__c> cmd = [select scaleMatters__LSBL5__c,scaleMatters__Stage_5_Mapping__c from scaleMatters__Stage_Mapping__c where scaleMatters__Name__c Like 'scaleMatters Stage Mapping' AND isDeleted = false  ];
        cmd[0].scaleMatters__Stage_5_Mapping__c = smMapping5 ;
        cmd[0].scaleMatters__LSBL5__c = LSBL5 ;
         
        update cmd;
       
        
        }
   
    
    //all Methods used to set Field 6 Mapping 
     public String smMapping6;
     public String getsmMapping6() {
        return smMapping6;
    }
     public void setsmMapping6(String smMapping6) {
        this.smMapping6 = smMapping6;
    }
     public Integer LSBL6;
     public Integer getLSBL6() {
        LSBL6 = 6; 
        return LSBL6;
    }
     public void setLSBL6(Integer LSBL6) {
        this.LSBL6 = LSBL6;
         
    }
     public void stage6Mapping() {
        
        List<scaleMatters__Stage_Mapping__c> cmd = [select scaleMatters__LSBL6__c,scaleMatters__Stage_6_Mapping__c from scaleMatters__Stage_Mapping__c where scaleMatters__Name__c Like 'scaleMatters Stage Mapping' AND isDeleted = false  ];
        cmd[0].scaleMatters__Stage_6_Mapping__c = smMapping6 ;
        cmd[0].scaleMatters__LSBL6__c = LSBL6 ;
         
        update cmd;
       
        
        }
   
    
    //all Method used to set Field 7 Mapping 
     public String smMapping7;
     public String getsmMapping7() {
        return smMapping7;
    }
     public void setsmMapping7(String smMapping7) {
        this.smMapping7 = smMapping7;
    }
     public Integer LSBL7;
     public Integer getLSBL7() {
        LSBL7 = 7; 
        return LSBL7;
    }
     public void setLSBL7(Integer LSBL7) {
        this.LSBL7 = LSBL7;
    }
     public void stage7Mapping() {
        
        List<scaleMatters__Stage_Mapping__c> cmd = [select scaleMatters__LSBL7__c,scaleMatters__Stage_7_Mapping__c from scaleMatters__Stage_Mapping__c where scaleMatters__Name__c Like 'scaleMatters Stage Mapping' AND isDeleted = false  ];
        cmd[0].scaleMatters__Stage_7_Mapping__c = smMapping7 ;
        cmd[0].scaleMatters__LSBL7__c = LSBL7 ;
         
        update cmd;
        
        
        }
    
    
    
    //all Methods used to set Field 8 Mapping 
     public String smMapping8;
     public String getsmMapping8() {
        return smMapping8;
    }
     public void setsmMapping8(String smMapping8) {
        this.smMapping8 = smMapping8;
    }
     public Integer LSBL8;
     public Integer getLSBL8() {
        LSBL8 = 8; 
        return LSBL8;
    }
     public void setLSBL8(Integer LSBL8) {
        this.LSBL8 = LSBL8;
    }
     public void stage8Mapping() {
        
        List<scaleMatters__Stage_Mapping__c> cmd = [select scaleMatters__LSBL8__c,scaleMatters__Stage_8_Mapping__c from scaleMatters__Stage_Mapping__c where scaleMatters__Name__c Like 'scaleMatters Stage Mapping' AND isDeleted = false  ];
        cmd[0].scaleMatters__Stage_8_Mapping__c = smMapping8 ;
        cmd[0].scaleMatters__LSBL8__c = LSBL8 ;
         
        update cmd;
        
        
        }
    
    //all Methods used to set Field Closed/Won Mapping 
     public String smMappingcw;
     public String getsmMappingcw() {
        return smMappingcw;
    }
     public void setsmMappingcw(String smMappingcw) {
        this.smMappingcw = smMappingcw;
    }
     public Integer LSBLcw;
     public Integer getLSBLcw() {
        LSBLcw = 10; 
        return LSBLcw;
    }
     public void setLSBLcw(Integer LSBLcw) {
        this.LSBLcw = LSBLcw;
    }
     public void stagecwMapping() {
        
        List<scaleMatters__Stage_Mapping__c> cmd = [select scaleMatters__LSBLCW__c,scaleMatters__Closed_Won_Mapping__c from scaleMatters__Stage_Mapping__c where scaleMatters__Name__c Like 'scaleMatters Stage Mapping' AND isDeleted = false  ];
        cmd[0].scaleMatters__Closed_Won_Mapping__c = smMappingcw ;
        cmd[0].scaleMatters__LSBLCW__c = LSBLcw ;
         
        update cmd;
        
        
        }
    
    //all Methods used to set Field Closed/Lost Mapping 
     public String smMappingcl;
     public String getsmMappingcl() {
        return smMappingcl;
    }
     public void setsmMappingcl(String smMappingcl) {
        this.smMappingcl = smMappingcl;
    }
     public Integer LSBLcl;
     public Integer getLSBLcl() {
        LSBLcl = 9; 
        return LSBLcl;
    }
     public void setLSBLcl(Integer LSBLcl) {
        this.LSBLcl = LSBLcl;
    }
     public void stageclMapping() {
        
        List<scaleMatters__Stage_Mapping__c> cmd = [select scaleMatters__LSBLCL__c,scaleMatters__Closed_Lost_Mapping__c from scaleMatters__Stage_Mapping__c where scaleMatters__Name__c Like 'scaleMatters Stage Mapping' AND isDeleted = false  ];
        cmd[0].scaleMatters__Closed_Lost_Mapping__c = smMappingcl ;
        cmd[0].scaleMatters__LSBLCL__c = LSBLcl ;
         
        update cmd;
        
        
        }
    
    //all Methods used to set Field ISCERTIFIED Mapping 
     public String smMappingic;
     public String getsmMappingic() {
        return smMappingic;
    }
     public void setsmMappingic(String smMappingic) {
        this.smMappingic = smMappingic;
    }
     public Integer LSBLic;
     public Integer getLSBLic() {
        LSBLic = 10; 
        return LSBLic;
    }
     public void setLSBLic(Integer LSBLic) {
        this.LSBLic = LSBLic;
    }
     public void stageicMapping() {
        
        List<scaleMatters__Stage_Mapping__c> cmd = [select scaleMatters__LSBLIC__c,scaleMatters__isCertified_Mapping__c from scaleMatters__Stage_Mapping__c where scaleMatters__Name__c Like 'scaleMatters Stage Mapping' AND isDeleted = false  ];
        cmd[0].scaleMatters__isCertified_Mapping__c = smMappingIC ;
        cmd[0].scaleMatters__LSBLIC__c = LSBLIC ;
         
        update cmd;
       
        
        }
    
     //all Methods used to set Field ISGHOSTED Mapping 
     public String smMappingig;
     public String getsmMappingig() {
        return smMappingig;
    }
     public void setsmMappingig(String smMappingig) {
        this.smMappingig = smMappingig;
    }
     public Integer LSBLig;
     public Integer getLSBLig() {
        LSBLig = 9; 
        return LSBLig;
    }
     public void setLSBLig(Integer LSBLig) {
        this.LSBLig = LSBLig;
    }
     public void stageigMapping() {
        
        List<scaleMatters__Stage_Mapping__c> cmd = [select scaleMatters__LSBLIG__c,scaleMatters__isGhosted_Mapping__c from scaleMatters__Stage_Mapping__c where scaleMatters__Name__c Like 'scaleMatters Stage Mapping' AND isDeleted = false  ];
        cmd[0].scaleMatters__isGhosted_Mapping__c = smMappingIG ;
        cmd[0].scaleMatters__LSBLIG__c = LSBLIG ;
         
        update cmd;
        
        
        }
    
    
    
    }
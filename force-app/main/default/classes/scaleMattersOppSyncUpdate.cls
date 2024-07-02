public class scaleMattersOppSyncUpdate {
    
    
     //method to process on bulkified stages updates for updates
    @InvocableMethod(label='Run Opportunity Currency AND Sync Update')
    public static void currencyInvocable(List<ID> ids){
        
         
        //quering if permission to run Opportunity Batch update was found
        List<scaleMatters__Run_Triggers__c> permissionsList = [select scaleMatters__Deactivate_All__c , scaleMatters__Run_Opportunity_Triggers__c from scaleMatters__Run_Triggers__c where scaleMatters__Name__c Like 'scaleMatters Run Triggers' AND isDeleted = false];
        
        if(permissionsList.size()>0 && permissionsList[0].scaleMatters__Run_Opportunity_Triggers__c && permissionsList[0].scaleMatters__Deactivate_All__c != true){
        
        
        //quering sync currency custom setting object
        List<scaleMatters__CurrencyMapping__c> cmList = [select scaleMatters__Currency_Field_1_Mapping__c,scaleMatters__Currency_Field_2_Mapping__c,scaleMatters__Currency_Field_3_Mapping__c,scaleMatters__Currency_Field_4_Mapping__c,scaleMatters__Currency_Field_5_Mapping__c,scaleMatters__Currency_Field_6_Mapping__c,scaleMatters__Currency_Field_7_Mapping__c,scaleMatters__Currency_Field_8_Mapping__c from scaleMatters__CurrencyMapping__c where scaleMatters__Name__c Like 'scaleMatters Currency Mapping Record' AND isDeleted = false];
        
         //quering sync mapping custom setting object
        List<scaleMatters__Sync_Mapping__c> smList = [select scaleMatters__Filter_Type__c, scaleMatters__Filtering_Logic__c, scaleMatters__Name__c,scaleMatters__Sync_Mapping__c,scaleMatters__Filter_1_Mapping__c,scaleMatters__Filter_2_Mapping__c,scaleMatters__Filter_3_Mapping__c,scaleMatters__Filter_4_Mapping__c,scaleMatters__Filter_5_Mapping__c,scaleMatters__Filter_6_Mapping__c,scaleMatters__Filter_7_Mapping__c,scaleMatters__Filter_8_Mapping__c,scaleMatters__Filter_9_Mapping__c,scaleMatters__Filter_10_Mapping__c,scaleMatters__Filter_11_Mapping__c,scaleMatters__Filter_12_Mapping__c,scaleMatters__Filter_13_Mapping__c,scaleMatters__Filter_14_Mapping__c,scaleMatters__Filter_15_Mapping__c,scaleMatters__Filter_16_Mapping__c,scaleMatters__Filter_17_Mapping__c,scaleMatters__Filter_18_Mapping__c , scaleMatters__Filter_19_Mapping__c, scaleMatters__Filter_20_Mapping__c, scaleMatters__Filter_21_Mapping__c, scaleMatters__Filter_22_Mapping__c, scaleMatters__Filter_23_Mapping__c, scaleMatters__Filter_24_Mapping__c, scaleMatters__Filter_25_Mapping__c	 from scaleMatters__Sync_Mapping__c where scaleMatters__Name__c LIKE 'scaleMatters Sync Mapping'];
        
         //quering Opportunity records from List of Ids passed in from Trigger    
        List<Opportunity> oppListNew = [select CloseDate , scaleMatters__Valid_Record__c, scaleMatters__Opportunity_Discard__c, scaleMatters__Prior_Stage__c, scaleMatters__Business_Unit__c, scaleMatters__Opportunity_Sync__c, CreatedDate, scaleMatters__scaleMatters_Currency_7__c,scaleMatters__scaleMatters_Currency_8__c, scaleMatters__S1_Date__c, scaleMatters__MRR__c, scaleMatters__ACV__c, scaleMatters__FYCV__c, scaleMatters__TCV__c, scaleMatters__OneTime_Fee__c, scaleMatters__Product_OneTime_Fee__c,ID,StageName,scaleMatters__S2_Date__c,scaleMatters__S3_Date__c,scaleMatters__S4_Date__c,scaleMatters__S5_Date__c,scaleMatters__S6_Date__c,scaleMatters__S7_Date__c,scaleMatters__S8_Date__c,scaleMatters__S9_Date__c,scaleMatters__S10_Date__c from Opportunity where ID IN : ids For Update ];
        
        //checking if currency mapping custom setting object have any mapping stored in it, if yes process currency update
        if(cmList.size()>0){
            
                
        	updateCurrency(ids,oppListNew,cmList,smList);
            
        }
        
         //checking if sync mapping custom setting object have any mapping stored in it, if yes process Sync update
        if(cmList.size()==0 && smList.size()>0){
            
            runSync(oppListNew, ids , smList);
            
            
        }
            
        }else{
            
            //do nothing as permission to run Opportunity Batch was not found 
            
        }
        
        
    }
    
    //method to process on bulkified currencies updates
    public static void updateCurrency(List<ID> OppIdList, List<Opportunity> oppListtoUpdate, List<scaleMatters__CurrencyMapping__c> cmd , List<scaleMatters__Sync_Mapping__c> smList){
        	
        	//Maps to process on all 8 currency fields and process on their actual values retrieved from custom settings 
            Map<ID, String> field1Map = New Map<ID, String>();
            Map<ID, String> field2Map = New Map<ID, String>();
            Map<ID, String> field3Map = New Map<ID, String>();
            Map<ID, String> field4Map = New Map<ID, String>();
            Map<ID, String> field5Map = New Map<ID, String>();
            Map<ID, String> field6Map = New Map<ID, String>();
            Map<ID, String> field7Map = New Map<ID, String>();
            Map<ID, String> field8Map = New Map<ID, String>();
           
        
            //checking if currency mapping custom setting object have any mapping stored in it, if yes process currency update
        	if(cmd.size()>0){
                
            //checking if mapping was found for individual scalematters currency fields, if found process on currency update , otherwise abort process
            if(cmd[0].scaleMatters__Currency_Field_1_Mapping__c!=Null){
                
            field1Map = setCurrencyValue(cmd[0].scaleMatters__Currency_Field_1_Mapping__c , OppIdList);
               
                for(Opportunity opp: oppListtoUpdate){
                for(ID key : field1Map.keySet()){
                    
                    
                    if(opp.Id == ID.valueOf(key)){
                                                                           
                        
                    	opp.scaleMatters__MRR__c = Decimal.valueOf(field1Map.get(key));
                        
                        }
                       }
                    }
                    
                
            }               
            if(cmd[0].scaleMatters__Currency_Field_2_Mapping__c!=Null){
            field2Map = setCurrencyValue(cmd[0].scaleMatters__Currency_Field_2_Mapping__c , OppIdList);
                
                for(Opportunity opp: oppListtoUpdate){
                for(ID key : field2Map.keySet()){
                    
                    if(opp.Id == ID.valueOf(key)){
                        
                    	opp.scaleMatters__ACV__c = Decimal.valueOf(field2Map.get(key));
                        
                        }
                    }
                    
                }
            
                
        }            
            if(cmd[0].scaleMatters__Currency_Field_3_Mapping__c!=Null){
            
            field3Map = setCurrencyValue(cmd[0].scaleMatters__Currency_Field_3_Mapping__c , OppIdList);
                
                for(Opportunity opp: oppListtoUpdate){
                for(ID key : field3Map.keySet()){
                    
                    if(opp.Id == ID.valueOf(key)){
                    
                    	opp.scaleMatters__FYCV__c = Decimal.valueOf(field3Map.get(key));
                        }
                    }
                    
                }
            
                
            }            
            if(cmd[0].scaleMatters__Currency_Field_4_Mapping__c!=Null){
            
            field4Map = setCurrencyValue(cmd[0].scaleMatters__Currency_Field_4_Mapping__c , OppIdList);
               
                for(Opportunity opp: oppListtoUpdate){
                for(ID key : field4Map.keySet()){
                    
                    if(opp.Id == ID.valueOf(key)){
                    	opp.scaleMatters__TCV__c = Decimal.valueOf(field4Map.get(key));
                        }
                    }
                    
                }
            }            
            if(cmd[0].scaleMatters__Currency_Field_5_Mapping__c!=Null){
            field5Map = setCurrencyValue(cmd[0].scaleMatters__Currency_Field_5_Mapping__c , OppIdList);
                
                for(Opportunity opp: oppListtoUpdate){
                for(ID key : field5Map.keySet()){
                    
                    if(opp.Id == ID.valueOf(key)){
                                                 
                    	opp.scaleMatters__OneTime_Fee__c = Decimal.valueOf(field5Map.get(key));
                        }
                    }
                    
                }
            
            }               
            if(cmd[0].scaleMatters__Currency_Field_6_Mapping__c!=Null){
            field6Map = setCurrencyValue(cmd[0].scaleMatters__Currency_Field_6_Mapping__c , OppIdList);
                
                for(Opportunity opp: oppListtoUpdate){
                for(ID key : field6Map.keySet()){
                    
                    if(opp.Id == ID.valueOf(key)){
                    
                    	opp.scaleMatters__Product_OneTime_Fee__c = Decimal.valueOf(field6Map.get(key));
                        }
                    }
                    
                }
            }           
            if(cmd[0].scaleMatters__Currency_Field_7_Mapping__c!=Null){
            field7Map = setCurrencyValue(cmd[0].scaleMatters__Currency_Field_7_Mapping__c , OppIdList);
                
                for(Opportunity opp: oppListtoUpdate){
                for(ID key : field7Map.keySet()){
                    
                    if(opp.Id == ID.valueOf(key)){
                    	opp.scaleMatters__scaleMatters_Currency_7__c = Decimal.valueOf(field7Map.get(key));
                        }
                    }
                    
                }
            }            
            if(cmd[0].scaleMatters__Currency_Field_8_Mapping__c!=Null){
            field8Map = setCurrencyValue(cmd[0].scaleMatters__Currency_Field_8_Mapping__c , OppIdList);
                
                for(Opportunity opp: oppListtoUpdate){
                for(ID key : field8Map.keySet()){
                    
                    if(opp.Id == ID.valueOf(key)){
                    	opp.scaleMatters__scaleMatters_Currency_8__c = Decimal.valueOf(field8Map.get(key));
                        }
                    }
                    
                }
            }
                
                                         
        	}
        
        	//calling out run sync method to initiate sync process
        	if(smList.size()>0){
        	
                runSync(oppListtoUpdate,OppIdList,smList);
        	
            }else{
                
                updateList(oppListtoUpdate);
                
            }
        
               
        
    }
    //method to retrieve custom setting records and run query on opportunity object to get its actual value and return Map of ID and Value
    public static Map<ID, String> setCurrencyValue(String field, List<ID> IDList){
        
        Map<ID, String> fieldValues = new Map<ID, String>();
        
        String query = 'Select id,'  +field+ ' from Opportunity where ID IN : IDList';
        
        
        List<Opportunity> oppList = database.query(query);
        
         
                
        for(Opportunity opp: oppList){
            
            Map<String, Object> oppMap = Opp.getPopulatedFieldsAsMap();
                
            	String fieldValue = '0.0';
                String recordID;
                  
            for (String fieldName : oppMap.keySet()){
                
                
                if(fieldName == 'Id'){
                    
                    recordID = String.valueOf(oppMap.get(fieldName));
                    
                }
                
                
                if(fieldName ==  field){
                    
                   fieldValue = String.valueOf(oppMap.get(fieldName));

                }
                
               
                fieldValues.put(recordID, fieldValue);
                     
                
            }
    
        	}
        
    
        return fieldValues;
        
    }
    
    //method to run Sync between sellScience and Salesforce
    public static void runSync(List<Opportunity> OppListtoUpdate , List<ID> newSet , List<scaleMatters__Sync_Mapping__c> smList ){
       
        //list to store all opportunities which were matched sync criteria
       List<ID> syncedOppIDList = new List<ID>(); 

        
	   //checking if sync mapping custom setting object have any mapping stored in it, if yes process Sync update
       if(smList.size()>0){
           
           String conditions = '';
           
           if(smList[0].scaleMatters__Filter_Type__c == 'Filter Condition'){
           
           conditions = '(' + getSyncConditions(smList) + ')';    
               
           }else if(smList[0].scaleMatters__Filter_Type__c == 'SOQL Condition'){
           
           conditions = '( '+ smList[0].scaleMatters__Sync_Mapping__c + ' )';
           
           }
           
           system.debug('conditions: ' + conditions);
           

             	String query = 'Select Id from Opportunity where '+ conditions + ' AND ID IN : newSet';       
        		List<Opportunity> oppList = database.query(query);
           
           		String recordID = '';
            
        		for(Opportunity opp: oppList){
            
            		Map<String, Object> oppMap = Opp.getPopulatedFieldsAsMap();
                    
                   for (String fieldName : oppMap.keySet()){
                
                	if(fieldName == 'Id'){
                        
                        
                        recordID = String.valueOf(oppMap.get(fieldName));
                        
                        
                        
                        
                    }
                       
                   }
                    syncedOppIDList.add(ID.valueOf(recordID));
                
            	
    
        		}
           
           
    	system.debug('syncedOppIDList: ' + syncedOppIDList);
            
        	}
        
        
        
		//checking if list to store opps with exect match with sync criteria has any records , if yes updating sync checkbox to true and discard checkbox to false otherwise creating discard records
        if(syncedOppIDList.size()>0){
                        
        for(ID oppID : syncedOppIDList){
                for(Opportunity opp: OppListtoUpdate){
                    if(oppID == opp.Id){
                        
                        opp.scaleMatters__Opportunity_Sync__c = true;
                        opp.scaleMatters__Opportunity_Discard__c = false;
                        
                        
                    }
                }
            }
            
           
            
        }else{
            
            
                for(Opportunity opp: OppListtoUpdate){
                        
                        opp.scaleMatters__Opportunity_Sync__c = false;
                        opp.scaleMatters__Opportunity_Discard__c = true;
                    
                }
                        
           
            
            
            
            
            
            
        }
        
        
        
        
        //passing opportunity list to Update Method 
        updateList(OppListtoUpdate);

        
        
     
    }
    
    //method to process on 09 Filter row conditions 
    public static String getSyncConditions(List<scaleMatters__Sync_Mapping__c> smList){
        
        String[] conArr1 = String.valueOf(smList[0].scaleMatters__Filtering_Logic__c).split('');
        
        
        String finalString = '';        
        String cond1Substring = '';
        String cond2Substring = '';
       	String cond3Substring = '';
        String cond4Substring = '';
        String cond5Substring = '';
        String cond6Substring = '';
        String cond7Substring = '';
        String cond8Substring = '';
        String cond9Substring = '';
        String cond10Substring = '';
       
        
        String cond1 = '';
        for(String con :conArr1){
            
           
            if(con.contains('1') && !con.contains('$') && !con.contains('%')){
                cond1 += smList[0].scaleMatters__Filter_1_Mapping__c + ' ';
                
            }
            else if(con.contains('A')){
                
                cond1 += 'A';
                
            }else if(con.contains('N')){
                
                cond1 += 'N';
                
            }else if(con.contains('D')){
                
                cond1 += 'D 1@';
                
            }else if(con.contains('O')){
                
                cond1 += 'O';
                
            }else if(con.contains('R')){
                
                cond1 += 'R 1@';
                
            }else{
                
                cond1 += con + ' ';
                
            }
            
            
            
        }
        cond1Substring = cond1.substringBefore('1@');   
       
                     
        //checking if Filtering condition contains 2
        String cond2 = cond1.substringAfter('1@');
        String[] conArr2 = cond2.split('');
        String con2 = '';
        for(String con :conArr2){
            
           if(con.contains('2') && !con.contains('$') && !con.contains('%')){
                con2 += smList[0].scaleMatters__Filter_2_Mapping__c ;
                
               
            }else if(con.contains('A')){
                
                con2 += 'A';
                
            }else if(con.contains('N')){
                
                con2 += 'N';
                
            }else if(con.contains('D')){
                
                con2 += 'D 2@';
                
            }else if(con.contains('O')){
                
                con2 += 'O';
                
            }else if(con.contains('R')){
                
                con2 += 'R 2@';
                
            }else{
            
            con2 += con;
                
            }
            
        }
        cond2Substring = con2.substringBefore('2@');
        

		//checking if Filtering condition contains 3
        String cond3 = con2.substringAfter('2@'); 
        String[] conArr3 = cond3.split('');
        String con3 = '';
        for(String con :conArr3){
            
            if(con.contains('3') && !con.contains('$') && !con.contains('%')){
                con3 +=  + smList[0].scaleMatters__Filter_3_Mapping__c + ' ';
                
            }else if(con.contains('A')){
                
                con3 += 'A';
                
            }else if(con.contains('N')){
                
                con3 += 'N';
                
            }else if(con.contains('D')){
                
                con3 += 'D 3@';
                
            }else if(con.contains('O')){
                
                con3 += 'O';
                
            }else if(con.contains('R')){
                
                con3 += 'R 3@';
                
                        
            }else{
            
            con3 += con;
                
            }
            
        }
        cond3Substring = con3.substringBefore('3@');

       
        //checking if Filtering condition contains 4
        String cond4 = con3.substringAfter('3@');
        String[] conArr4 = cond4.split('');
        String con4 = '';
        for(String con :conArr4){
            
            if(con.contains('4') && !con.contains('$') && !con.contains('%')){
                con4 += smList[0].scaleMatters__Filter_4_Mapping__c ;
                
            }else if(con.contains('A')){
                
                con4 += 'A';
                
            }else if(con.contains('N')){
                
                con4 += 'N';
                
            }else if(con.contains('D')){
                
                con4 += 'D 4@';
                
            }else if(con.contains('O')){
                
                con4 += 'O';
                
            }else if(con.contains('R')){
                
                con4 += 'R 4@';
                
                       
            }else{
            
            con4 += con ;
                
            }
            
        }
        cond4Substring = con4.substringBefore('4@');
         
        
        //checking if Filtering condition contains 5
        String cond5 = con4.substringAfter('4@');
        String[] conArr5 = cond5.split('');
        String con5 = '';
        for(String con :conArr5){
            
            if(con.contains('5') && !con.contains('$') && !con.contains('%')){
                con5 += smList[0].scaleMatters__Filter_5_Mapping__c ;
                
            }else if(con.contains('A')){
                
                con5 += 'A';
                
            }else if(con.contains('N')){
                
                con5 += 'N';
                
            }else if(con.contains('D')){
                
                con5 += 'D 5@';
                
            }else if(con.contains('O')){
                
                con5 += 'O';
                
            }else if(con.contains('R')){
                
                con5 += 'R 5@';
                
                       
            }else{
            
            con5 += con;
                
            }
            
        }
        cond5Substring = con5.substringBefore('5@');
        
        
        //checking if Filtering condition contains 6
        String cond6 = con5.substringAfter('5@');
        String[] conArr6 = cond6.split('');
        String con6 = '';
        for(String con :conArr6){
            
            if(con.contains('6') && !con.contains('$') && !con.contains('%')){
                con6 += smList[0].scaleMatters__Filter_6_Mapping__c ;
                
            }else if(con.contains('A')){
                
                con6 += 'A';
                
            }else if(con.contains('N')){
                
                con6 += 'N';
                
            }else if(con.contains('D')){
                
                con6 += 'D 6@';
                
            }else if(con.contains('O')){
                
                con6 += 'O';
                
            }else if(con.contains('R')){
                
                con6 += 'R 6@';
                
                       
            }else{
            
            con6 += con;
                
            }
            
        } 
        cond6Substring = con6.substringBefore('6@');
        
        
        //checking if Filtering condition contains 7
        String cond7 = con6.substringAfter('6@');
        String[] conArr7 = cond7.split('');
        String con7 = '';
        for(String con :conArr7){
            
            if(con.contains('7') && !con.contains('$') && !con.contains('%')){
                con7 += smList[0].scaleMatters__Filter_7_Mapping__c ;
                
            }else if(con.contains('A')){
                
                con7 += 'A';
                
            }else if(con.contains('N')){
                
                con7 += 'N';
                
            }else if(con.contains('D')){
                
                con7 += 'D 7@';
                
            }else if(con.contains('O')){
                
                con7 += 'O';
                
            }else if(con.contains('R')){
                
                con7 += 'R 7@';
                
                       
            }
            
            else{
            
            con7 += con;
                
            }
            
        } 
        cond7Substring = con7.substringbefore('7@');
        
        
        //checking if Filtering condition contains 8
        String cond8 = con7.substringAfter('7@');
        String[] conArr8 = cond8.split('');
        String con8 = '';
        for(String con :conArr8){
            
            if(con.contains('8') && !con.contains('$') && !con.contains('%')){
                con8 += smList[0].scaleMatters__Filter_8_Mapping__c ;
                
            }else if(con.contains('A')){
                
                con8 += 'A';
                
            }else if(con.contains('N')){
                
                con8 += 'N';
                
            }else if(con.contains('D')){
                
                con8 += 'D 8@';
                
            }else if(con.contains('O')){
                
                con8 += 'O';
                
            }else if(con.contains('R')){
                
                con8 += 'R 8@';
                
                       
            }else{
            
            con8 += con;
                
            }
            
        }
        cond8Substring = con8.substringBefore('8@');
        
        //checking if Filtering condition contains 9
        String cond9 = con8.substringAfter('8@');
        String[] conArr9 = cond9.split('');
        String con9 = '';
        for(String con :conArr9){
            
            if(con.contains('9') && !con.contains('$') && !con.contains('%')){
                con9 += smList[0].scaleMatters__Filter_9_Mapping__c ;
                
            }else if(con.contains('A')){
                
                con9 += 'A';
                
            }else if(con.contains('N')){
                
                con9 += 'N';
                
            }else if(con.contains('D')){
                
                con9 += 'D 9@';
                
            }else if(con.contains('O')){
                
                con9 += 'O';
                
            }else if(con.contains('R')){
                
                con9 += 'R 9@';
                
                       
            }else{
            
            con9 += con;
                
            }
            
        }        
        cond9Substring = con9.substringBefore('9@');
        
        
        finalString = cond1Substring + cond2Substring +cond3Substring +cond4Substring +cond5Substring +cond6Substring +cond7Substring +cond8Substring +cond9Substring ;
        
        String finalSliced = finalString.replace('1@', '').replace('2@','').replace('3@','').replace('4@','').replace('5@','').replace('6@','').replace('7@','').replace('8@','').replace('9@','').replace('%','').replace('$',' ');
        
        return finalSliced;
        
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
    opp.scaleMatters__Opportunity_Sync__c = false;   
                
                
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
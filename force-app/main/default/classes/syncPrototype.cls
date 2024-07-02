public class syncPrototype {
    
    public static void run(){
        
        List<scaleMatters__Sync_Mapping__c> smList = [select scaleMatters__Filter_Type__c, scaleMatters__Filtering_Logic__c, scaleMatters__Name__c,scaleMatters__Sync_Mapping__c,scaleMatters__Filter_1_Mapping__c,scaleMatters__Filter_2_Mapping__c,scaleMatters__Filter_3_Mapping__c,scaleMatters__Filter_4_Mapping__c,scaleMatters__Filter_5_Mapping__c,scaleMatters__Filter_6_Mapping__c,scaleMatters__Filter_7_Mapping__c,scaleMatters__Filter_8_Mapping__c,scaleMatters__Filter_9_Mapping__c,scaleMatters__Filter_10_Mapping__c,scaleMatters__Filter_11_Mapping__c,scaleMatters__Filter_12_Mapping__c,scaleMatters__Filter_13_Mapping__c,scaleMatters__Filter_14_Mapping__c,scaleMatters__Filter_15_Mapping__c,scaleMatters__Filter_16_Mapping__c,scaleMatters__Filter_17_Mapping__c,scaleMatters__Filter_18_Mapping__c , scaleMatters__Filter_19_Mapping__c, scaleMatters__Filter_20_Mapping__c, scaleMatters__Filter_21_Mapping__c, scaleMatters__Filter_22_Mapping__c, scaleMatters__Filter_23_Mapping__c, scaleMatters__Filter_24_Mapping__c, scaleMatters__Filter_25_Mapping__c	 from scaleMatters__Sync_Mapping__c where scaleMatters__Name__c LIKE 'scaleMatters Sync Mapping'];
        
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
         String cond11Substring = '';
         String cond12Substring = '';
         String cond13Substring = '';
         String cond14Substring = '';
         String cond15Substring = '';
         String cond16Substring = '';
         String cond17Substring = '';
         String cond18Substring = '';
         String cond19Substring = '';
         String cond20Substring = '';
         String cond21Substring = '';
        String cond22Substring = '';
        String cond23Substring = '';
        String cond24Substring = '';
        String cond25Substring = '';
       
        
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
        
        
        
        
       
         //checking if Filtering condition contains 9
        String cond10 = con9.substringAfter('9@');
        String[] conArr10 = cond10.split('');
        String con10 = '';
        for(String con :conArr10){
            
            if(con == '10' && !con.contains('$') && !con.contains('%')){
                con10 += smList[0].scaleMatters__Filter_10_Mapping__c ;
                
            }else if(con.contains('A')){
                
                con10 += 'A';
                
            }else if(con.contains('N')){
                
                con10 += 'N';
                
            }else if(con.contains('D')){
                
                con10 += 'D 10@';
                
            }else if(con.contains('O')){
                
                con10 += 'O';
                
            }else if(con.contains('R')){
                
                con10 += 'R 10@';
                
                       
            }
            
            else{
            
            con10 += con ;
                
            }
            
        }       
        system.debug('condition after execution of con 10 ' +  con10);
        cond10Substring = con10.substringBefore('@10');
        
        finalString = cond1Substring + cond2Substring +cond3Substring +cond4Substring +cond5Substring +cond6Substring +cond7Substring +cond8Substring +cond9Substring +  cond10Substring;
        
        String finalSliced = finalString.replace('1@', '').replace('2@','').replace('3@','').replace('4@','').replace('5@','').replace('6@','').replace('7@','').replace('8@','').replace('9@','').replace('10@','');
        
        system.debug('finalSliced  ' +  finalSliced);
        

       
    
        
    }
        
       
        
        
    

}
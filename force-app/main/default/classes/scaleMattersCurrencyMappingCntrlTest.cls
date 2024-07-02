@isTest(SeeAllData=true)
public class scaleMattersCurrencyMappingCntrlTest {
    
    @isTest static void currencyTest(){
        
        String smMapping1 = 'Amount';
        String smMapping2 = 'Amount';
        String smMapping3 = 'Amount';
        String smMapping4 = 'Amount';
        String smMapping5 = 'Amount';
        String smMapping6 = 'Amount';
        String smMapping7 = 'Amount';
        String smMapping8 = 'Amount';

        
        scaleMatters__CurrencyMapping__c cs = new scaleMatters__CurrencyMapping__c();
        cs.scaleMatters__Name__c = 'Test';
        
        
        //insert cs;
        /**
        scaleMatters__CurrencyMapping__c csUpdate = new scaleMatters__CurrencyMapping__c(id=cs.Id);
        cs.Name = 'Test Update';
        cs.scaleMatters__Currency_Field_1_Mapping__c = smMapping1;
        cs.scaleMatters__Currency_Field_2_Mapping__c = smMapping2;
        cs.scaleMatters__Currency_Field_3_Mapping__c = smMapping3;
        cs.scaleMatters__Currency_Field_4_Mapping__c = smMapping4;
        cs.scaleMatters__Currency_Field_5_Mapping__c = smMapping5;
        cs.scaleMatters__Currency_Field_6_Mapping__c = smMapping6;
        cs.scaleMatters__Currency_Field_7_Mapping__c = smMapping7;
        cs.scaleMatters__Currency_Field_8_Mapping__c = smMapping8;
        //update cs;
        
        **/
        
        
        List<String> currencies = new List<String>();
        List<SelectOption> items = new List<SelectOption>();

        
        scaleMattersCurrencyMappingCNTRL cm = new scaleMattersCurrencyMappingCNTRL();
        cm.currencyField1Mapping();
        cm.currencyField2Mapping();
        cm.currencyField3Mapping();
        cm.currencyField4Mapping();
        cm.currencyField5Mapping();
        cm.currencyField6Mapping();
        cm.currencyField7Mapping();
        cm.currencyField8Mapping();
        currencies = scaleMattersCurrencyMappingCNTRL.getCurrencyFields();
        items = cm.getItems();
        cm.setsmMapping1(smMapping1);
        cm.setsmMapping2(smMapping2);
        cm.setsmMapping3(smMapping3);
        cm.setsmMapping4(smMapping4);
        cm.setsmMapping5(smMapping5);
        cm.setsmMapping6(smMapping6);
        cm.setsmMapping7(smMapping7);
        cm.setsmMapping8(smMapping8);
        cm.getsmMapping1();
        cm.getsmMapping2();
        cm.getsmMapping3();
        cm.getsmMapping4();
        cm.getsmMapping5();
        
        

        
        

        
        
        

        
    }

}
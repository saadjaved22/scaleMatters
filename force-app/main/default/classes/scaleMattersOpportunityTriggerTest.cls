@isTest(SeeAllData=true)
public class scaleMattersOpportunityTriggerTest {
    
    @isTest static void TestOpportunity(){
        
        Account acc = new Account();
        acc.Name = 'Test';
        insert acc;
        
        
        Opportunity oppDel = new Opportunity();
        oppDel.Name = 'Test Opportunity for Delete';
        oppDel.StageName = 'Stage 1';
        oppDel.CloseDate = system.today();
        oppDel.AccountId = acc.id;
        oppDel.Amount = 1200;
        

        insert oppDel;
       
        
        delete oppDel;
    
    
    }

}
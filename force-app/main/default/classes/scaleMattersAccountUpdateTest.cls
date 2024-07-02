@isTest(SeeAllData=true)
public class scaleMattersAccountUpdateTest {
    
    @isTest static void TestAccount(){
        
        	Account acc = new Account();
            List<ID> ids = new List<Id>();
            
            acc.Name = 'Test Account';
            insert acc;
            ids.add(acc.Id);
            
            scaleMattersAccountUpdate.updateAccount(ids);
            
            
        }
        
        
        
        
    }
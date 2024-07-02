@isTest(SeeAllData=true)
public class scaleMattersTest {
    
    @isTest static ID createAccount(){
        
        List<Id> id = new List<ID>();

        
        Account acc = new Account();
        acc.Name = 'Test Account';
        insert acc;
        
        return acc.id;
        
        
        
    }
    
    @isTest static void testCloseDate(){
        
        List<Id> ids = new List<ID>();
        
        id accid = createAccount();
        
        Opportunity opp = new Opportunity();
        opp.Name = 'Test Opportunity';
        opp.StageName = 'Closed Won';
        opp.CloseDate = system.today();
        opp.AccountId = accid;
        opp.Amount = 1200;
        opp.scaleMatters__Business_Unit__c = 'Unassigned';

        insert opp;
        
        Opportunity opp2 = new Opportunity(id = opp.id);
        
        opp2.CloseDate = system.today() + 1 ;
        opp2.scaleMatters__S2_Date__c = date.valueOf('2024-02-12');
        opp2.scaleMatters__S1_Date__c = date.valueOf('2024-02-12');
        opp2.scaleMatters__S3_Date__c = date.valueOf('2024-02-12');
        opp2.scaleMatters__S4_Date__c = date.valueOf('2024-02-12');
        opp2.scaleMatters__S5_Date__c = date.valueOf('2024-02-12');
        opp2.scaleMatters__S6_Date__c = date.valueOf('2024-02-12');
        opp2.scaleMatters__S7_Date__c = date.valueOf('2024-02-12');
        opp2.scaleMatters__S8_Date__c = date.valueOf('2024-02-12');
        opp2.scaleMatters__S9_Date__c = date.valueOf('2024-02-12');
        opp2.scaleMatters__S10_Date__c = date.valueOf('2024-02-12');
        
        
        update opp2;
        
        ids.add(opp.Id);
        
        scaleMattersOppCloseDateUpdate.closeDateUpdate(ids);
        scaleMattersOppCreate.oppCreate(ids);
        
    }
         
    @isTest static void TestAccount(){
        
        Account acc = new Account();
        acc.Name = 'Test Account';
        insert acc;
        
        Account accUpdate = new Account(id = acc.Id);
        accUpdate.Name = 'Test Account Updated';
        accUpdate.scaleMatters__Account_Discard__c = true;
        update accUpdate;
        
        delete acc;
        
       
        
        
        scaleMatters__Deleted_Record__c delObj = new scaleMatters__Deleted_Record__c();
        delObj.scaleMatters__Bulk_Delete__c = false;
        delObj.scaleMatters__Deleted_Business_Unit__c = 'Test Business Unit';
        delObj.scaleMatters__Deleted_Date_Time__c = system.today();
        delObj.scaleMatters__Deleted_Object__c = 'Test Object';
        delObj.scaleMatters__Deleted_SafeID__c = acc.Id;
        
        insert delObj;
        
        scaleMatters__Discarded_Record__c discObj = new scaleMatters__Discarded_Record__c();
        discObj.scaleMatters__Discarded_Business_Unit__c = acc.scaleMatters__Business_Unit__c;
        discObj.scaleMatters__Discarded_Date_Time__c = system.Now();
        discObj.scaleMatters__Discarded_Object__c = 'Account'; 
        discObj.scaleMatters__Discarded_SafeID__c = accUpdate.Id;
        
        insert discObj;

        
        
        
    }
    
    @isTest static void TestContact(){
        
        id accid = createAccount();
        
        Contact con = new Contact();
        con.LastName = 'Test contact';
        con.AccountId = accid;
        con.scaleMatters__Business_Unit__c = 'Unassigned';
        insert con;
        
        Contact conUpdate = new Contact(id = con.id);
        conUpdate.LastName = 'Test Contact Updated';
        conUpdate.scaleMatters__Contact_Discard__c = true;
        update conUpdate;
        
        Task tsk = new Task();
        tsk.WhoId = conUpdate.Id;
        tsk.Subject = 'Call';
        tsk.Status = 'Completed';
        tsk.ActivityDate = Date.newInstance(2023, 01, 22);
        tsk.ownerid = UserInfo.getUserId();
        insert tsk;
        
        
        
        
        List<ID> ids = new List<ID>();
        ids.add(conUpdate.Id);
        
        scaleMattersContactUpdate.updateContact(ids);
        
        
      
        delete con;
        
       
        
        
        scaleMatters__Deleted_Record__c delObj = new scaleMatters__Deleted_Record__c();
        delObj.scaleMatters__Bulk_Delete__c = false;
        delObj.scaleMatters__Deleted_Business_Unit__c = 'Test Business Unit';
        delObj.scaleMatters__Deleted_Date_Time__c = system.today();
        delObj.scaleMatters__Deleted_Object__c = 'Test Object';
        delObj.scaleMatters__Deleted_SafeID__c = con.Id;
        
        insert delObj;
        
        scaleMatters__Discarded_Record__c discObj = new scaleMatters__Discarded_Record__c();
        discObj.scaleMatters__Discarded_Business_Unit__c =  con.scaleMatters__Business_Unit__c;
        discObj.scaleMatters__Discarded_Date_Time__c = system.Now();
        discObj.scaleMatters__Discarded_Object__c = 'Contact'; 
        discObj.scaleMatters__Discarded_SafeID__c = conUpdate.Id;
        
        insert discObj;
        
        
        
    } 
    
    @isTest static void TestOpportunityCreate(){
        
        id accid = createAccount();
        
        List<ID> oppListNew = new List<ID>();        
        

        //testing if stages are 1 and 2
        
        Opportunity opp = new Opportunity();
        opp.Name = 'Test Opportunity';
        opp.StageName = 'Stage 1';
        opp.CloseDate = system.today();
        opp.AccountId = accid;
        opp.Amount = 1200;

        insert opp;
       
        Opportunity opp2 = new Opportunity();
        opp2.Name = 'Test Opportunity';
        opp2.StageName = 'Stage 2';
        opp2.CloseDate = system.today();
        opp2.AccountId = accid;
        opp2.Amount = 1200;
        opp2.scaleMatters__Business_Unit__c = 'Unassigned';
        
        

        insert opp2;
       
        Opportunity opp3 = new Opportunity();
        opp3.Name = 'Test Opportunity';
        opp3.StageName = 'Stage 3';
        opp3.CloseDate = system.today();
        opp3.AccountId = accid;
        opp3.Amount = 1200;
        opp3.scaleMatters__Business_Unit__c = 'Unassigned';
        
        

        insert opp3;
       
        Opportunity opp4 = new Opportunity();
        opp4.Name = 'Test Opportunity';
        opp4.StageName = 'Stage 4';
        opp4.CloseDate = system.today();
        opp4.AccountId = accid;
        opp4.Amount = 1200;
        opp4.scaleMatters__Business_Unit__c = 'Unassigned';
        
        

        insert opp4;
       
       
        
        
        
    }  
    
    @isTest static void TestOpportunityCreate2(){
        
        id accid = createAccount();
        
        List<ID> oppListNew = new List<ID>();        
        

        //testing if stages are 1 and 2
        
        Opportunity opp = new Opportunity();
        opp.Name = 'Test Opportunity';
        opp.StageName = 'Stage 5';
        opp.CloseDate = system.today();
        opp.AccountId = accid;
        opp.Amount = 1200;

        insert opp;
       
        Opportunity opp2 = new Opportunity();
        opp2.Name = 'Test Opportunity';
        opp2.StageName = 'Stage 6';
        opp2.CloseDate = system.today();
        opp2.AccountId = accid;
        opp2.Amount = 1200;
        opp2.scaleMatters__Business_Unit__c = 'Unassigned';
        
        

        insert opp2;
       
        Opportunity opp3 = new Opportunity();
        opp3.Name = 'Test Opportunity';
        opp3.StageName = 'Stage 7';
        opp3.CloseDate = system.today();
        opp3.AccountId = accid;
        opp3.Amount = 1200;
        opp3.scaleMatters__Business_Unit__c = 'Unassigned';
        
        

        insert opp3;
       
        Opportunity opp4 = new Opportunity();
        opp4.Name = 'Test Opportunity';
        opp4.StageName = 'Stage 8';
        opp4.CloseDate = system.today();
        opp4.AccountId = accid;
        opp4.Amount = 1200;
        opp4.scaleMatters__Business_Unit__c = 'Unassigned';
        
        

        insert opp4;
       
       
        
        
        
    }  
    
    @isTest static void TestOpportunityCreate3(){
        
        id accid = createAccount();
        
        List<ID> oppListNew = new List<ID>();        
        

        //testing if stages are 1 and 2
        
        Opportunity opp = new Opportunity();
        opp.Name = 'Test Opportunity';
        opp.StageName = 'Closed Lost';
        opp.CloseDate = system.today();
        opp.AccountId = accid;
        opp.Amount = 1200;

        insert opp;
       
        Opportunity opp2 = new Opportunity();
        opp2.Name = 'Test Opportunity';
        opp2.StageName = 'Closed Won';
        opp2.CloseDate = system.today();
        opp2.AccountId = accid;
        opp2.Amount = 1200;
        opp2.scaleMatters__Business_Unit__c = 'Unassigned';
        
        

        insert opp2;
        
    }  
    
    @isTest static void TestOpportunityCreate4(){
        
        id accid = createAccount();
        
        List<ID> oppListNew = new List<ID>();        
        

        //testing if stages are 1 and 2
        
        Opportunity opp = new Opportunity();
        opp.Name = 'Test Opportunity';
        opp.StageName = 'Closed Booked';
        opp.CloseDate = system.today();
        opp.AccountId = accid;
        opp.Amount = 1200;

        insert opp;
         
        Opportunity opp2 = new Opportunity();
        opp2.Name = 'Test Opportunity';
        opp2.StageName = 'Closed Ghosted';
        opp2.CloseDate = system.today();
        opp2.AccountId = accid;
        opp2.Amount = 1200;

        insert opp2;
       
        
    }  
    
    @isTest static void TestOpportunityCreate5(){
        
        id accid = createAccount();
        
        List<ID> oppListNew = new List<ID>();        
        

        //testing if stages are 1 and 2
        
        Opportunity opp = new Opportunity();
        opp.Name = 'Test Opportunity';
        opp.StageName = 'Stage 7';
        opp.CloseDate = system.today();
        opp.AccountId = accid;
        opp.Amount = 1200;

        insert opp;
         
        Opportunity opp2 = new Opportunity();
        opp2.Name = 'Test Opportunity';
        opp2.StageName = 'Stage 8';
        opp2.CloseDate = system.today();
        opp2.AccountId = accid;
        opp2.Amount = 1200;

        insert opp2;
       
        
    }
    
    @isTest static void TestOpportunity(){
        
        id accid = createAccount();
        
        List<ID> oppListNew = new List<ID>();        
        

        //testing if stages are 1 and 2
        
        Opportunity opp = new Opportunity();
        opp.Name = 'Test Opportunity';
        opp.StageName = 'Stage 1';
        opp.CloseDate = system.today();
        opp.AccountId = accid;
        opp.Amount = 1200;
        opp.scaleMatters__Business_Unit__c = 'Unassigned';
        
        

        insert opp;

        
        Opportunity oppUpdate2 = new Opportunity(Id= opp.Id);
        oppUpdate2.Name = 'Test';
        oppUpdate2.StageName = 'Stage 2';
        
        update oppUpdate2;
        oppListNew.add(oppUpdate2.Id);   
        
        Opportunity oppUpdate3 = new Opportunity(Id= opp.Id);
        oppUpdate3.Name = 'Test';
        oppUpdate3.StageName = 'Stage 3';
        
        update oppUpdate3;
        oppListNew.add(oppUpdate3.Id);   
        
        Opportunity oppUpdate4 = new Opportunity(Id= opp.Id);
        oppUpdate4.Name = 'Test';
        oppUpdate4.StageName = 'Stage 4';
        
        update oppUpdate4;
        oppListNew.add(oppUpdate4.Id);  
        
        Opportunity oppUpdate5 = new Opportunity(Id= opp.Id);
        oppUpdate5.Name = 'Test';
        oppUpdate5.StageName = 'Stage 5';
        
        //update oppUpdate5;
        
        Opportunity oppUpdate6 = new Opportunity(Id= opp.Id);
        oppUpdate6.Name = 'Test';
        oppUpdate6.StageName = 'Stage 6';
        
        //update oppUpdate6;
        
        
        Opportunity oppUpdate7 = new Opportunity(Id= opp.Id);
        oppUpdate7.Name = 'Test';
        oppUpdate7.StageName = 'Stage 7';
        
        //update oppUpdate7;
        
        
        Opportunity oppUpdate8 = new Opportunity(Id= opp.Id);
        oppUpdate8.Name = 'Test';
        oppUpdate8.StageName = 'Stage 8';
        
        //update oppUpdate8;
        
        Opportunity oppUpdate9 = new Opportunity(Id= opp.Id);
        oppUpdate9.Name = 'Test';
        oppUpdate8.StageName = 'Closed Lost';
        
        //update oppUpdate9;
        
        Opportunity oppUpdatecw = new Opportunity(Id= opp.Id);
        oppUpdatecw.Name = 'Test';
        oppUpdatecw.StageName = 'Closed Won';
        
        //update oppUpdatecw;
        
        
        
        
        
       
        
        
        
    }    
    
    @isTest static void TestOpportunity2(){
        
        id accid = createAccount();
        
        List<ID> oppListNew = new List<ID>();        
        

        //testing if stages are 1 and 2
        
        Opportunity opp = new Opportunity();
        opp.Name = 'Test Opportunity';
        opp.StageName = 'Stage 1';
        opp.CloseDate = system.today();
        opp.AccountId = accid;
        opp.Amount = 1200;
        opp.scaleMatters__Business_Unit__c = 'Unassigned';
        
        

        insert opp;

        
        Opportunity oppUpdate2 = new Opportunity(Id= opp.Id);
        oppUpdate2.Name = 'Test';
        oppUpdate2.StageName = 'Stage 5';
        
        update oppUpdate2;
        oppListNew.add(oppUpdate2.Id);   
        
        Opportunity oppUpdate3 = new Opportunity(Id= opp.Id);
        oppUpdate3.Name = 'Test';
        oppUpdate3.StageName = 'Stage 6';
        
        update oppUpdate3;
        oppListNew.add(oppUpdate3.Id);   
        
        Opportunity oppUpdate4 = new Opportunity(Id= opp.Id);
        oppUpdate4.Name = 'Test';
        oppUpdate4.StageName = 'Stage 7';
        
        update oppUpdate4;
        oppListNew.add(oppUpdate4.Id);          
        
       
        
        
        
    }
    
    @isTest static void TestOpportunity3(){
        
        id accid = createAccount();
        
        List<ID> oppListNew = new List<ID>();        
        

        //testing if stages are 1 and 2
        
        Opportunity opp = new Opportunity();
        opp.Name = 'Test Opportunity';
        opp.StageName = 'Stage 1';
        opp.CloseDate = system.today();
        opp.AccountId = accid;
        opp.Amount = 1200;
        opp.scaleMatters__Business_Unit__c = 'Unassigned';
        

        insert opp;

        
        Opportunity oppUpdate2 = new Opportunity(Id= opp.Id);
        oppUpdate2.Name = 'Test';
        oppUpdate2.StageName = 'Stage 8';
        
        update oppUpdate2;
        oppListNew.add(oppUpdate2.Id);   
        
        Opportunity oppUpdate3 = new Opportunity(Id= opp.Id);
        oppUpdate3.Name = 'Test';
        oppUpdate3.StageName = 'Closed Lost';
        
        update oppUpdate3;
        oppListNew.add(oppUpdate3.Id);   
        
        Opportunity oppUpdate4 = new Opportunity(Id= opp.Id);
        oppUpdate4.Name = 'Test';
        oppUpdate4.StageName = 'Closed Won';
        
        update oppUpdate4;
        oppListNew.add(oppUpdate4.Id);          
        
       
        
        
        
    }
    
    @isTest static void TestOpportunity4(){
        
        id accid = createAccount();
        
        List<ID> oppListNew = new List<ID>();        
        

        //testing if stages are 1 and 2
        
        Opportunity opp = new Opportunity();
        opp.Name = 'Test Opportunity';
        opp.StageName = 'Stage 1';
        opp.CloseDate = system.today();
        opp.AccountId = accid;
        opp.Amount = 1200;
        opp.scaleMatters__Business_Unit__c = 'Unassigned';
        

        insert opp;

        
        Opportunity oppUpdate2 = new Opportunity(Id= opp.Id);
        oppUpdate2.Name = 'Test';
        oppUpdate2.StageName = 'Closed Booked';
        
        update oppUpdate2;
        oppListNew.add(oppUpdate2.Id);   
        
        Opportunity oppUpdate3 = new Opportunity(Id= opp.Id);
        oppUpdate3.Name = 'Test';
        oppUpdate3.StageName = 'Closed Ghosted';
        
        update oppUpdate3;
        oppListNew.add(oppUpdate3.Id);   
        
       
       
        
        
        
    }
    
    @isTest static void TestOpportunity5(){
        
        id accid = createAccount();
        
        List<ID> oppListNew = new List<ID>();        
        

        //testing if stages are 1 and 2
        
        Opportunity opp = new Opportunity();
        opp.Name = 'Test Opportunity';
        opp.StageName = 'Closed Booked';
        opp.CloseDate = system.today();
        opp.AccountId = accid;
        opp.Amount = 1200;
        opp.scaleMatters__Business_Unit__c = 'Unassigned';
        
        

        insert opp;

        
        Opportunity oppUpdate2 = new Opportunity(Id= opp.Id);
        oppUpdate2.Name = 'Test';
        oppUpdate2.StageName = 'Stage 2';
        
        update oppUpdate2;
        oppListNew.add(oppUpdate2.Id);   
        
        Opportunity oppUpdate3 = new Opportunity(Id= opp.Id);
        oppUpdate3.Name = 'Test';
        oppUpdate3.StageName = 'Stage 3';
        
        update oppUpdate3;
        oppListNew.add(oppUpdate3.Id);   
        
        Opportunity oppUpdate4 = new Opportunity(Id= opp.Id);
        oppUpdate4.Name = 'Test';
        oppUpdate4.StageName = 'Stage 4';
        
        update oppUpdate4;
        oppListNew.add(oppUpdate4.Id);  
        
        Opportunity oppUpdate5 = new Opportunity(Id= opp.Id);
        oppUpdate5.Name = 'Test';
        oppUpdate5.StageName = 'Stage 5';
        
        //update oppUpdate5;
        
        Opportunity oppUpdate6 = new Opportunity(Id= opp.Id);
        oppUpdate6.Name = 'Test';
        oppUpdate6.StageName = 'Stage 6';
        
        //update oppUpdate6;
        
        
        Opportunity oppUpdate7 = new Opportunity(Id= opp.Id);
        oppUpdate7.Name = 'Test';
        oppUpdate7.StageName = 'Stage 7';
        
        //update oppUpdate7;
        
        
        Opportunity oppUpdate8 = new Opportunity(Id= opp.Id);
        oppUpdate8.Name = 'Test';
        oppUpdate8.StageName = 'Stage 8';
        
        //update oppUpdate8;
        
        Opportunity oppUpdate9 = new Opportunity(Id= opp.Id);
        oppUpdate9.Name = 'Test';
        oppUpdate8.StageName = 'Closed Lost';
        
        //update oppUpdate9;
        
        Opportunity oppUpdatecw = new Opportunity(Id= opp.Id);
        oppUpdatecw.Name = 'Test';
        oppUpdatecw.StageName = 'Closed Won';
        
        //update oppUpdatecw;
        
        
        
        
        
       
        
        
        
    }    
    
    @isTest static void TestOpportunity6(){
        
        id accid = createAccount();
        
        List<ID> oppListNew = new List<ID>();        
        

        //testing if stages are 1 and 2
        
        Opportunity opp = new Opportunity();
        opp.Name = 'Test Opportunity';
        opp.StageName = 'Closed Booked';
        opp.CloseDate = system.today();
        opp.AccountId = accid;
        opp.Amount = 1200;
        opp.scaleMatters__Business_Unit__c = 'Unassigned';
        

        insert opp;

        
        Opportunity oppUpdate2 = new Opportunity(Id= opp.Id);
        oppUpdate2.Name = 'Test';
        oppUpdate2.StageName = 'Stage 5';
        
        update oppUpdate2;
        oppListNew.add(oppUpdate2.Id);   
        
        Opportunity oppUpdate3 = new Opportunity(Id= opp.Id);
        oppUpdate3.Name = 'Test';
        oppUpdate3.StageName = 'Stage 6';
        
        update oppUpdate3;
        oppListNew.add(oppUpdate3.Id);   
        
        Opportunity oppUpdate4 = new Opportunity(Id= opp.Id);
        oppUpdate4.Name = 'Test';
        oppUpdate4.StageName = 'Stage 7';
        
        update oppUpdate4;
        oppListNew.add(oppUpdate4.Id);          
        
       
        
        
        
    }
    
    @isTest static void TestOpportunity7(){
        
        id accid = createAccount();
        
        List<ID> oppListNew = new List<ID>();        
        

        //testing if stages are 1 and 2
        
        Opportunity opp = new Opportunity();
        opp.Name = 'Test Opportunity';
        opp.StageName = 'Closed Booked';
        opp.CloseDate = system.today();
        opp.AccountId = accid;
        opp.Amount = 1200;
        opp.scaleMatters__Business_Unit__c = 'Unassigned';
        
        

        insert opp;

        
        Opportunity oppUpdate2 = new Opportunity(Id= opp.Id);
        oppUpdate2.Name = 'Test';
        oppUpdate2.StageName = 'Stage 8';
        
        update oppUpdate2;
        oppListNew.add(oppUpdate2.Id);   
        
        Opportunity oppUpdate3 = new Opportunity(Id= opp.Id);
        oppUpdate3.Name = 'Test';
        oppUpdate3.StageName = 'Closed Lost';
        
        update oppUpdate3;
        oppListNew.add(oppUpdate3.Id);   
        
        Opportunity oppUpdate4 = new Opportunity(Id= opp.Id);
        oppUpdate4.Name = 'Test';
        oppUpdate4.StageName = 'Closed Won';
        
        //update oppUpdate4;
        oppListNew.add(oppUpdate4.Id);          
        
       
        
        
        
    }
    
    @isTest static void TestOpportunity8(){
        
        id accid = createAccount();
        
        List<ID> oppListNew = new List<ID>();        
        

        //testing if stages are 1 and 2
        
        Opportunity opp = new Opportunity();
        opp.Name = 'Test Opportunity';
        opp.StageName = 'Closed Booked';
        opp.CloseDate = system.today();
        opp.AccountId = accid;
        opp.Amount = 1200;
        opp.scaleMatters__Business_Unit__c = 'Unassigned';
        

        insert opp;

        
        Opportunity oppUpdate2 = new Opportunity(Id= opp.Id);
        oppUpdate2.Name = 'Test';
        oppUpdate2.StageName = 'Closed Booked';
        
        update oppUpdate2;
        oppListNew.add(oppUpdate2.Id);   
        
        Opportunity oppUpdate3 = new Opportunity(Id= opp.Id);
        oppUpdate3.Name = 'Test';
        oppUpdate3.StageName = 'Closed Ghosted';
        
        update oppUpdate3;
        oppListNew.add(oppUpdate3.Id);   
        
       
       
        
        
        
    }
    
    @isTest static void TestOpportunity9(){
        
        id accid = createAccount();
        
        List<ID> oppListNew = new List<ID>();        
        

        //testing if stages are 1 and 2
        
        Opportunity opp = new Opportunity();
        opp.Name = 'Test Opportunity';
        opp.StageName = 'Closed Booked';
        opp.CloseDate = system.today();
        opp.AccountId = accid;
        opp.Amount = 1200;
        opp.scaleMatters__Business_Unit__c = 'Unassigned';
        
        

        insert opp;

        
        Opportunity oppUpdate2 = new Opportunity(Id= opp.Id);
        oppUpdate2.Name = 'Test';
        oppUpdate2.StageName = 'Stage 8';
        
        update oppUpdate2;
        oppListNew.add(oppUpdate2.Id);   
        
        Opportunity oppUpdate3 = new Opportunity(Id= opp.Id);
        oppUpdate3.Name = 'Test';
        oppUpdate3.StageName = 'Stage 7';
        
        update oppUpdate3;
        oppListNew.add(oppUpdate3.Id);   
        
        Opportunity oppUpdate4 = new Opportunity(Id= opp.Id);
        oppUpdate4.Name = 'Test';
        oppUpdate4.StageName = 'Stage 6';
        
        update oppUpdate4;
        oppListNew.add(oppUpdate4.Id);  
       
        
        
        
    }  
    
    @isTest static void TestOpportunity10(){
        
        id accid = createAccount();
        
        List<ID> oppListNew = new List<ID>();        
        

        //testing if stages are 1 and 2
        
        Opportunity opp = new Opportunity();
        opp.Name = 'Test Opportunity';
        opp.StageName = 'Closed Booked';
        opp.CloseDate = system.today();
        opp.AccountId = accid;
        opp.Amount = 1200;
        opp.scaleMatters__Business_Unit__c = 'Unassigned';
        

        insert opp;

        
        Opportunity oppUpdate2 = new Opportunity(Id= opp.Id);
        oppUpdate2.Name = 'Test';
        oppUpdate2.StageName = 'Stage 5';
        
        update oppUpdate2;
        oppListNew.add(oppUpdate2.Id);   
        
        Opportunity oppUpdate3 = new Opportunity(Id= opp.Id);
        oppUpdate3.Name = 'Test';
        oppUpdate3.StageName = 'Stage 4';
        
        update oppUpdate3;
        oppListNew.add(oppUpdate3.Id);   
        
        Opportunity oppUpdate4 = new Opportunity(Id= opp.Id);
        oppUpdate4.Name = 'Test';
        oppUpdate4.StageName = 'Stage 3';
        
        update oppUpdate4;
        oppListNew.add(oppUpdate4.Id);  
       
        
        
        
    }

	@isTest static void TestOpportunity11(){
        
        id accid = createAccount();
        
        List<ID> oppListNew = new List<ID>();        
        

        //testing if stages are 1 and 2
        
        Opportunity opp = new Opportunity();
        opp.Name = 'Test Opportunity';
        opp.StageName = 'Closed Booked';
        opp.CloseDate = system.today();
        opp.AccountId = accid;
        opp.Amount = 1200;
        opp.scaleMatters__Business_Unit__c = 'Unassigned';
        
        

        insert opp;

        
        Opportunity oppUpdate2 = new Opportunity(Id= opp.Id);
        oppUpdate2.Name = 'Test';
        oppUpdate2.StageName = 'Stage 3';
        
        update oppUpdate2;
        oppListNew.add(oppUpdate2.Id);   
        
        Opportunity oppUpdate3 = new Opportunity(Id= opp.Id);
        oppUpdate3.Name = 'Test';
        oppUpdate3.StageName = 'Stage 2';
        
        update oppUpdate3;
        oppListNew.add(oppUpdate3.Id);   
        
        Opportunity oppUpdate4 = new Opportunity(Id= opp.Id);
        oppUpdate4.Name = 'Test';
        oppUpdate4.StageName = 'Stage 1';
        
        update oppUpdate4;
        oppListNew.add(oppUpdate4.Id);  
       
        
        
        
    } 
    
    @isTest static void TestOpportunity12(){
        
        id accid = createAccount();
        
        List<ID> oppListNew = new List<ID>();        
        

        //testing if stages are 1 and 2
        
        Opportunity opp = new Opportunity();
        opp.Name = 'Test Opportunity';
        opp.StageName = 'Closed Booked';
        opp.CloseDate = system.today();
        opp.AccountId = accid;
        opp.Amount = 1200;
        opp.scaleMatters__Business_Unit__c = 'Unassigned';
        

        insert opp;

        
        Opportunity oppUpdate2 = new Opportunity(Id= opp.Id);
        oppUpdate2.Name = 'Test';
        oppUpdate2.StageName = 'Closed Lost';
        
        update oppUpdate2;
        oppListNew.add(oppUpdate2.Id);  
        
        Opportunity oppUpdate3 = new Opportunity(Id= opp.Id);
        oppUpdate3.Name = 'Test';
        oppUpdate3.StageName = 'Closed Won';
        
        update oppUpdate3;
        oppListNew.add(oppUpdate3.Id);
        
        Opportunity oppUpdate4 = new Opportunity(Id= opp.Id);
        oppUpdate4.Name = 'Test';
        oppUpdate4.StageName = 'Closed Ghosted';
        
        //update oppUpdate4;
        oppListNew.add(oppUpdate4.Id);
       
        
        
        
    }    
    
    @isTest static void TestOpportunity13(){
        
        id accid = createAccount();
        
        List<ID> oppListNew = new List<ID>();        
        

        //testing if stages are 1 and 2
        
        Opportunity opp = new Opportunity();
        opp.Name = 'Test Opportunity';
        opp.StageName = 'Closed Booked';
        opp.CloseDate = system.today();
        opp.AccountId = accid;
        opp.Amount = 1200;
        opp.scaleMatters__Business_Unit__c = 'Unassigned';
        

        insert opp;

        
        Opportunity oppUpdate2 = new Opportunity(Id= opp.Id);
        oppUpdate2.Name = 'Test';
        oppUpdate2.StageName = 'Closed Won';
        
        update oppUpdate2;
        oppListNew.add(oppUpdate2.Id);  
             
        
        Opportunity oppUpdate4 = new Opportunity(Id= opp.Id);
        oppUpdate4.Name = 'Test';
        oppUpdate4.StageName = 'Closed Ghosted';
        
        update oppUpdate4;
        oppListNew.add(oppUpdate4.Id);
       
        
        
        
    } 
    
    @isTest static void TestOpportunity14(){
        
        id accid = createAccount();
        
        List<ID> oppListNew = new List<ID>();        
        

        //testing if stages are 1 and 2
        
        Opportunity opp = new Opportunity();
        opp.Name = 'Test Opportunity';
        opp.StageName = 'Closed Ghosted';
        opp.CloseDate = system.today();
        opp.AccountId = accid;
        opp.Amount = 1200;
        opp.scaleMatters__Business_Unit__c = 'Unassigned';
        
        

        insert opp;

        
        Opportunity oppUpdate2 = new Opportunity(Id= opp.Id);
        oppUpdate2.Name = 'Test';
        oppUpdate2.StageName = 'Closed Booked';
        
        update oppUpdate2;
        oppListNew.add(oppUpdate2.Id);  
             
        
        Opportunity oppUpdate4 = new Opportunity(Id= opp.Id);
        oppUpdate4.Name = 'Test';
        oppUpdate4.StageName = 'Closed Ghosted';
        
        update oppUpdate4;
        oppListNew.add(oppUpdate4.Id);
       
        
        
        
    }    
    
    @isTest static void TestOpportunity15(){
        
        id accid = createAccount();
        
        List<ID> oppListNew = new List<ID>();        
        

        //testing if stages are 1 and 2
        
        Opportunity opp = new Opportunity();
        opp.Name = 'Test Opportunity';
        opp.StageName = 'Closed Ghosted';
        opp.CloseDate = system.today();
        opp.AccountId = accid;
        opp.Amount = 1200;
        opp.scaleMatters__Business_Unit__c = 'Unassigned';
        
        

        insert opp;

        
        Opportunity oppUpdate2 = new Opportunity(Id= opp.Id);
        oppUpdate2.Name = 'Test';
        oppUpdate2.StageName = 'Stage 1';
        
        update oppUpdate2;
        oppListNew.add(oppUpdate2.Id);  
             
        
        Opportunity oppUpdate4 = new Opportunity(Id= opp.Id);
        oppUpdate4.Name = 'Test';
        oppUpdate4.StageName = 'Closed Ghosted';
        
        update oppUpdate4;
        oppListNew.add(oppUpdate4.Id);
         
        Opportunity oppUpdate5 = new Opportunity(Id= opp.Id);
        oppUpdate5.Name = 'Test';
        oppUpdate5.StageName = 'Stage 2';
        
        //update oppUpdate5;
        oppListNew.add(oppUpdate5.Id);
         
         
         
       
        
        
        
    }  
    
    @isTest static void TestOpportunity16(){
        
        id accid = createAccount();
        
        List<ID> oppListNew = new List<ID>();        
        

        //testing if stages are 1 and 2
        
        Opportunity opp = new Opportunity();
        opp.Name = 'Test Opportunity';
        opp.StageName = 'Closed Ghosted';
        opp.CloseDate = system.today();
        opp.AccountId = accid;
        opp.Amount = 1200;
        opp.scaleMatters__Business_Unit__c = 'Unassigned';
        
        

        insert opp;

        
        Opportunity oppUpdate2 = new Opportunity(Id= opp.Id);
        oppUpdate2.Name = 'Test';
        oppUpdate2.StageName = 'Stage 3';
        
        update oppUpdate2;
        oppListNew.add(oppUpdate2.Id);  
             
        
        Opportunity oppUpdate4 = new Opportunity(Id= opp.Id);
        oppUpdate4.Name = 'Test';
        oppUpdate4.StageName = 'Closed Ghosted';
        
        update oppUpdate4;
        oppListNew.add(oppUpdate4.Id);
         
        Opportunity oppUpdate5 = new Opportunity(Id= opp.Id);
        oppUpdate5.Name = 'Test';
        oppUpdate5.StageName = 'Stage 4';
        
        //update oppUpdate5;
        oppListNew.add(oppUpdate5.Id);
         
         
         
       
        
        
        
    }   
    
    @isTest static void TestLead(){
        
        Lead lead = new Lead();
        lead.Status = 'Open Not Contacted';
        lead.LastName = 'Test Lead';
        lead.Company = 'Test Company';
        insert lead;
        
        Lead leadUpdate = new Lead(id=lead.Id);
        leadUpdate.LastName = 'Test Lead Updated';
        leadUpdate.scaleMatters__Lead_Discard__c = true;
        update leadUpdate;
        
        Task tsk = new Task();
        tsk.WhoId = leadUpdate.Id;
        tsk.Subject = 'Call';
        tsk.Status = 'Completed';
        tsk.ActivityDate = Date.newInstance(2023, 01, 22);
        tsk.ownerid = UserInfo.getUserId();
        insert tsk;
        
        
        
        
        List<ID> ids = new List<ID>();
        ids.add(leadUpdate.Id);
        
        scaleMattersLeadUpdate.updateLead(ids);
        
        //delete lead;
                
        scaleMatters__Deleted_Record__c delObj = new scaleMatters__Deleted_Record__c();
        delObj.scaleMatters__Bulk_Delete__c = false;
        delObj.scaleMatters__Deleted_Business_Unit__c = 'Test Business Unit';
        delObj.scaleMatters__Deleted_Date_Time__c = system.today();
        delObj.scaleMatters__Deleted_Object__c = 'Test Object';
        delObj.scaleMatters__Deleted_SafeID__c = lead.Id;
        insert delObj;
        
        scaleMatters__Discarded_Record__c discObj = new scaleMatters__Discarded_Record__c();
        discObj.scaleMatters__Discarded_Business_Unit__c = lead.scaleMatters__Business_Unit__c;
        discObj.scaleMatters__Discarded_Date_Time__c = system.Now();
        discObj.scaleMatters__Discarded_Object__c = 'Lead'; 
        discObj.scaleMatters__Discarded_SafeID__c = leadUpdate.Id;
        
        insert discObj;
        
        
        
        
    }
    
    @isTest static void TestEvent(){
        
        Account acc = new Account();
        acc.Name = 'Test Account';
        insert acc;
        
        Contact con = new Contact();
        con.LastName = 'Test contact';
        con.AccountId = acc.id;
        insert con;
        
        Event event = New Event();
        event.WhoId = con.Id;
        event.WhatId = acc.id;
        event.Subject = 'Call';
        event.DurationInMinutes = 12;
        event.ActivityDateTime = system.today();
        insert event;
        
        Event eventUpdate =  New Event(Id = event.id);
        eventUpdate.scaleMatters__Task_Discard__c = true;
        update eventUpdate;
        
        
      
        delete event;
         
        scaleMatters__Deleted_Record__c delObj = new scaleMatters__Deleted_Record__c();
        delObj.scaleMatters__Bulk_Delete__c = false;
        delObj.scaleMatters__Deleted_Business_Unit__c = 'None';
        delObj.scaleMatters__Deleted_Date_Time__c = system.today();
        delObj.scaleMatters__Deleted_Object__c = 'Event';
        delObj.scaleMatters__Deleted_SafeID__c = event.Id;
        
        insert delObj;
        
        
        scaleMatters__Discarded_Record__c discObj = new scaleMatters__Discarded_Record__c();
        discObj.scaleMatters__Discarded_Business_Unit__c = 'None';
        discObj.scaleMatters__Discarded_Date_Time__c = system.today();
        discObj.scaleMatters__Discarded_Object__c = 'Event'; 
        discObj.scaleMatters__Discarded_SafeID__c = eventUpdate.Id;
        
		
        insert discObj;

            
        
            
        
        
        
    }
}
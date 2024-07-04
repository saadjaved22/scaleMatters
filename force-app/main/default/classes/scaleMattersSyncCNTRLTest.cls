@isTest(SeeAllData=true)
public class scaleMattersSyncCNTRLTest {
  @isTest
  static void stageTest() {
    String smMapping1 = 'Amount';
    String smMapping2 = 'Amount';
    String smMapping3 = 'Amount';
    String smMapping4 = 'Amount';
    String smMapping5 = 'Amount';
    String smMapping6 = 'Amount';
    String smMapping7 = 'Amount';
    String smMapping8 = 'Amount';
    String smMapping9 = 'Amount';

    scaleMatterSyncCntrl smc = new scaleMatterSyncCntrl();
    smc.createSyncMapping();
    smc.updateSyncMapping();
    smc.fields = 'test';
    smc.getfields();
    List<String> vals = new List<String>();
    vals = scaleMatterSyncCntrl.getFieldsList();

    smc.oprtrs = 'test';
    smc.getoprtrs();

    List<SelectOption> vals2 = new List<SelectOption>();
    vals2 = smc.getoprtrs();

    String conditions = '';
    smc.setcondition(conditions);
    smc.getcondition();

    smc.condition = 'ss';

    smC.setsmMapping1(smMapping1);
    smC.setsmMapping2(smMapping2);
    smC.setsmMapping3(smMapping3);
    smC.setsmMapping4(smMapping4);
    smC.setsmMapping5(smMapping5);
    smC.setsmMapping6(smMapping6);
    smC.setsmMapping7(smMapping7);
    smC.setsmMapping8(smMapping8);
    smC.setsmMapping9(smMapping9);

    smc.getsmMapping1();
    smc.getsmMapping2();
    smc.getsmMapping3();
    smc.getsmMapping4();
    smc.getsmMapping5();
    smc.getsmMapping6();
    smc.getsmMapping7();
    smc.getsmMapping8();
    smc.getsmMapping9();

    smc.getsmMapping1Operator();
    String smMapping1Operator = 'Test';
    smc.getsmMapping1Operator();
    smc.setsmMapping1Operator(smMapping1Operator);
    smc.getsmMapping1Value();
    String smMapping1Value = 'Test';
    smc.setsmMapping1Value(smMapping1Value);
    smc.field1Mapping();

    smc.getsmMapping2Operator();
    String smMapping2Operator = 'Test';
    smc.getsmMapping2Operator();
    smc.setsmMapping2Operator(smMapping2Operator);
    smc.getsmMapping2Value();
    String smMapping2Value = 'Test';
    smc.setsmMapping2Value(smMapping2Value);
    smc.field2Mapping();

    smc.getsmMapping3Operator();
    String smMapping3Operator = 'Test';
    smc.getsmMapping3Operator();
    smc.setsmMapping3Operator(smMapping2Operator);
    smc.getsmMapping3Value();
    String smMapping3Value = 'Test';
    smc.setsmMapping3Value(smMapping3Value);
    smc.field3Mapping();

    smc.getsmMapping4Operator();
    String smMapping4Operator = 'Test';
    smc.getsmMapping4Operator();
    smc.setsmMapping4Operator(smMapping4Operator);
    smc.getsmMapping4Value();
    String smMapping4Value = 'Test';
    smc.setsmMapping4Value(smMapping4Value);
    smc.field4Mapping();

    smc.getsmMapping5Operator();
    String smMapping5Operator = 'Test';
    smc.getsmMapping5Operator();
    smc.setsmMapping5Operator(smMapping5Operator);
    smc.getsmMapping5Value();
    String smMapping5Value = 'Test';
    smc.setsmMapping5Value(smMapping5Value);
    smc.field5Mapping();

    smc.getsmMapping6Operator();
    String smMapping6Operator = 'Test';
    smc.getsmMapping6Operator();
    smc.setsmMapping6Operator(smMapping6Operator);
    smc.getsmMapping6Value();
    String smMapping6Value = 'Test';
    smc.setsmMapping6Value(smMapping6Value);
    smc.field6Mapping();

    smc.getsmMapping7Operator();
    String smMapping7Operator = 'Test';
    smc.getsmMapping7Operator();
    smc.setsmMapping7Operator(smMapping7Operator);
    smc.getsmMapping7Value();
    String smMapping7Value = 'Test';
    smc.setsmMapping7Value(smMapping7Value);
    smc.field7Mapping();

    smc.getsmMapping8Operator();
    String smMapping8Operator = 'Test';
    smc.getsmMapping8Operator();
    smc.setsmMapping8Operator(smMapping8Operator);
    smc.getsmMapping8Value();
    String smMapping8Value = 'Test';
    smc.setsmMapping8Value(smMapping8Value);
    smc.field8Mapping();

    smc.getsmMapping9Operator();
    String smMapping9Operator = 'Test';
    smc.getsmMapping9Operator();
    smc.setsmMapping9Operator(smMapping9Operator);
    smc.getsmMapping9Value();
    String smMapping9Value = 'Test';
    smc.setsmMapping9Value(smMapping9Value);
    smc.field9Mapping();
  }
}

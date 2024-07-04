@isTest(SeeAllData=true)
public class scaleMattersStageMappingTest {
  @isTest
  static void stageTest() {
    List<String> vals = new List<String>();

    scaleMattersStageMappingCNTRL smC = new scaleMattersStageMappingCNTRL();
    vals = scaleMattersStageMappingCNTRL.getStageValues();
    smC.stage1Mapping();
    smC.stage2Mapping();
    smC.stage3Mapping();
    smC.stage4Mapping();
    smC.stage5Mapping();
    smC.stage6Mapping();
    smC.stage7Mapping();
    smC.stage8Mapping();
    smC.stageclMapping();
    smC.stagecwMapping();
    smC.stageicMapping();
    smC.stageigMapping();

    String smMapping1 = 'Amount';
    String smMapping2 = 'Amount';
    String smMapping3 = 'Amount';
    String smMapping4 = 'Amount';
    String smMapping5 = 'Amount';
    String smMapping6 = 'Amount';
    String smMapping7 = 'Amount';
    String smMapping8 = 'Amount';
    String smMappingcl = 'Amount';
    String smMappingcw = 'Amount';
    String smMappingic = 'Amount';
    String smMappingig = 'Amount';

    Integer LSBL1 = 1;
    Integer LSBL2 = 1;
    Integer LSBL3 = 1;
    Integer LSBL4 = 1;
    Integer LSBL5 = 1;
    Integer LSBL6 = 1;
    Integer LSBL7 = 1;
    Integer LSBL8 = 1;
    Integer LSBLCL = 1;
    Integer LSBLCW = 1;
    Integer LSBLIC = 1;
    Integer LSBLIG = 1;

    List<SelectOption> items = new List<SelectOption>();

    items = smC.getItems();

    smC.setsmMapping1(smMapping1);
    smC.setsmMapping2(smMapping2);
    smC.setsmMapping3(smMapping3);
    smC.setsmMapping4(smMapping4);
    smC.setsmMapping5(smMapping5);
    smC.setsmMapping6(smMapping6);
    smC.setsmMapping7(smMapping7);
    smC.setsmMapping8(smMapping8);
    smC.setLSBL1(LSBL1);
    smC.setLSBL2(LSBL2);
    smC.setLSBL3(LSBL3);
    smC.setLSBL4(LSBL4);
    smC.setLSBL5(LSBL5);
    smC.setLSBL6(LSBL6);
    smC.setLSBL7(LSBL7);
    smC.setLSBL8(LSBL8);
    smC.setLSBLCL(LSBLCL);
    smC.setLSBLCW(LSBLCW);
    smC.setLSBLIC(LSBLIC);
    smC.setLSBLIC(LSBLIC);

    smC.getsmMapping1();
    smC.getsmMapping2();
    smC.getsmMapping3();
    smC.getsmMapping4();
    smC.getsmMapping5();
    smC.getsmMapping6();
    smC.getsmMapping7();
    smC.getsmMapping8();
    smC.getLSBL1();
    smC.getLSBL2();
    smC.getLSBL3();
    smC.getLSBL4();
    smC.getLSBL5();
    smC.getLSBL6();
    smC.getLSBL7();
    smC.getLSBL8();
    smC.getLSBLCL();
    smC.getLSBLCW();
    smC.getLSBLIC();
    smC.getLSBLIC();
  }
}

@isTest(SeeAllData=true)
public class scaleMattersDateConfigCNTRLTest {
  @isTest
  static void TestDateMapping() {
    Date hrd = Date.newInstance(1990, 11, 1);
    Date dld = Date.newInstance(1990, 11, 1);

    scaleMattersDateConfigCntrl.createDateConfig();
    scaleMattersDateConfigCntrl dateObj = new scaleMattersDateConfigCntrl();
    dateObj.updateDateConfig();
    scaleMattersDateConfigCntrl.createPermissionRecord();
  }
}

public class scaleMattersLeadFunnelCntrl {
  public String nameLead;
  public String getnameLead() {
    return nameLead;
  }
  public void setnameLead(String nameLead) {
    this.nameLead = nameLead;
  }
  public String funnelGroup { set; }
  public List<SelectOption> getfunnelGroup() {
    List<SelectOption> selectoptions = new List<SelectOption>();
    List<String> fList = new List<String>();

    fList.add('Ads - Facebook');
    fList.add('Ads - Instagram');
    fList.add('Ads - LinkedIn');
    fList.add('Ads - Other');
    fList.add('Ads - Search');
    fList.add('Ads - Twitter');
    fList.add('Events');
    fList.add('Events - BIGRYG Webinar');
    fList.add('Events - Impact Webinar');
    fList.add('Events - Other');
    fList.add('Events - RYG');
    fList.add('Events - TL Webinar');
    fList.add('Events - VRYG');
    fList.add('Inbound Other');
    fList.add('Inbound Unpaid');
    fList.add('Listings - Business Software');
    fList.add('Listings - BuyerZone');
    fList.add('Listings - Capterra');
    fList.add('Listings - G2 Crowd');
    fList.add('Listings - MVF');
    fList.add('Listings - Natural Intelligence');
    fList.add('Listings - Other');
    fList.add('Listings - Software Advice');
    fList.add('Listings - Trafficpoint');
    fList.add('Listings - TrustRadius');
    fList.add('Organic');
    fList.add('Other');
    fList.add('Prospecting - 3rd Party');
    fList.add('Prospecting - AE');
    fList.add('Prospecting - SDR');
    fList.add('Prospecting - Social');
    fList.add('Referrals - Customer');
    fList.add('Referrals - Employee');
    fList.add('Syndication - TechTarget');
    fList.add('Referrals - Other');
    fList.add('Referrals - Partner');
    fList.add('Syndication - Integrate');
    fList.add('Syndication - Other');
    fList.add('Undefined');
    fList.add('Filter Condition');
    fList.add('Upsell');

    for (String operator : fList) {
      selectoptions.add(new SelectOption(operator, operator));
    }

    return selectoptions;
  }

  public String objectName;
  public String getobjectName() {
    return objectName;
  }
  public void setobjectName(String objectName) {
    this.objectName = objectName;
  }
  public String funnelObject { set; }
  public List<SelectOption> getfunnelObject() {
    List<SelectOption> selectoptions = new List<SelectOption>();
    List<String> fList = new List<String>();

    fList.add('Lead');
    fList.add('Contact');
    fList.add('Opportunity');

    for (String operator : fList) {
      selectoptions.add(new SelectOption(operator, operator));
    }

    return selectoptions;
  }

  public String soqlConditionLead { get; set; }
  public Decimal funnelOrderLead { get; set; }

  public void createMappingLead() {
    scaleMatters__Funnel_Configuration_Mapping__c funnelObj = new scaleMatters__Funnel_Configuration_Mapping__c();

    funnelObj.scaleMatters__SOQL_Condition__c = soqlConditionLead;
    funnelObj.Name = nameLead;
    funnelObj.scaleMatters__Object__c = objectName;
    funnelObj.scaleMatters__SOQL_Order__c = funnelOrderLead;

    try {
      insert funnelObj;
    } catch (Exception ex) {
      system.debug('Exception : ' + ex);
    }
  }
}

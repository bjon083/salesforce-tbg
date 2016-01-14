trigger CaseTrigger on Case (after insert, after update) {
    Map<Id, String> caseIdMap = new Map<Id, String>();
    
    for (Case newCase : Trigger.new) {
        if (Trigger.isInsert || (Trigger.isUpdate && (Trigger.oldMap.get(newCase.Id).Unique_Case_Account_ID__c != newCase.Unique_Case_Account_ID__c))) {
            caseIdMap.put(newCase.id, newCase.Unique_Case_Account_ID__c);
        }
    }
    
    if (caseIdMap.size() > 0) {
        ExternalSharingHelper.linkCase(caseIdMap);
    }
}
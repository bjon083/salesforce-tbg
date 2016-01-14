trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
    List<Task> taskList = new List<Task>();
    
    for (Opportunity o : [SELECT Id,StageName FROM Opportunity
                         WHERE Id IN :Trigger.New]) {
                             if (o.StageName == 'Closed Won') {
                                 Task t = new Task(Subject='Follow Up Test Task',
                                                  WhatId=o.Id);
                                 taskList.add(t);
                             }
                          }
    
    if (taskList.size() > 0) {
        insert taskList;
    }
    
}
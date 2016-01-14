trigger ExampleTrigger on Contact (after insert, after delete) {
    if (Trigger.isInsert) {
        Integer recordCount = Trigger.New.size();
        /* EmailManager.sendMail('b.d.m.jones@gmail.com', 'Trailhead Trigger Tutorial',
                             recordCount + ' contact(s) were inserted.'); */
    } else if (Trigger.isDelete) {
        // Process after delete
    }
}
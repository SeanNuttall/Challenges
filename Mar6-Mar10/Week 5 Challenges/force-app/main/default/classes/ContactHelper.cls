public class ContactHelper {
    public static void addAnEmail(List<Contact> toAddEmailTo){
        for (Integer i = 0; i<toAddEmailTo.size(); i++){
           if(hasNoEmail(toAddEmailTo[i])){
            	toAddEmailTo[i].Email = toAddEmailTo[i].LastName + '@sftesting.org';
        }
        }
        
    }
    
    private static boolean hasNoEmail(Contact con){
        boolean hasNoEmail = con.Email == NULL;
        return hasNoEmail;
    }
    
    public static void ChangeAccountPhone(List<Contact> newContactList, List<Contact> oldContactList){
        List<Account> accountsToUpdate = new List<Account>();
        for(Integer i = 0; i < newContactList.size(); i++){
            Contact newContact = newContactList[i];
            Contact oldContact = oldContactList[i];
            if (hasNewPhone(newContact, oldContact) && relatedAccount(newContact)){
                Account acc = [SELECT Name FROM Account WHERE Id = :newContact.AccountId];
                acc.Phone = newContact.Phone;
                accountsToUpdate.add(acc);
            }
        }
        update accountsToUpdate;
    }
    
    private static boolean hasNewPhone(Contact newContact, Contact oldContact){
        Boolean newPhoneNumber = newContact.Phone != oldContact.Phone;
        return newPhoneNumber;
    }
    private static boolean relatedAccount(Contact con){
        Boolean accountRelated = con.AccountId != NULL;
        return accountRelated;
    }
}
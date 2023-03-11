public class AccountHelper {
    public static void dontDeleteWithContacts(List<Account> accList){
        for(Account acc : accList){
            if(hasContacts(acc)){
                acc.addError(
                'Don\'t delete accounts with contacts.'
                );
            }
        }
    }
    
    public static boolean hasContacts(Account acc){
        Boolean hasContact;
        Integer contactsFromAccount = [SELECT COUNT() FROM Contact WHERE Account.Name = :acc.Name]; 
        hasContact = contactsFromAccount != 0;
        return hasContact;
    }
    
    public static void createRelatedContact(List<Account> accList){
        List<Contact> contactsToInsert = new List<Contact>();
        for (Account acc : accList){
            Contact relatedContact = new Contact(
            	FirstName = 'Contact for',
                LastName = acc.Name,
                AccountId = acc.Id
            	);
            contactsToInsert.add(relatedContact);
        }
        insert contactsToInsert;
    }
}
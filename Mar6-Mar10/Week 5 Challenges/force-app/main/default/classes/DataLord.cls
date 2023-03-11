public class DataLord {
    
    public Integer NumAccounts(){
        return [SELECT COUNT() FROM Account];
    }
	
    public Integer NumHot(){
        return [SELECT COUNT() FROM Account WHERE Rating = 'Hot'];
    }
    
    public Integer NumComplex(){
        return [SELECT COUNT() FROM Account WHERE Name LIKE '%&%'];
    }
    
    public List<Account> BigFive (){
        return [SELECT Name, AnnualRevenue FROM Account ORDER BY AnnualRevenue LIMIT 5];
    }
    
    public Opportunity LastBigOpportunity(){
        return [SELECT Name FROM Opportunity WHERE Amount > 100000 ORDER BY CloseDate DESC LIMIT 1];
    }
    
    public List<sObject> MostPopularAccount(){
       	List<sObject> acc = [SELECT Account.Name FROM Contact GROUP BY Account.Name ORDER BY COUNT(Name) DESC LIMIT 1];
        return acc;
    }
}
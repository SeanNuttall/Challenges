public class Calculator {
    
    public Integer Add(Integer a, Integer b){
        return a+b;
    }
	
    public Integer Multiply(Integer a, Integer b){
        Integer counter = 0;
        Integer product = 0;
        
        if(b < 0){
            b = 0 - b;
            a = 0 - a;
        }
        
        while(counter < b){
            product = Add(product, a);
            counter++;
        }
        
        return product;
    }
    
    public Integer Divide(Integer a, Integer b){
        Integer UseA = a;
        Integer UseB = b;
        Integer quotient = 0;
        Integer BPos = b;
		if(b>0){
            UseB = 0 - b;
        }
        else{
            BPos = 0 - b;
        }
        if(a<0){
            UseA = 0 - a;
        }
        
        while(UseA >= BPos){
            UseA = Add(UseA, UseB);
            quotient++;
        }
        
        if((a<0 && b>0) || (a>0 && b<0)){
            quotient = 0 - quotient;
        }
        return quotient;
    }
    public Integer Mod (Integer a, Integer b){
        Integer quotient = Divide(a, b);
        Integer negProduct = 0 - Multiply(quotient, b);
        Integer remainder = Add(negProduct, a);
        if(b<0){
            remainder = 0 - remainder;
        }
        else if (b == 0){
            remainder = NULL;
        }
        return remainder;
    }
}
public abstract class Vehicle {
    public enum Medium { 
        LAND, 
        AIR, 
        WATER 
    }
    public Integer Speed { get; private set{
        if (Speed < 0){
            Speed = 0;
        }
        } }
    public String Name { get; private set; }
    public Integer Occupants { get; private set{
        if (Occupants < 0){
            Occupants = 0;
        }
        } }
    public final Integer Capacity { get; private set{
        if (Capacity < 1){
            Capacity = 1;
        }
    } }
    protected final List<Medium> Media;
    
    public Vehicle(){
        this(0);
    }
    public Vehicle(Integer Speed){
        this(Speed, 0);
    }
    public Vehicle(Integer Speed, Integer Occupants){
        this(Speed, Occupants, 'Vehicle');
    }
    public Vehicle(Integer Speed, Integer Occupants, String Name){
        this(Speed, Occupants, Name, 4);
    }
    public Vehicle(Integer Speed, Integer Occupants, String Name, Integer Capacity){
        this.Speed = Speed;
        this.Occupants = Occupants;
        this.Name = Name;
        this.Capacity = Capacity;
    }
    
    public virtual void Accelerate(Integer faster){
        Speed += faster;
    }
    
    public abstract void Turn(Integer degree);
    
    public override String ToString(){
        String stats = 'This ' + Name + ' is moving at ' + Speed + ' KPH, has ' + Occupants + ' people riding, and can move on ' + Media;
        return stats;
    }
}
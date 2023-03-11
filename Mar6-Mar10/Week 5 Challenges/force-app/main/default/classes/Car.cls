public class Car Extends Vehicle{
    
    public Car(){
        this(0);
    }
    public Car(Integer Speed){
        this(Speed, 0);
    }
    public Car(Integer Speed, Integer Occupants){
        this(Speed, Occupants, 'Car');
    }
    public Car(Integer Speed, Integer Occupants, String Name){
        this(Speed, Occupants, Name, 4);
    }
    public Car(Integer Speed, Integer Occupants, String Name, Integer Capacity){
        super(Speed, Occupants, Name, Capacity);
        this.TireRotation = 0;
        this.SteeringRotation = 0;
        this.Media.add(Medium.LAND);
    }
    private Integer SteeringRotation { get;  set {
        if (SteeringRotation > 1440){
            SteeringRotation = 1440;
        }
        if (SteeringRotation < -1440){
            SteeringRotation = -1440;
        }
    }}
    
    public double TireRotation {
        get;
        private set{
            if (TireRotation < -90){
                TireRotation = -90;
            }
            if (TireRotation > 90){
                TireRotation = 90;
            }
        }
    }
    public integer Gear { get; private set; }
    public override void Turn(Integer degree){
        SteeringRotation = degree;
        TireRotation = degree / 16;
    }
    
    public override void Accelerate(Integer faster){
        super.Accelerate(faster);
        Gear = (Integer)Math.ceil(0.4444 * (Math.sqrt(Speed)));
    }
}
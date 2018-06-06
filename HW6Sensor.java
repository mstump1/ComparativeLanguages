/**
 * The sensor thread.
 * Periodically inserts data into the bounded buffer (HW6Fusion object).
 *
 * @author Margaret Stump
 * @version 1
 */
public class HW6Sensor extends Thread{
    private HW6Fusion fusion;
    private String data = "";
    private int time = -1;

    /**
     * Creates an instance of the <code>HelloSensor</code> class.
     *
     * @param f The bounded buffer.
     * @param t The time period between two inserts.
     * @param d The data periodically inserted by the thread.
     */
    public HW6Sensor(HW6Fusion f, int t, String d){
        fusion = f;
        time = t;
        data = d;
    }

    /**
     * The thread method.
     */
    public void run() {
        try {
            while (true) {
                //added this, modeled afte rthe storage thread class
                //fusion has an insert dtaa function, this is
                //where the sensor thread inserts into the buffer, (fusion)
                Thread.sleep(time);
                fusion.insert(data);
            }
        }
        catch (InterruptedException e){
            System.out.println("Storage interrupted!");
        }
    }

}

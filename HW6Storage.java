/**
 * The storage thread.
 * Periodically reads and removes data from the bounded buffer (HW6Fusion object).
 *
 * @author Margaret Stump
 * @version 1
 */
public class HW6Storage extends Thread {
    private int time = -1;

    //values are floats to allow for decimal places.
    private float number_of_full_slots = 0;
    private String sensor_data = "";
    private int full = 0;
    private float count = 0;
    private float sum = 0;
    private float average;

    private HW6Fusion fusion;

    /**
     * Creates an instance of the <code>HelloStorage</code> class.
     *
     * @param f The bounded buffer.
     * @param t The time period between two removals.
     */
    public HW6Storage(HW6Fusion f, int t)
    {
        fusion = f;
        time = t;

    }

    /**
     * The thread method.
     */
    public void run() {
        try {
            while (true) {
                //calculations are done before removal
                //used for calculations, is a float for precision
                number_of_full_slots = fusion.getReadingCount();

                //current buffer full slots, integer version
                full = fusion.getReadingCount();

                //count keeps track of how many times the loop iterates
                count++;

                //sim is always added to, used to calculate average
                sum += number_of_full_slots;

                //average is stored
                average = sum/count;

                //sensor data is removed from the buffer
                sensor_data = (String) fusion.remove();

                Thread.sleep(time);

                //number_of_full_slots/average_number_of_full_slots: sensor_data
                System.out.print(Integer.toString(full) + "/"  );
                System.out.print(average);
                System.out.print(": " + sensor_data + "\n");

            }
        }
        catch (InterruptedException e){
            System.out.println("Storage interrupted!");
        }
    }
}

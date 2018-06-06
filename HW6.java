/**
 * Homework 6 Java programming problem
 * runs the program, initializes the sotrage thread and the sensor threads
 * creates the buffer
 *
 * @author Margaret Stump
 * @version 1
 */
public class HW6 {

    /**
     * Creates a new instance of the Hello object.
     *
     * @param fusionSize The size of the buffer.
     * @param sensorCount The number of sensor threads.
     * @param sensorTime The time between inserting two sensor readings (HW6sensor thread).
     * @param storageTime The time between removing two sensor readings (HW6storage thread)..
     */
    public HW6(int fusionSize, int sensorCount, int sensorTime, int storageTime) {
        HW6Storage storage;
        HW6Fusion fusion;
        //holds the sensor objects
        HW6Sensor[] list = new HW6Sensor[sensorCount];

        fusion = new HW6Fusion(fusionSize);
        storage = new HW6Storage(fusion, storageTime);
        storage.start();

        //create sensor objects based on the number of sensors and sensor time
        for (int i = 0; i < sensorCount; i++)
        {
            list[i] = new HW6Sensor(fusion, sensorTime, "Sensor " + Integer.toString(i));
            list[i].start();
        }

    }

    /**
     * Starts the Hw6 program.
     *
     * @param args The command line arguments.
     */
    public static void main(String[] args)
    {
        //creates the threads and buffer according to parameters
        HW6 hw6 = new HW6(10, 5, 1000, 100);

    }
}

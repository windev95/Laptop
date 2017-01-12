package model;
public class Cpu {
    private long cpuID;
    private String cpuName;

    public Cpu() {
    }
    public Cpu(String cpuName) {
        this.cpuName = cpuName;
    }

    public Cpu(long cpuID, String cpuName) {
        this.cpuID = cpuID;
        this.cpuName = cpuName;
    }

    public long getCpuID() {
        return cpuID;
    }

    public void setCpuID(long cpuID) {
        this.cpuID = cpuID;
    }

    public String getCpuName() {
        return cpuName;
    }

    public void setCpuName(String cpuName) {
        this.cpuName = cpuName;
    }
    
}

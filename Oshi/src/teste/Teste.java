package teste;

import oshi.SystemInfo;
import oshi.hardware.HardwareAbstractionLayer;
import oshi.hardware.Processor;
import oshi.software.os.OperatingSystem;
import oshi.util.FormatUtil;

public class Teste {

	public static void main(String[] args) {
		
		SystemInfo si = new SystemInfo();
		OperatingSystem os = si.getOperatingSystem();
		System.out.println(os);
		
		HardwareAbstractionLayer hal = si.getHardware();
		System.out.println(hal.getProcessors().length + " CPU(s):");
		for(Processor cpu : hal.getProcessors()) {
		    System.out.println("\t" + cpu);
		}
		
		System.out.println("Memory: " +
		        FormatUtil.formatBytes(hal.getMemory().getAvailable()) + "/" +
		        FormatUtil.formatBytes(hal.getMemory().getTotal()));
		
		EngenhariaReversaProcessadores bla2 = new EngenhariaReversaProcessadores();
		bla2.getProcessors();
		
		
	}
}

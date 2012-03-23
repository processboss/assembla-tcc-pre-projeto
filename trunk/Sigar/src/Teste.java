import org.hyperic.sigar.Cpu;
import org.hyperic.sigar.Mem;
import org.hyperic.sigar.Sigar;
import org.hyperic.sigar.SigarException;
import org.hyperic.sigar.CpuInfo;

import util.FormatUtil;


public class Teste {

	
	//exec java -Dpid=$$ -Draieie -jar /home//mollivier/Java/jboss-6.0.0.Final/bin/run.jar
	//ps aux -e
	//ps aux -e | grep java
	public static void main(String[] args) throws SigarException {
		
		Sigar sigar = new Sigar();
		
		Mem mem = sigar.getMem();
		long memoriaTotal = mem.getTotal();
		long memoriaLivre = mem.getFree();
		long memoriaUsed = mem.getUsed();
		
		System.out.println("Memória Total: " + FormatUtil.formatBytes(memoriaTotal));
		System.out.println("Memória Livre: " + FormatUtil.formatBytes(memoriaLivre));
		System.out.println("Memória usada: " + FormatUtil.formatBytes(memoriaUsed));
		
		//----
		
//		ProcCpu proc = sigar.getProcCpu("9904");
//		long startTime = proc.getStartTime();
//		long lastTime = proc.getLastTime();
//		double percent = proc.getPercent();
//		
//		System.out.println("inicio " + startTime);
//		System.out.println("fim " + lastTime);
//		System.out.println("porcentagem " + percent);
		
		//----
		
		Cpu cpu = sigar.getCpu();
		long total = cpu.getTotal();
		long usado = cpu.getUser();
		
		System.out.println(total);
		System.out.println(usado);
		
		
		CpuInfo[] cpuInfoList = sigar.getCpuInfoList();
		for (CpuInfo cpuInfo : cpuInfoList) {

			System.out.println("Modelo: " + cpuInfo.getModel());
			System.out.println("\tMhz: " + cpuInfo.getMhz());
			System.out.println("\tTotal de cores: " + cpuInfo.getTotalCores());
			System.out.println("\tTotal sockets: " + cpuInfo.getTotalSockets());
			System.out.println("\tMarca: " + cpuInfo.getVendor());
			System.out.println("\tTamanho Cache: " + cpuInfo.getCacheSize());
			System.out.println("\tCores por socket: " + cpuInfo.getCoresPerSocket());
			
			
		}
		
	}
	
	
}

package marco;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class Main {
	/**
	 * http://javafree.uol.com.br/topic-864706-Listar-os-Processos-do-Windows-com-Java.html
	 * http://regulus.pcs.usp.br/~jean/so/AULA%2009%20-%20Sincroniza%E7%E3o%20de%20Processos%20II.pdf
	 * http://pt.w3support.net/index.php?db=so&id=54686
	 * http://pt.w3support.net/index.php?db=so&id=1255963
	 * http://javafree.uol.com.br/topic-859148-Como-saber-se-um-processo-esta-rodando.html
	 * http://www.colber.com.br/?p=213
	 * http://docs.oracle.com/javase/6/docs/jdk/api/attach/spec/index.html
	 * 
	 * @param args
	 */
	public static void main(String[] args) {

		try {
			Process p = Runtime.getRuntime().exec("tasklist");
			InputStream input = p.getInputStream();
			BufferedInputStream reader = new BufferedInputStream(input);
			Scanner sc = new Scanner(input);

			sistema();
			informacoesProcessadorMemoria();
			
			try {
				loop();
			} catch (Exception e) {
				// TODO: handle exception
			}
			System.out.println("Teste");
		} catch (IOException e) {
			e.printStackTrace();
		}

		sistema();

	}

	private static void sistema() {
		Runtime runTime = Runtime.getRuntime();

		System.out.print("Memoria livre: ");
		System.out.println(runTime.freeMemory());
		System.out.print("Memoria total: ");
		System.out.println(runTime.totalMemory());
		System.out.print("Processadores: ");
		System.out.println(runTime.availableProcessors());
	}

	private static void loop() throws Exception{
		int i = 0;
		while(true){
			Thread.sleep(10000);
			System.out.println(++i);
		}
	}
	
	// http://pt.w3support.net/index.php?db=so&id=755899
	private static void informacoesProcessadorMemoria() {
//		long upTime = runtimeProxy.getUptime();
//		List<Long> threadCpuTime = new ArrayList<Long>();
//		for (int i = 0; i < threadIds.size(); i++) {
//			long threadId = threadIds.get(i);
//			if (threadId != -1) {
//				threadCpuTime.add(threadProxy.getThreadCpuTime(threadId));
//			} else {
//				threadCpuTime.add(0L);
//			}
//		}
//		
//	
//		int nCPUs = osProxy.getAvailableProcessors();
//		List<Float> cpuUsageList = new ArrayList<Float>();
//		if (prevUpTime > 0L && upTime > prevUpTime) {
//			// elapsedTime is in ms
//			long elapsedTime = upTime - prevUpTime;
//			for (int i = 0; i < threadIds.size(); i++) {
//				// elapsedCpu is in ns
//				long elapsedCpu = threadCpuTime.get(i)
//						- prevThreadCpuTime.get(i);
//				// cpuUsage could go higher than 100% because elapsedTime
//				// and elapsedCpu are not fetched simultaneously. Limit to
//				// 99% to avoid Chart showing a scale from 0% to 200%.
//				float cpuUsage = Math.min(99F, elapsedCpu
//						/ (elapsedTime * 1000000F * nCPUs));
//				cpuUsageList.add(cpuUsage);
//			}
//		}
	}

}

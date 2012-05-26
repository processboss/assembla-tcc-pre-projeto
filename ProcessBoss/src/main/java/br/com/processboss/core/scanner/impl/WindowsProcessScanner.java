package br.com.processboss.core.scanner.impl;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Set;
import java.util.TreeSet;
import java.util.Scanner;

import br.com.processboss.core.model.ActiveProcess;
import br.com.processboss.core.scanner.ProcessScanner;

public class WindowsProcessScanner implements ProcessScanner {

	public void readAllProcess() {
		
		try {
			String ls_str;

			Set<ActiveProcess> activeProcesses = new TreeSet<ActiveProcess>();

			Process ls_proc = Runtime.getRuntime().exec("cmd /C TASKLIST /V /fo csv");
			BufferedReader ls_in = new BufferedReader(new InputStreamReader(ls_proc.getInputStream()));

			while ((ls_str = ls_in.readLine()) != null) {
				ActiveProcess activeProcess = new ActiveProcess();
			    Scanner scanner = new java.util.Scanner(ls_str);
			    scanner.useDelimiter("\"");

			    activeProcess.setProcessName(scanner.next());
			    scanner.next();
			    activeProcess.setPersonalIdentification(scanner.next());
			    scanner.next();
			    activeProcess.setSessionName(scanner.next());
			    scanner.next();
			    activeProcess.setSession(scanner.next());
			    scanner.next();
			    activeProcess.setMemoryUsed(scanner.next());
			    scanner.next();
			    activeProcess.setStatus(scanner.next());
			    scanner.next();
			    activeProcess.setUserName(scanner.next());
			    scanner.next();
			    activeProcess.setCpuTime(scanner.next());
			    scanner.next();
			    activeProcess.setWindowTitle(scanner.next());

			    activeProcesses.add(activeProcess);

			}

			for (ActiveProcess activeProcess : activeProcesses) {
			    System.out.println(activeProcess);
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

}

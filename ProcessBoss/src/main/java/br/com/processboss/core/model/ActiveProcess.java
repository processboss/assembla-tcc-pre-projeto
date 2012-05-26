package br.com.processboss.core.model;

import java.io.Serializable;

public class ActiveProcess implements Serializable{
	
	private static final long serialVersionUID = -2966895157144850028L;

	private String processName;
	private String personalIdentification;
	private String sessionName;
	private String session;
	private String memoryUsed;
	private String status;
	private String userName;
	private String cpuTime;
	private String windowTitle;

	public String getProcessName() {
		return processName;
	}

	public void setProcessName(String processName) {
		this.processName = processName;
	}

	public String getPersonalIdentification() {
		return personalIdentification;
	}

	public void setPersonalIdentification(String personalIdentification) {
		this.personalIdentification = personalIdentification;
	}

	public String getSessionName() {
		return sessionName;
	}

	public void setSessionName(String sessionName) {
		this.sessionName = sessionName;
	}

	public String getSession() {
		return session;
	}

	public void setSession(String session) {
		this.session = session;
	}

	public String getMemoryUsed() {
		return memoryUsed;
	}

	public void setMemoryUsed(String memoryUsed) {
		this.memoryUsed = memoryUsed;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getCpuTime() {
		return cpuTime;
	}

	public void setCpuTime(String cpuTime) {
		this.cpuTime = cpuTime;
	}

	public String getWindowTitle() {
		return windowTitle;
	}

	public void setWindowTitle(String windowTitle) {
		this.windowTitle = windowTitle;
	}

	@Override
	public String toString() {

		return "Processo [" + processName + "] " + "Usuario [" + userName
				+ "] " + "Uso de memoria [" + memoryUsed + "] " + "Status ["
				+ status + "] " + "PID [" + personalIdentification + "] "
				+ "Tempo de CPU [ " + cpuTime + "]";

	}

	@Override
	public boolean equals(Object obj) {

		if (obj instanceof ActiveProcess) {
			ActiveProcess processo = (ActiveProcess) obj;

			if (this.personalIdentification.equalsIgnoreCase(processo.getPersonalIdentification())) {
				return true;
			}
		}

		return false;
	}

	public int compareTo(ActiveProcess o) {
		if (this.equals(o))
			return 0;

		return -1;
	}

}

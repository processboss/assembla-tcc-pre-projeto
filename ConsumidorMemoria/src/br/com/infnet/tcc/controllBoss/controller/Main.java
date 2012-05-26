package br.com.infnet.tcc.controllBoss.controller;

import java.util.ArrayList;
import java.util.List;

public class Main {
	
	private static List<String> strings = new ArrayList<String>();
	public static void main(String[] args) {
		
		while (true) {
			try {
				strings.add(new String());
				//System.out.println("consumindo memória...");
				Thread.sleep(100);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
	}
}	

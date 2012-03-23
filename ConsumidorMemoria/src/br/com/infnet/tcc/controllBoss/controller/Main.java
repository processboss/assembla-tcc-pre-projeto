package br.com.infnet.tcc.controllBoss.controller;

import java.util.ArrayList;
import java.util.List;

public class Main {

	public static List<String> lista = new ArrayList<String>(); 
	
	public static void main(String[] args) {
		while (true) {
			try {
				lista.add(new String());
				System.out.println("consumindo memória..." + lista.size());
				Thread.sleep(100);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
	}
}	

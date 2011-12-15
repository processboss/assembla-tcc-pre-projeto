package erico;

import java.io.Serializable;

public class Processo implements Serializable, Comparable<Processo> {

    private static final long serialVersionUID = 1L;
    private String nomeProcesso;
    private String identificacaoPessoal;
    private String nomeSessao;
    private String sessao;
    private String usoMemoria;
    private String status;
    private String nomeUsuario;
    private String tempoCPU;
    private String tituloJanela;

    public String getNomeProcesso() {
	return nomeProcesso;
    }

    public String getIdentificacaoPessoal() {
	return identificacaoPessoal;
    }

    public String getNomeSessao() {
	return nomeSessao;
    }

    public String getSessao() {
	return sessao;
    }

    public String getUsoMemoria() {
	return usoMemoria;
    }

    public String getStatus() {
	return status;
    }

    public String getNomeUsuario() {
	return nomeUsuario;
    }

    public String getTempoCPU() {
	return tempoCPU;
    }

    public String getTituloJanela() {
	return tituloJanela;
    }

    public void setNomeProcesso(String nomeProcesso) {
	this.nomeProcesso = nomeProcesso;
    }

    public void setIdentificacaoPessoal(String identificacaoPessoal) {
	this.identificacaoPessoal = identificacaoPessoal;
    }

    public void setNomeSessao(String nomeSessao) {
	this.nomeSessao = nomeSessao;
    }

    public void setSessao(String sessao) {
	this.sessao = sessao;
    }

    public void setUsoMemoria(String usoMemoria) {
	this.usoMemoria = usoMemoria;
    }

    public void setStatus(String status) {
	this.status = status;
    }

    public void setNomeUsuario(String nomeUsuario) {
	this.nomeUsuario = nomeUsuario;
    }

    public void setTempoCPU(String tempoCPU) {
	this.tempoCPU = tempoCPU;
    }

    public void setTituloJanela(String tituloJanela) {
	this.tituloJanela = tituloJanela;
    }

    @Override
    public String toString() {

	return "Processo [" + nomeProcesso + "] " + "Usuario [" + nomeUsuario + "] " + "Uso de memoria [" + usoMemoria + "] " + "Status [" + status + "] " + "PID [" + identificacaoPessoal + "] " + "Tempo de CPU [ " + tempoCPU + "]";

    }

    @Override
    public boolean equals(Object obj) {

	if (obj instanceof Processo) {
	    Processo processo = (Processo) obj;

	    if (this.identificacaoPessoal.equalsIgnoreCase(processo.getIdentificacaoPessoal())) {
		return true;
	    }
	}

	return false;
    }

    @Override
    public int compareTo(Processo o) {
	if (this.equals(o))
	    return 0;

	return -1;
    }
}

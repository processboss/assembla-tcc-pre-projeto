package br.com.tcc.estudos.gpb.core.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class Processo implements Serializable, Comparable<Processo> {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;

	@Temporal(value = TemporalType.TIMESTAMP)
	private Date data;

	@Column
	private String nomeProcesso;
	@Column
	private String identificacaoPessoal;
	@Column
	private String nomeSessao;
	@Column
	private String sessao;
	@Column
	private String usoMemoria;
	@Column
	private String status;
	@Column
	private String nomeUsuario;
	@Column
	private String tempoCPU;
	@Column
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

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@Override
	public boolean equals(Object obj) {

		if (obj instanceof Processo) {
			Processo processo = (Processo) obj;

			if (this.identificacaoPessoal.equalsIgnoreCase(processo
					.getIdentificacaoPessoal())) {
				return true;
			}
		}

		return false;
	}

	public int compareTo(Processo o) {
		if (this.equals(o))
			return 0;

		return -1;
	}

	public Date getData() {
		return data;
	}

	public void setData(Date data) {
		this.data = data;
	}
}

package br.com.msystem.vo;
// Generated 12/03/2013 13:33:49 by Hibernate Tools 3.4.0.CR1


import java.math.BigDecimal;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * DuplicatasPgto generated by hbm2java
 */
@Entity
@Table(name="duplicatas_pgto"
    ,catalog="handy"
)
public class DuplicatasPgto  implements java.io.Serializable {


     private int duplicataPgtoSq;
     private Duplicatas duplicatas;
     private Date dtPgto;
     private BigDecimal valorPgto;
     private String formaPgto;
     private String observacao;

    public DuplicatasPgto() {
    }

	
    public DuplicatasPgto(Duplicatas duplicatas, Date dtPgto, BigDecimal valorPgto) {
        this.duplicatas = duplicatas;
        this.dtPgto = dtPgto;
        this.valorPgto = valorPgto;
    }
    public DuplicatasPgto(Duplicatas duplicatas, Date dtPgto, BigDecimal valorPgto, String formaPgto, String observacao) {
       this.duplicatas = duplicatas;
       this.dtPgto = dtPgto;
       this.valorPgto = valorPgto;
       this.formaPgto = formaPgto;
       this.observacao = observacao;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="duplicata_pgto_sq", unique=true, nullable=false)
    public int getDuplicataPgtoSq() {
        return this.duplicataPgtoSq;
    }
    
    public void setDuplicataPgtoSq(int duplicataPgtoSq) {
        this.duplicataPgtoSq = duplicataPgtoSq;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="duplicata_sq", nullable=false)
    public Duplicatas getDuplicatas() {
        return this.duplicatas;
    }
    
    public void setDuplicatas(Duplicatas duplicatas) {
        this.duplicatas = duplicatas;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="dt_pgto", nullable=false, length=19)
    public Date getDtPgto() {
        return this.dtPgto;
    }
    
    public void setDtPgto(Date dtPgto) {
        this.dtPgto = dtPgto;
    }

    
    @Column(name="valor_pgto", nullable=false, precision=9)
    public BigDecimal getValorPgto() {
        return this.valorPgto;
    }
    
    public void setValorPgto(BigDecimal valorPgto) {
        this.valorPgto = valorPgto;
    }

    
    @Column(name="forma_pgto", length=10)
    public String getFormaPgto() {
        return this.formaPgto;
    }
    
    public void setFormaPgto(String formaPgto) {
        this.formaPgto = formaPgto;
    }

    
    @Column(name="observacao", length=100)
    public String getObservacao() {
        return this.observacao;
    }
    
    public void setObservacao(String observacao) {
        this.observacao = observacao;
    }




}


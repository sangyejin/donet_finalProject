package com.pongsung.donet.goods.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class RequiredGoods {
	private int goodsNo;
	private int beneficiaryNo;
	
	
	@Override
	public boolean equals(Object obj) {
		// TODO Auto-generated method stub
	    boolean sameSame = false;

	    if (obj != null && obj instanceof RequiredGoods){
	        sameSame = (this.beneficiaryNo == ((RequiredGoods) obj).getBeneficiaryNo()) && (this.goodsNo == ((RequiredGoods) obj).getGoodsNo()) ;
	    }

	    return sameSame;
	}
	
	
}

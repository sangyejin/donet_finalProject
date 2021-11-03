package com.pongsung.donet.goods.model.vo;

import java.util.List;
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
public class BeneficiaryList {
	private List<Beneficiary> beneficiaryList;
}

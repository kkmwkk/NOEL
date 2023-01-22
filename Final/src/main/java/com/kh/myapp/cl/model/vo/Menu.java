package com.kh.myapp.cl.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Menu {

    private int menuNo;
    private int classNo;
    private String marketerId;
    private String menuName;
    private String menuPrice;
    private String menuImg;

}

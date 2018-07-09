package com.entity;

public class ProductionInfo {
    private Integer id;

    private String productioncode;

    private String productionname;

    private Integer type;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getProductioncode() {
        return productioncode;
    }

    public void setProductioncode(String productioncode) {
        this.productioncode = productioncode;
    }

    public String getProductionname() {
        return productionname;
    }

    public void setProductionname(String productionname) {
        this.productionname = productionname;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }
}
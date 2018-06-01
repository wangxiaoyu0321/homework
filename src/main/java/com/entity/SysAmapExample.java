package com.entity;

import java.util.ArrayList;
import java.util.List;

public class SysAmapExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public SysAmapExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andFdIdIsNull() {
            addCriterion("fd_id is null");
            return (Criteria) this;
        }

        public Criteria andFdIdIsNotNull() {
            addCriterion("fd_id is not null");
            return (Criteria) this;
        }

        public Criteria andFdIdEqualTo(Integer value) {
            addCriterion("fd_id =", value, "fdId");
            return (Criteria) this;
        }

        public Criteria andFdIdNotEqualTo(Integer value) {
            addCriterion("fd_id <>", value, "fdId");
            return (Criteria) this;
        }

        public Criteria andFdIdGreaterThan(Integer value) {
            addCriterion("fd_id >", value, "fdId");
            return (Criteria) this;
        }

        public Criteria andFdIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("fd_id >=", value, "fdId");
            return (Criteria) this;
        }

        public Criteria andFdIdLessThan(Integer value) {
            addCriterion("fd_id <", value, "fdId");
            return (Criteria) this;
        }

        public Criteria andFdIdLessThanOrEqualTo(Integer value) {
            addCriterion("fd_id <=", value, "fdId");
            return (Criteria) this;
        }

        public Criteria andFdIdIn(List<Integer> values) {
            addCriterion("fd_id in", values, "fdId");
            return (Criteria) this;
        }

        public Criteria andFdIdNotIn(List<Integer> values) {
            addCriterion("fd_id not in", values, "fdId");
            return (Criteria) this;
        }

        public Criteria andFdIdBetween(Integer value1, Integer value2) {
            addCriterion("fd_id between", value1, value2, "fdId");
            return (Criteria) this;
        }

        public Criteria andFdIdNotBetween(Integer value1, Integer value2) {
            addCriterion("fd_id not between", value1, value2, "fdId");
            return (Criteria) this;
        }

        public Criteria andFdCitycodeIsNull() {
            addCriterion("fd_citycode is null");
            return (Criteria) this;
        }

        public Criteria andFdCitycodeIsNotNull() {
            addCriterion("fd_citycode is not null");
            return (Criteria) this;
        }

        public Criteria andFdCitycodeEqualTo(String value) {
            addCriterion("fd_citycode =", value, "fdCitycode");
            return (Criteria) this;
        }

        public Criteria andFdCitycodeNotEqualTo(String value) {
            addCriterion("fd_citycode <>", value, "fdCitycode");
            return (Criteria) this;
        }

        public Criteria andFdCitycodeGreaterThan(String value) {
            addCriterion("fd_citycode >", value, "fdCitycode");
            return (Criteria) this;
        }

        public Criteria andFdCitycodeGreaterThanOrEqualTo(String value) {
            addCriterion("fd_citycode >=", value, "fdCitycode");
            return (Criteria) this;
        }

        public Criteria andFdCitycodeLessThan(String value) {
            addCriterion("fd_citycode <", value, "fdCitycode");
            return (Criteria) this;
        }

        public Criteria andFdCitycodeLessThanOrEqualTo(String value) {
            addCriterion("fd_citycode <=", value, "fdCitycode");
            return (Criteria) this;
        }

        public Criteria andFdCitycodeLike(String value) {
            addCriterion("fd_citycode like", value, "fdCitycode");
            return (Criteria) this;
        }

        public Criteria andFdCitycodeNotLike(String value) {
            addCriterion("fd_citycode not like", value, "fdCitycode");
            return (Criteria) this;
        }

        public Criteria andFdCitycodeIn(List<String> values) {
            addCriterion("fd_citycode in", values, "fdCitycode");
            return (Criteria) this;
        }

        public Criteria andFdCitycodeNotIn(List<String> values) {
            addCriterion("fd_citycode not in", values, "fdCitycode");
            return (Criteria) this;
        }

        public Criteria andFdCitycodeBetween(String value1, String value2) {
            addCriterion("fd_citycode between", value1, value2, "fdCitycode");
            return (Criteria) this;
        }

        public Criteria andFdCitycodeNotBetween(String value1, String value2) {
            addCriterion("fd_citycode not between", value1, value2, "fdCitycode");
            return (Criteria) this;
        }

        public Criteria andFdAdcodeIsNull() {
            addCriterion("fd_adcode is null");
            return (Criteria) this;
        }

        public Criteria andFdAdcodeIsNotNull() {
            addCriterion("fd_adcode is not null");
            return (Criteria) this;
        }

        public Criteria andFdAdcodeEqualTo(Integer value) {
            addCriterion("fd_adcode =", value, "fdAdcode");
            return (Criteria) this;
        }

        public Criteria andFdAdcodeNotEqualTo(Integer value) {
            addCriterion("fd_adcode <>", value, "fdAdcode");
            return (Criteria) this;
        }

        public Criteria andFdAdcodeGreaterThan(Integer value) {
            addCriterion("fd_adcode >", value, "fdAdcode");
            return (Criteria) this;
        }

        public Criteria andFdAdcodeGreaterThanOrEqualTo(Integer value) {
            addCriterion("fd_adcode >=", value, "fdAdcode");
            return (Criteria) this;
        }

        public Criteria andFdAdcodeLessThan(Integer value) {
            addCriterion("fd_adcode <", value, "fdAdcode");
            return (Criteria) this;
        }

        public Criteria andFdAdcodeLessThanOrEqualTo(Integer value) {
            addCriterion("fd_adcode <=", value, "fdAdcode");
            return (Criteria) this;
        }

        public Criteria andFdAdcodeIn(List<Integer> values) {
            addCriterion("fd_adcode in", values, "fdAdcode");
            return (Criteria) this;
        }

        public Criteria andFdAdcodeNotIn(List<Integer> values) {
            addCriterion("fd_adcode not in", values, "fdAdcode");
            return (Criteria) this;
        }

        public Criteria andFdAdcodeBetween(Integer value1, Integer value2) {
            addCriterion("fd_adcode between", value1, value2, "fdAdcode");
            return (Criteria) this;
        }

        public Criteria andFdAdcodeNotBetween(Integer value1, Integer value2) {
            addCriterion("fd_adcode not between", value1, value2, "fdAdcode");
            return (Criteria) this;
        }

        public Criteria andFdNameIsNull() {
            addCriterion("fd_name is null");
            return (Criteria) this;
        }

        public Criteria andFdNameIsNotNull() {
            addCriterion("fd_name is not null");
            return (Criteria) this;
        }

        public Criteria andFdNameEqualTo(String value) {
            addCriterion("fd_name =", value, "fdName");
            return (Criteria) this;
        }

        public Criteria andFdNameNotEqualTo(String value) {
            addCriterion("fd_name <>", value, "fdName");
            return (Criteria) this;
        }

        public Criteria andFdNameGreaterThan(String value) {
            addCriterion("fd_name >", value, "fdName");
            return (Criteria) this;
        }

        public Criteria andFdNameGreaterThanOrEqualTo(String value) {
            addCriterion("fd_name >=", value, "fdName");
            return (Criteria) this;
        }

        public Criteria andFdNameLessThan(String value) {
            addCriterion("fd_name <", value, "fdName");
            return (Criteria) this;
        }

        public Criteria andFdNameLessThanOrEqualTo(String value) {
            addCriterion("fd_name <=", value, "fdName");
            return (Criteria) this;
        }

        public Criteria andFdNameLike(String value) {
            addCriterion("fd_name like", value, "fdName");
            return (Criteria) this;
        }

        public Criteria andFdNameNotLike(String value) {
            addCriterion("fd_name not like", value, "fdName");
            return (Criteria) this;
        }

        public Criteria andFdNameIn(List<String> values) {
            addCriterion("fd_name in", values, "fdName");
            return (Criteria) this;
        }

        public Criteria andFdNameNotIn(List<String> values) {
            addCriterion("fd_name not in", values, "fdName");
            return (Criteria) this;
        }

        public Criteria andFdNameBetween(String value1, String value2) {
            addCriterion("fd_name between", value1, value2, "fdName");
            return (Criteria) this;
        }

        public Criteria andFdNameNotBetween(String value1, String value2) {
            addCriterion("fd_name not between", value1, value2, "fdName");
            return (Criteria) this;
        }

        public Criteria andFdCenterIsNull() {
            addCriterion("fd_center is null");
            return (Criteria) this;
        }

        public Criteria andFdCenterIsNotNull() {
            addCriterion("fd_center is not null");
            return (Criteria) this;
        }

        public Criteria andFdCenterEqualTo(String value) {
            addCriterion("fd_center =", value, "fdCenter");
            return (Criteria) this;
        }

        public Criteria andFdCenterNotEqualTo(String value) {
            addCriterion("fd_center <>", value, "fdCenter");
            return (Criteria) this;
        }

        public Criteria andFdCenterGreaterThan(String value) {
            addCriterion("fd_center >", value, "fdCenter");
            return (Criteria) this;
        }

        public Criteria andFdCenterGreaterThanOrEqualTo(String value) {
            addCriterion("fd_center >=", value, "fdCenter");
            return (Criteria) this;
        }

        public Criteria andFdCenterLessThan(String value) {
            addCriterion("fd_center <", value, "fdCenter");
            return (Criteria) this;
        }

        public Criteria andFdCenterLessThanOrEqualTo(String value) {
            addCriterion("fd_center <=", value, "fdCenter");
            return (Criteria) this;
        }

        public Criteria andFdCenterLike(String value) {
            addCriterion("fd_center like", value, "fdCenter");
            return (Criteria) this;
        }

        public Criteria andFdCenterNotLike(String value) {
            addCriterion("fd_center not like", value, "fdCenter");
            return (Criteria) this;
        }

        public Criteria andFdCenterIn(List<String> values) {
            addCriterion("fd_center in", values, "fdCenter");
            return (Criteria) this;
        }

        public Criteria andFdCenterNotIn(List<String> values) {
            addCriterion("fd_center not in", values, "fdCenter");
            return (Criteria) this;
        }

        public Criteria andFdCenterBetween(String value1, String value2) {
            addCriterion("fd_center between", value1, value2, "fdCenter");
            return (Criteria) this;
        }

        public Criteria andFdCenterNotBetween(String value1, String value2) {
            addCriterion("fd_center not between", value1, value2, "fdCenter");
            return (Criteria) this;
        }

        public Criteria andFdLevelIsNull() {
            addCriterion("fd_level is null");
            return (Criteria) this;
        }

        public Criteria andFdLevelIsNotNull() {
            addCriterion("fd_level is not null");
            return (Criteria) this;
        }

        public Criteria andFdLevelEqualTo(String value) {
            addCriterion("fd_level =", value, "fdLevel");
            return (Criteria) this;
        }

        public Criteria andFdLevelNotEqualTo(String value) {
            addCriterion("fd_level <>", value, "fdLevel");
            return (Criteria) this;
        }

        public Criteria andFdLevelGreaterThan(String value) {
            addCriterion("fd_level >", value, "fdLevel");
            return (Criteria) this;
        }

        public Criteria andFdLevelGreaterThanOrEqualTo(String value) {
            addCriterion("fd_level >=", value, "fdLevel");
            return (Criteria) this;
        }

        public Criteria andFdLevelLessThan(String value) {
            addCriterion("fd_level <", value, "fdLevel");
            return (Criteria) this;
        }

        public Criteria andFdLevelLessThanOrEqualTo(String value) {
            addCriterion("fd_level <=", value, "fdLevel");
            return (Criteria) this;
        }

        public Criteria andFdLevelLike(String value) {
            addCriterion("fd_level like", value, "fdLevel");
            return (Criteria) this;
        }

        public Criteria andFdLevelNotLike(String value) {
            addCriterion("fd_level not like", value, "fdLevel");
            return (Criteria) this;
        }

        public Criteria andFdLevelIn(List<String> values) {
            addCriterion("fd_level in", values, "fdLevel");
            return (Criteria) this;
        }

        public Criteria andFdLevelNotIn(List<String> values) {
            addCriterion("fd_level not in", values, "fdLevel");
            return (Criteria) this;
        }

        public Criteria andFdLevelBetween(String value1, String value2) {
            addCriterion("fd_level between", value1, value2, "fdLevel");
            return (Criteria) this;
        }

        public Criteria andFdLevelNotBetween(String value1, String value2) {
            addCriterion("fd_level not between", value1, value2, "fdLevel");
            return (Criteria) this;
        }

        public Criteria andFdAreacodeIsNull() {
            addCriterion("fd_areacode is null");
            return (Criteria) this;
        }

        public Criteria andFdAreacodeIsNotNull() {
            addCriterion("fd_areacode is not null");
            return (Criteria) this;
        }

        public Criteria andFdAreacodeEqualTo(String value) {
            addCriterion("fd_areacode =", value, "fdAreacode");
            return (Criteria) this;
        }

        public Criteria andFdAreacodeNotEqualTo(String value) {
            addCriterion("fd_areacode <>", value, "fdAreacode");
            return (Criteria) this;
        }

        public Criteria andFdAreacodeGreaterThan(String value) {
            addCriterion("fd_areacode >", value, "fdAreacode");
            return (Criteria) this;
        }

        public Criteria andFdAreacodeGreaterThanOrEqualTo(String value) {
            addCriterion("fd_areacode >=", value, "fdAreacode");
            return (Criteria) this;
        }

        public Criteria andFdAreacodeLessThan(String value) {
            addCriterion("fd_areacode <", value, "fdAreacode");
            return (Criteria) this;
        }

        public Criteria andFdAreacodeLessThanOrEqualTo(String value) {
            addCriterion("fd_areacode <=", value, "fdAreacode");
            return (Criteria) this;
        }

        public Criteria andFdAreacodeLike(String value) {
            addCriterion("fd_areacode like", value, "fdAreacode");
            return (Criteria) this;
        }

        public Criteria andFdAreacodeNotLike(String value) {
            addCriterion("fd_areacode not like", value, "fdAreacode");
            return (Criteria) this;
        }

        public Criteria andFdAreacodeIn(List<String> values) {
            addCriterion("fd_areacode in", values, "fdAreacode");
            return (Criteria) this;
        }

        public Criteria andFdAreacodeNotIn(List<String> values) {
            addCriterion("fd_areacode not in", values, "fdAreacode");
            return (Criteria) this;
        }

        public Criteria andFdAreacodeBetween(String value1, String value2) {
            addCriterion("fd_areacode between", value1, value2, "fdAreacode");
            return (Criteria) this;
        }

        public Criteria andFdAreacodeNotBetween(String value1, String value2) {
            addCriterion("fd_areacode not between", value1, value2, "fdAreacode");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}
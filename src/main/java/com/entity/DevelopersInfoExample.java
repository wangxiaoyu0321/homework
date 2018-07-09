package com.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class DevelopersInfoExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public DevelopersInfoExample() {
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

        public Criteria andDeveloperidIsNull() {
            addCriterion("developerId is null");
            return (Criteria) this;
        }

        public Criteria andDeveloperidIsNotNull() {
            addCriterion("developerId is not null");
            return (Criteria) this;
        }

        public Criteria andDeveloperidEqualTo(Integer value) {
            addCriterion("developerId =", value, "developerid");
            return (Criteria) this;
        }

        public Criteria andDeveloperidNotEqualTo(Integer value) {
            addCriterion("developerId <>", value, "developerid");
            return (Criteria) this;
        }

        public Criteria andDeveloperidGreaterThan(Integer value) {
            addCriterion("developerId >", value, "developerid");
            return (Criteria) this;
        }

        public Criteria andDeveloperidGreaterThanOrEqualTo(Integer value) {
            addCriterion("developerId >=", value, "developerid");
            return (Criteria) this;
        }

        public Criteria andDeveloperidLessThan(Integer value) {
            addCriterion("developerId <", value, "developerid");
            return (Criteria) this;
        }

        public Criteria andDeveloperidLessThanOrEqualTo(Integer value) {
            addCriterion("developerId <=", value, "developerid");
            return (Criteria) this;
        }

        public Criteria andDeveloperidIn(List<Integer> values) {
            addCriterion("developerId in", values, "developerid");
            return (Criteria) this;
        }

        public Criteria andDeveloperidNotIn(List<Integer> values) {
            addCriterion("developerId not in", values, "developerid");
            return (Criteria) this;
        }

        public Criteria andDeveloperidBetween(Integer value1, Integer value2) {
            addCriterion("developerId between", value1, value2, "developerid");
            return (Criteria) this;
        }

        public Criteria andDeveloperidNotBetween(Integer value1, Integer value2) {
            addCriterion("developerId not between", value1, value2, "developerid");
            return (Criteria) this;
        }

        public Criteria andDevelopernameIsNull() {
            addCriterion("developerName is null");
            return (Criteria) this;
        }

        public Criteria andDevelopernameIsNotNull() {
            addCriterion("developerName is not null");
            return (Criteria) this;
        }

        public Criteria andDevelopernameEqualTo(String value) {
            addCriterion("developerName =", value, "developername");
            return (Criteria) this;
        }

        public Criteria andDevelopernameNotEqualTo(String value) {
            addCriterion("developerName <>", value, "developername");
            return (Criteria) this;
        }

        public Criteria andDevelopernameGreaterThan(String value) {
            addCriterion("developerName >", value, "developername");
            return (Criteria) this;
        }

        public Criteria andDevelopernameGreaterThanOrEqualTo(String value) {
            addCriterion("developerName >=", value, "developername");
            return (Criteria) this;
        }

        public Criteria andDevelopernameLessThan(String value) {
            addCriterion("developerName <", value, "developername");
            return (Criteria) this;
        }

        public Criteria andDevelopernameLessThanOrEqualTo(String value) {
            addCriterion("developerName <=", value, "developername");
            return (Criteria) this;
        }

        public Criteria andDevelopernameLike(String value) {
            addCriterion("developerName like", value, "developername");
            return (Criteria) this;
        }

        public Criteria andDevelopernameNotLike(String value) {
            addCriterion("developerName not like", value, "developername");
            return (Criteria) this;
        }

        public Criteria andDevelopernameIn(List<String> values) {
            addCriterion("developerName in", values, "developername");
            return (Criteria) this;
        }

        public Criteria andDevelopernameNotIn(List<String> values) {
            addCriterion("developerName not in", values, "developername");
            return (Criteria) this;
        }

        public Criteria andDevelopernameBetween(String value1, String value2) {
            addCriterion("developerName between", value1, value2, "developername");
            return (Criteria) this;
        }

        public Criteria andDevelopernameNotBetween(String value1, String value2) {
            addCriterion("developerName not between", value1, value2, "developername");
            return (Criteria) this;
        }

        public Criteria andStateIsNull() {
            addCriterion("state is null");
            return (Criteria) this;
        }

        public Criteria andStateIsNotNull() {
            addCriterion("state is not null");
            return (Criteria) this;
        }

        public Criteria andStateEqualTo(Integer value) {
            addCriterion("state =", value, "state");
            return (Criteria) this;
        }

        public Criteria andStateNotEqualTo(Integer value) {
            addCriterion("state <>", value, "state");
            return (Criteria) this;
        }

        public Criteria andStateGreaterThan(Integer value) {
            addCriterion("state >", value, "state");
            return (Criteria) this;
        }

        public Criteria andStateGreaterThanOrEqualTo(Integer value) {
            addCriterion("state >=", value, "state");
            return (Criteria) this;
        }

        public Criteria andStateLessThan(Integer value) {
            addCriterion("state <", value, "state");
            return (Criteria) this;
        }

        public Criteria andStateLessThanOrEqualTo(Integer value) {
            addCriterion("state <=", value, "state");
            return (Criteria) this;
        }

        public Criteria andStateIn(List<Integer> values) {
            addCriterion("state in", values, "state");
            return (Criteria) this;
        }

        public Criteria andStateNotIn(List<Integer> values) {
            addCriterion("state not in", values, "state");
            return (Criteria) this;
        }

        public Criteria andStateBetween(Integer value1, Integer value2) {
            addCriterion("state between", value1, value2, "state");
            return (Criteria) this;
        }

        public Criteria andStateNotBetween(Integer value1, Integer value2) {
            addCriterion("state not between", value1, value2, "state");
            return (Criteria) this;
        }

        public Criteria andCreatetimeIsNull() {
            addCriterion("createTime is null");
            return (Criteria) this;
        }

        public Criteria andCreatetimeIsNotNull() {
            addCriterion("createTime is not null");
            return (Criteria) this;
        }

        public Criteria andCreatetimeEqualTo(Date value) {
            addCriterion("createTime =", value, "createtime");
            return (Criteria) this;
        }

        public Criteria andCreatetimeNotEqualTo(Date value) {
            addCriterion("createTime <>", value, "createtime");
            return (Criteria) this;
        }

        public Criteria andCreatetimeGreaterThan(Date value) {
            addCriterion("createTime >", value, "createtime");
            return (Criteria) this;
        }

        public Criteria andCreatetimeGreaterThanOrEqualTo(Date value) {
            addCriterion("createTime >=", value, "createtime");
            return (Criteria) this;
        }

        public Criteria andCreatetimeLessThan(Date value) {
            addCriterion("createTime <", value, "createtime");
            return (Criteria) this;
        }

        public Criteria andCreatetimeLessThanOrEqualTo(Date value) {
            addCriterion("createTime <=", value, "createtime");
            return (Criteria) this;
        }

        public Criteria andCreatetimeIn(List<Date> values) {
            addCriterion("createTime in", values, "createtime");
            return (Criteria) this;
        }

        public Criteria andCreatetimeNotIn(List<Date> values) {
            addCriterion("createTime not in", values, "createtime");
            return (Criteria) this;
        }

        public Criteria andCreatetimeBetween(Date value1, Date value2) {
            addCriterion("createTime between", value1, value2, "createtime");
            return (Criteria) this;
        }

        public Criteria andCreatetimeNotBetween(Date value1, Date value2) {
            addCriterion("createTime not between", value1, value2, "createtime");
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
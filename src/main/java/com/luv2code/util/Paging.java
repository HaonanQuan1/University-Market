package com.luv2code.util;


import java.util.List;

public class Paging {
    int totalRecord;//total
    int totalPageNum;//total pages
    int pagesize;//records of first page
    int pageNow;//current page
    int indexpage=1;//first page
    int endpage;//last page
    List<Object> list;//store the data


    public int getTotalRecord() {
        return totalRecord;
    }
    public void setTotalRecord(int totalRecord) {
        this.totalRecord = totalRecord;
    }
    public int getTotalPageNum() {
        return totalPageNum;
    }
    public void setTotalPageNum() {
        this.totalPageNum=(totalRecord%pagesize==0)?(totalRecord/pagesize):(totalRecord/pagesize+1);
    }
    public int getPagesize() {
        return pagesize;
    }
    public void setPagesize(int pagesize) {
        this.pagesize = pagesize;
    }
    public int getPageNow() {
        return pageNow;
    }
    public void setPageNow(int pageNow) {
        this.pageNow = pageNow;
    }
    public int getIndexpage() {
        return indexpage;
    }
    public void setIndexpage(int indexpage) {
        this.indexpage = indexpage;
    }
    public int getEndpage() {
        return endpage;
    }
    public void setEndpage() {
        //最末页的页码为总页数
        this.endpage = totalPageNum;
    }
    public List<Object> getList() {
        return list;
    }
    public void setList(List<Object> list) {
        this.list = list;
    }

}

package com.luv2code.util;

import com.luv2code.Entity.Student;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Component
public class PagingUtil {
    public Map<String,Object> createPage(List<Object> recordList,String curr){
        Map<String,Object> result = new HashMap<>();
        int totalRecord = recordList.size();
        System.out.println("totalRecord " +totalRecord);
        int page = 0;

        Paging paging = new Paging();
        paging.setTotalRecord(totalRecord);
        paging.setPagesize(5);
        paging.setTotalPageNum();
        paging.setEndpage();
        paging.setIndexpage(1);
        if(curr != null){
            int pag = Integer.parseInt(curr);
            if(pag > 0){
                page = pag;
                if(pag > (paging.getTotalPageNum() - 1)){
                    page = pag - 1;
                }
            }
        }
        paging.setPageNow(page);
        List<Object> list_page = new ArrayList<>();
        int nowMinRecord = paging.getPageNow()*paging.getPagesize();
        for(int i = nowMinRecord; i < (paging.getPageNow() + 1)*paging.getPagesize() && i < recordList.size(); i++){
            list_page.add(recordList.get(i));
        }
        result.put("paging",paging);
        result.put("list",list_page);
        return result;
    }
}

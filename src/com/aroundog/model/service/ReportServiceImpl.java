package com.aroundog.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.aroundog.common.exception.ReportFailException;
import com.aroundog.model.domain.Report;
import com.aroundog.model.domain.ReportImg;
import com.aroundog.model.repository.ReportDAO;

@Service
public class ReportServiceImpl implements ReportService{
   @Autowired
   @Qualifier("mybatisReportDAO")
   private ReportDAO reportDAO;
   
   @Override
   public void insert(Report report) throws ReportFailException {
      int result = reportDAO.insert(report);
      if(result ==0) {
         throw new ReportFailException("제보 실패!!");
      }
   }

   @Override
   public void insertImg(ReportImg reportImg) throws ReportFailException{
      int result = reportDAO.insertImg(reportImg);
      if(result ==0) {
         throw new ReportFailException("제보 실패!!");
      }
      
   }

   @Override
   public List selectAll() {
      return reportDAO.selectAll();
   }

}
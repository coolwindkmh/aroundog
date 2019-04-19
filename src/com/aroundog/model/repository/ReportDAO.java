package com.aroundog.model.repository;

import java.util.List;

import com.aroundog.model.domain.Report;
import com.aroundog.model.domain.ReportImg;

public interface ReportDAO {
   public int insert(Report report);
   public int insertImg(ReportImg reportImg);
   public List selectAll();
}
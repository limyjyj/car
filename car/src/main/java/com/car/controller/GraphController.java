package com.car.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.rosuda.JRI.Rengine;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.car.common.TextConsole;
import com.car.model.dto.Carhistory;
import com.car.model.service.CarhistoryService;
import com.google.gson.Gson;

@Controller
@RequestMapping(value = "/graph/")
public class GraphController {

   @Autowired
   @Qualifier("carhistoryService")
   private CarhistoryService carhistoryService;

   /**
    * rJAVA Engine 의 인스턴스를 가져옴
    * @return
    */
   private Rengine getREngine() {
      
      
      
      // just making sure we have the right version of everything
      if (!Rengine.versionCheck()) {
          System.err.println("** Version mismatch - Java files don't match library version.");
          System.exit(1);
      }
        System.out.println("Creating Rengine (with arguments)");
        
      // 1) we pass the arguments from the command line
      // 2) we won't use the main loop at first, we'll start it later
      //    (that's the "false" as second argument)
      // 3) the callbacks are implemented by the TextConsole class above

        // 이미 만들어진 R engine이 있는지 확인
      Rengine re= Rengine.getMainEngine();

      if(re == null)
      {
         // 만들어진 인스턴스가 없다면 생성.
         re = new Rengine(null, false, new TextConsole());
      }
      
        System.out.println("Rengine created, waiting for R");
      // the engine creates R is a new thread, so we should wait until it's ready
        if (!re.waitForR()) {
            System.out.println("Cannot load R");
            return null;
        }
        
      return re;
   }



   @RequestMapping(value = "test.action", method = RequestMethod.GET)
   public String test(
         Model model,
         HttpSession session) 
   {
      // R engine의 인스턴스를 가져온다.
      Rengine re = getREngine();
   if(re==null)
   {
            return "redirect:/home.action";
   }

   // DB에서 데이터를 가져온다.
   List<Carhistory> historys = carhistoryService.selectAllCarhistory();


   // JSON 형태로 변환한다.
   Gson gson = new Gson();
   String json;
   json = gson.toJson(historys);   // JSON 의 String 으로 변환한다.

   // JSON 형태로 변환한 문자열을 R에 넣기
        re.eval("library(jsonlite)");
        re.eval(String.format("json <- '%s'", json));
        re.eval("rs <- fromJSON(json)");

        
        // text 형식으로 R 사용하기. 표를 만들어서 PNG 이미지 파일로 만들
        re.eval("print(rs)");

        String path = session.getServletContext().getRealPath("/resources/Upload/");
        path = path.replace("\\", "/");
        
        String saveFileName = "test.png";
        
        System.out.println("path: " + path + saveFileName);
        
        re.eval(String.format("png(width = %d, height = %d, filename = \"%s%s\")", 700, 700, path, saveFileName));

        re.eval("print(barplot(rs, col=rainbow(round(rs))))");

        re.eval("dev.off()");   // 윈도 닫기
        
        return "/car/graph";
   }
   
}
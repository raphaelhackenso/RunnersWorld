package at.fhj.ima.runnersworld.runnersworld.controller

import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod

@Controller
class AnonymousController(val speedRunController: SpeedRunController) {

    /*
    @RequestMapping("/aSpeedRuns", method = [RequestMethod.GET])
    fun anonymous(): String {
        return "aSpeedRuns"
    }


     */

    @RequestMapping("/aSpeedRuns", method = [RequestMethod.GET])
    fun aSpeedRuns(model: Model): String{

        speedRunController.showListSpeedrun(model)
        return "aSpeedRuns";
    }
}

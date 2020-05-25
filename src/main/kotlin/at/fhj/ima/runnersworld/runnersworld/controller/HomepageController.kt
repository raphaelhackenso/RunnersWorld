
package at.fhj.ima.runnersworld.runnersworld.controller

import org.springframework.stereotype.Controller
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod

@Controller
class HomePageController {


    //TODO how to start with anyonymous page ?

    //TODO Ask here
    @RequestMapping("", method = [RequestMethod.GET])
    fun homePage(): String {
        return "redirect:listSpeedRuns"
    }

    //TODO <- this is quite weird
    //TODO Ask here
    @RequestMapping("/")
    fun home(): String? {
        return "redirect:aSpeedRuns"
    }

}


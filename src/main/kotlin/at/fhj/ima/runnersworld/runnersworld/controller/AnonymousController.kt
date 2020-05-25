package at.fhj.ima.runnersworld.runnersworld.controller

import org.springframework.stereotype.Controller
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod

@Controller
class AnonymousController {

    @RequestMapping("/aSpeedRuns", method = [RequestMethod.GET])
    fun anonymous(): String {
        return "aSpeedRuns"
    }
}

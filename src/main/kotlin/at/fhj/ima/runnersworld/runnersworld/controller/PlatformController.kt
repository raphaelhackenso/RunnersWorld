package at.fhj.ima.runnersworld.runnersworld.controller

import at.fhj.ima.runnersworld.runnersworld.repository.GameRepository
import at.fhj.ima.runnersworld.runnersworld.repository.PlatformRepository
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.ui.set
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.bind.annotation.RequestParam

@Controller
class PlatformController(val platformRepository: PlatformRepository) {

//TODO -> update to be used with Services

    @RequestMapping("/listPlatform", method = [RequestMethod.GET])
    fun listPlatform(model: Model, @RequestParam(required = false) search: String?): String {
        if (search != null) {
            //TODO search
            //model.set("speedRuns", speedRunRepository.findByTypeOfRun(search))
        } else {
            model.set("platform", platformRepository.findAll())
        }
        return "listPlatform"
    }

}
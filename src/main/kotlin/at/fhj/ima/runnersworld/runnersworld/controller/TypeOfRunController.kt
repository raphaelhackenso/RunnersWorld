package at.fhj.ima.runnersworld.runnersworld.controller

import at.fhj.ima.runnersworld.runnersworld.repository.TypeOfRunRepository
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.ui.set
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.bind.annotation.RequestParam

@Controller
class TypeOfRunController(val typeOfRunRepository: TypeOfRunRepository) {

//TODO -> update to be used with Services

    @RequestMapping("/listTypeOfRuns", method = [RequestMethod.GET])
    fun listTypeOfRuns(model: Model, @RequestParam(required = false) search: String?): String {
        if (search != null) {
            //TODO search
            //model.set("speedRuns", speedRunRepository.findByTypeOfRun(search))
        } else {
            model.set("typeOfRuns", typeOfRunRepository.findAll())
        }
        return "listTypeOfRuns"
    }

}
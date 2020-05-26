package at.fhj.ima.runnersworld.runnersworld.controller

import at.fhj.ima.runnersworld.runnersworld.repository.GameRepository
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.ui.set
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.bind.annotation.RequestParam

@Controller
class GameController(val gameRepository: GameRepository) {

//TODO -> update to be used with Services

    @RequestMapping("/listGames", method = [RequestMethod.GET])
    fun listGames(model: Model, @RequestParam(required = false) search: String?): String {
        if (search != null) {
            //TODO search
            //model.set("speedRuns", speedRunRepository.findByTypeOfRun(search))
        } else {
            model.set("games", gameRepository.findAll())
        }
        return "listGames"
    }

}
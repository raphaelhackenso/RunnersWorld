package at.fhj.ima.runnersworld.runnersworld.controller

import at.fhj.ima.runnersworld.runnersworld.entity.Game
import at.fhj.ima.runnersworld.runnersworld.repository.GameRepository
import at.fhj.ima.runnersworld.runnersworld.service.GameService
import org.springframework.dao.DataIntegrityViolationException
import org.springframework.security.access.annotation.Secured
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.ui.set
import org.springframework.validation.BindingResult
import org.springframework.web.bind.annotation.ModelAttribute
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.bind.annotation.RequestParam
import javax.validation.Valid

@Controller
class GameController(val gameService: GameService) {

    @RequestMapping("/listGames", method = [RequestMethod.GET])
    fun listGames(model: Model, @RequestParam(required = false) search: String?): String {
        if (search != null) {
            model.set("games", gameService.findGameByName(search))
        } else {
            model.set("games", gameService.findAll())
        }
        return "listGames"
    }

    @RequestMapping("/changeGame", method = [RequestMethod.POST])
    @Secured("ROLE_ADMIN")
    fun changeGame(@ModelAttribute("game") @Valid game: Game,
                   bindingResult: BindingResult, model: Model): String {
        if (bindingResult.hasErrors()) {
            return showEditGameView(model)
        }

        try {
            gameService.save(game)
        } catch (dive: DataIntegrityViolationException) {
            throw dive;
        }
        return "redirect:/listGames"
    }


    @RequestMapping("/editGame", method = [RequestMethod.GET])
    @Secured("ROLE_ADMIN")
    fun editGame(model: Model, @RequestParam(required = false) id: Int?): String {
        if (id != null) {
            model.set("game", gameService.findByGameId(id))
        } else {
            model.set("game", gameService.createNewGame())
        }
        return showEditGameView(model)
    }

    fun showEditGameView(model: Model): String {
        return "editGame"
    }


}
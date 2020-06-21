package at.fhj.ima.runnersworld.runnersworld.service

import at.fhj.ima.runnersworld.runnersworld.entity.Game
import at.fhj.ima.runnersworld.runnersworld.repository.GameRepository
import org.springframework.data.domain.Sort
import org.springframework.stereotype.Service
import org.springframework.transaction.annotation.Transactional


@Service
class GameService(val gameRepository: GameRepository) {


    fun findAll(): List<Game> {
        return gameRepository.findAll()
    }

    fun findByGameId(id: Int): Game {
        return gameRepository.findByGameId(id)
    }

    fun createNewGame(): Game {
        val newGame = Game()
        return newGame
    }

    @Transactional
    fun save(game: Game) {
        gameRepository.save(game)
    }

    fun findGameByName(search: String): List<Game> {
        return gameRepository.findGameByName(search)
    }


}
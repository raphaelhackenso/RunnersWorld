package at.fhj.ima.runnersworld.runnersworld.repository

import at.fhj.ima.runnersworld.runnersworld.entity.Game
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.data.jpa.repository.Query
import org.springframework.stereotype.Repository
import org.springframework.data.repository.query.Param

@Repository
interface GameRepository : JpaRepository<Game, Int> {

    @Query("FROM Game WHERE LOWER(name) LIKE CONCAT(LOWER(:search), '%')")
    fun findGameByName(@Param("search") search: String): List<Game>

    @Query("FROM Game WHERE id = :id")
    fun findByGameId(@Param("id") id: Int): Game


    //TODO -> search in GameRepo
    //@Query("FROM Employee WHERE LOWER(firstName) LIKE CONCAT(LOWER(:search),'%') OR LOWER(lastName) LIKE CONCAT(LOWER(:search),'%')")
    //fun findByTypeOfRun(@Param("search") search: String): List<Employee>

}
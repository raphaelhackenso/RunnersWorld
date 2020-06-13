package at.fhj.ima.runnersworld.runnersworld.repository

import at.fhj.ima.runnersworld.runnersworld.entity.Game
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.stereotype.Repository

@Repository
interface GameRepository : JpaRepository<Game, Int> {

    //TODO -> search in GameRepo
    //@Query("FROM Employee WHERE LOWER(firstName) LIKE CONCAT(LOWER(:search),'%') OR LOWER(lastName) LIKE CONCAT(LOWER(:search),'%')")
    //fun findByTypeOfRun(@Param("search") search: String): List<Employee>

}
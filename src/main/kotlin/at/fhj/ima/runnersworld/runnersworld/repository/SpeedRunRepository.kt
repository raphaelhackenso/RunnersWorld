package at.fhj.ima.runnersworld.runnersworld.repository

import at.fhj.ima.runnersworld.runnersworld.entity.Game
import at.fhj.ima.runnersworld.runnersworld.entity.Speedrun
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.data.jpa.repository.Query
import org.springframework.data.repository.query.Param
import org.springframework.stereotype.Repository

@Repository
interface SpeedRunRepository : JpaRepository<Speedrun, Int> {

    @Query("FROM Speedrun WHERE id = :id")
    fun findBySpeedrunId(@Param("id") id: Int): Speedrun


    @Query("FROM Speedrun WHERE state = :state ORDER BY date desc")
    fun findNewestValid(@Param("state") state: String): List<Speedrun>


    @Query("FROM Speedrun WHERE game.id= :game AND typeOfRun.id= :typeOfRun AND platform.id= :platform AND state='validated' ORDER BY inGameTime ASC")
    fun rankSpeedRuns(@Param("game") game: Int, @Param("typeOfRun") typeOfRun: Int, @Param("platform") platform: Int): List<Speedrun>

    @Query("FROM Speedrun WHERE runner.id= :runner AND state='validated' ORDER BY date desc")
    fun findAllValidSpeedrunsForUser(@Param("runner") runner: Int): List<Speedrun>


}
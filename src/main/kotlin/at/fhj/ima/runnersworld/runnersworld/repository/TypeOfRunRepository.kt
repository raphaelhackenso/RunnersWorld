package at.fhj.ima.runnersworld.runnersworld.repository

import at.fhj.ima.runnersworld.runnersworld.entity.Platform
import at.fhj.ima.runnersworld.runnersworld.entity.TypeOfRun
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.data.jpa.repository.Query
import org.springframework.data.repository.query.Param
import org.springframework.stereotype.Repository

@Repository
interface TypeOfRunRepository : JpaRepository<TypeOfRun, Int> {

    @Query("FROM TypeOfRun WHERE LOWER(category) LIKE CONCAT('%',LOWER(:search), '%')")
    fun findTypeOfRunByName(@Param("search") search: String): List<TypeOfRun>

    @Query("FROM TypeOfRun WHERE id = :id")
    fun findTypeOfRunById(@Param("id") id: Int): TypeOfRun

}
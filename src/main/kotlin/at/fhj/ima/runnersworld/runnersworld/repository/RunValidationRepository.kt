package at.fhj.ima.runnersworld.runnersworld.repository

import at.fhj.ima.runnersworld.runnersworld.entity.RunValidation
import at.fhj.ima.runnersworld.runnersworld.entity.User
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.data.jpa.repository.Query
import org.springframework.data.repository.query.Param
import org.springframework.stereotype.Repository

@Repository
interface RunValidationRepository : JpaRepository<RunValidation, Int> {

    //TODO -> search

    @Query("FROM RunValidation WHERE LOWER(id) LIKE CONCAT(LOWER(:search),'%')")
    fun findByRunValidationId(@Param("search") search: String): List<RunValidation>


    //TODO this should be safe ?
    @Query("FROM RunValidation WHERE LOWER(status) LIKE 'pending'")
    fun findAllPending(): List<RunValidation>

    @Query("FROM RunValidation WHERE id = :id")
    fun findByRunId(@Param("id") id: Int): RunValidation

}
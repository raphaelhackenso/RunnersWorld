package at.fhj.ima.runnersworld.runnersworld.repository

import at.fhj.ima.runnersworld.runnersworld.entity.Platform
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.data.jpa.repository.Query
import org.springframework.data.repository.query.Param
import org.springframework.stereotype.Repository

@Repository
interface PlatformRepository : JpaRepository<Platform, Int> {

    @Query("FROM Platform WHERE LOWER(name) LIKE CONCAT('%',LOWER(:search), '%')")
    fun findPlatformByName(@Param("search") search: String): List<Platform>

    @Query("FROM Platform WHERE id = :id")
    fun findPlatformById(@Param("id") id: Int): Platform

}
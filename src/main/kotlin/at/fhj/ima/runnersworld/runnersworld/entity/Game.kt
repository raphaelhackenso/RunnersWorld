package at.fhj.ima.runnersworld.runnersworld.entity

import java.time.LocalDate
import java.io.Serializable
import javax.persistence.*
import javax.persistence.Entity
import javax.persistence.GeneratedValue
import javax.persistence.GenerationType
import javax.persistence.Id
import javax.validation.constraints.NotEmpty
import javax.validation.constraints.NotNull

@Entity
class Game (
        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        var id: Int? = null,

        //TODO this is technically not needed
        @OneToMany(fetch = FetchType.EAGER, mappedBy = "game")
        var speedruns: Set<Speedrun>? = null,
        @field:NotNull()
        @field:NotEmpty()
        var name: String? = null,
        @field:NotNull()
        @field:NotEmpty()
        var language: String? = null,
        @field:NotNull()
        var version: Double? = null,
        @field:NotNull()
        var releaseYear: LocalDate? = null






) : Comparable<Game>, Serializable {
    override fun compareTo(other: Game): Int {
        return compareValues(id, other.id)
    }

    override fun equals(other: Any?): Boolean {
        if (this === other) return true
        if (javaClass != other?.javaClass) return false
        other as Game
        if (id != other.id) return false
        return true
    }

    override fun hashCode(): Int {
        return id.hashCode()
    }
}
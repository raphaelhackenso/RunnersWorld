package at.fhj.ima.runnersworld.runnersworld.dto


import at.fhj.ima.runnersworld.runnersworld.entity.*
import javax.validation.constraints.NotNull
import java.io.Serializable
import java.time.LocalDate
import java.time.LocalTime
import javax.validation.constraints.NotEmpty

/**
 * The SpeedRunDto class
 *
 * This class defines the speedRunDto
 *
 *
 * @property id the id of the speedRunDto.
 * @property game associated game for a speedRunDto.
 * @property platform associated platform for a speedRunDto.
 * @property inGameTime the in game time for a speedRunDto.
 * @property validationURL the reference (Link) for a speedRunDto.
 * @property notes the notes for a speedRunDto.
 * @property date the date for a speedRunDto.
 * @property typeOfRun the type of run for a speedRunDto.
 * @property runner associated runner (User) for a speedRunDto.
 *
 */

class SpeedRunDto(
        var id: Int? = null,
        @field:NotNull()
        var game: Game? = null,
        @field:NotNull()
        var platform: Platform? = null,
        @field:NotNull()
        var inGameTime: LocalTime? = null,
        @field:NotNull()
        @field:NotEmpty()
        var validationURL: String? = null,
        var notes: String? = null,
        @field:NotNull()
        var date: LocalDate? = null,
        @field:NotNull()
        var typeOfRun: TypeOfRun? = null,
        @field:NotNull()
        var runner: User? = null


) : Comparable<Speedrun>, Serializable {
    override fun compareTo(other: Speedrun): Int {
        return compareValues(id, other.id)
    }

    override fun equals(other: Any?): Boolean {
        if (this === other) return true
        if (javaClass != other?.javaClass) return false
        other as Speedrun
        if (id != other.id) return false
        return true
    }

    override fun hashCode(): Int {
        return id.hashCode()
    }

}

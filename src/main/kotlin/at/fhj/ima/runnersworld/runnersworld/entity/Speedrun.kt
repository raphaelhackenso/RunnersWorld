package at.fhj.ima.runnersworld.runnersworld.entity

import java.io.Serializable
import java.time.LocalDate
import java.time.LocalTime
import javax.persistence.*
import javax.persistence.Entity
import javax.persistence.GeneratedValue
import javax.persistence.GenerationType
import javax.persistence.Id


/**
 * The Speedrun class
 *
 * This class defines the speedrun
 *
 *
 * @property id the id of the speedrun.
 * @property game associated game for a speedrun.
 * @property platform associated platform for a speedrun.
 * @property runner associated runner (User) for a speedrun.
 * @property inGameTime the in game time for a speedrun.
 * @property validationURL the reference (Link) for a speedrun.
 * @property notes the notes for a speedrun.
 * @property date the date for a speedrun.
 * @property state the state for a speedrun.
 * @property typeOfRun the type of run for a speedrun.
 *
 */

@Entity
class Speedrun(

        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        var id: Int? = null,

        @ManyToOne
        var game: Game? = null,

        @ManyToOne
        var platform: Platform? = null,


        @ManyToOne
        @JoinColumn(name = "runner_id", nullable = false)
        var runner: User? = null,

        var inGameTime: LocalTime? = null,
        var validationURL: String? = null,
        var notes: String? = null,
        var date: LocalDate? = null,
        var state: String? = null,

        @ManyToOne
        var typeOfRun: TypeOfRun? = null


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
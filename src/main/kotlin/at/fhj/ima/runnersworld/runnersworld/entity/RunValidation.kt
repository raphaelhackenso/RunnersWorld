package at.fhj.ima.runnersworld.runnersworld.entity

import org.hibernate.engine.internal.Cascade
import java.io.Serializable
import javax.persistence.*
import javax.persistence.Entity
import javax.persistence.GeneratedValue
import javax.persistence.GenerationType
import javax.persistence.Id

/**
 * The RunValidation class
 *
 * This class defines a runValidation for a given speedrun
 *
 *
 * @property id the id of the runValidation.
 * @property speedrun associated speedrun that is to be validated/denied.
 * @property validatedBy the user (ROLE_ADMIN) that validated/denied this runValidation.
 * @property status the status of the runValidation.
 * @property notes the notes of the runValidation.
 *
 */

@Entity
class RunValidation(
        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        var id: Int? = null,

        //@OneToOne(cascade = arrayOf(CascadeType.ALL))
        //@OneToOne(mappedBy = "runValidation", cascade = arrayOf(CascadeType.ALL))
        @OneToOne(cascade = arrayOf(CascadeType.ALL))
        var speedrun: Speedrun? = null,

        @ManyToOne
        var validatedBy: User? = null,

        var status: String? = null,
        var notes: String? = null


) : Comparable<RunValidation>, Serializable {
    override fun compareTo(other: RunValidation): Int {
        return compareValues(id, other.id)
    }

    override fun equals(other: Any?): Boolean {
        if (this === other) return true
        if (javaClass != other?.javaClass) return false
        other as RunValidation
        if (id != other.id) return false
        return true
    }

    override fun hashCode(): Int {
        return id.hashCode()
    }
}
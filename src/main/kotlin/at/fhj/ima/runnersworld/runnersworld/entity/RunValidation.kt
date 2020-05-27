package at.fhj.ima.runnersworld.runnersworld.entity

import java.io.Serializable
import javax.persistence.*
import javax.persistence.Entity
import javax.persistence.GeneratedValue
import javax.persistence.GenerationType
import javax.persistence.Id

@Entity
class RunValidation (
        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        var id: Int? = null,

        @OneToMany(fetch = FetchType.EAGER)
        var speedRuns: Set<SpeedRun>? = null,

        @ManyToOne
        var validatedBy: User? = null,

        @ManyToOne
        var submittedFrom: User? = null,

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
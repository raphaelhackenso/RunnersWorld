package at.fhj.ima.runnersworld.runnersworld.dto


import at.fhj.ima.runnersworld.runnersworld.entity.RunValidation
import at.fhj.ima.runnersworld.runnersworld.entity.Speedrun
import at.fhj.ima.runnersworld.runnersworld.entity.User
import javax.validation.constraints.NotNull
import java.io.Serializable
import javax.validation.constraints.NotEmpty
import javax.validation.constraints.Size


/**
 * The UserDto class
 *
 * This class defines a userDto
 *
 *
 * @property id the id of the userDto.
 * @property username the username of the userDto.
 * @property password the password of the userDto.
 * @property passwordRepeat the repeated password of the userDto.
 * @property speedruns associated speedruns for a userDto.
 * @property runValidations associated runValidations for a userDto.
 *
 */

class UserDto(
        var id: Int? = null,
        @NotNull
        @NotEmpty
        @field:Size(min = 2, max = 240)
        var username: String? = null,
        @NotNull
        @NotEmpty
        @field:Size(min = 2, max = 240)
        var password: String? = null,
        @NotNull
        @NotEmpty
        @field:Size(min = 2, max = 240)
        var passwordRepeat: String? = null,
        var speedruns: Set<Speedrun>? = null,
        var runValidations: Set<RunValidation>? = null


) : Comparable<User>, Serializable {
    override fun compareTo(other: User): Int {
        return compareValues(id, other.id)
    }

    override fun equals(other: Any?): Boolean {
        if (this === other) return true
        if (javaClass != other?.javaClass) return false
        other as User
        if (id != other.id) return false
        return true
    }

    override fun hashCode(): Int {
        return id.hashCode()
    }


    fun isPasswordsMatch(): Boolean {
        return (password.equals(passwordRepeat))
    }


}

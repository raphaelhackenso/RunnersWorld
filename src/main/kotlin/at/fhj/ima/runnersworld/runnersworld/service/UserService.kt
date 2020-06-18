package at.fhj.ima.runnersworld.runnersworld.service





import at.fhj.ima.runnersworld.runnersworld.dto.UserDto
import at.fhj.ima.runnersworld.runnersworld.entity.User
import at.fhj.ima.runnersworld.runnersworld.entity.UserRole
import at.fhj.ima.runnersworld.runnersworld.repository.UserRepository
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder
import org.springframework.stereotype.Service
import org.springframework.transaction.annotation.Transactional



@Service
class UserService(val userRepository: UserRepository){


    fun createNewUser(): UserDto{
        val newUser = User()
        return convertEntityToDto(newUser)
    }


    @Transactional
    fun save(dto: UserDto){
        userRepository.save(convertDtoToEntity(dto))
    }


    private fun convertEntityToDto(entity: User): UserDto{
        return UserDto(entity.id, entity.username, entity.password, entity.password, entity.speedruns, entity.runValidations)
        //return UserDto(entity.id, entity.username, entity.password, entity.password, entity.runValidations)
    }


    private fun convertDtoToEntity(dto: UserDto): User {
        // TODO logic that prevents specific roles/users from editing certain attributes could be added here
        val user = User()
        user.id = dto.id
        user.username = dto.username
        user.password = BCryptPasswordEncoder().encode(dto.password)
        user.role = UserRole.ROLE_USER

        return user
    }

    fun findByUserId(id: Int): User{
        return userRepository.findByUserId(id)
    }

    fun findByUsername(username: String): User{
        return  userRepository.findByUsername(username)
    }
}
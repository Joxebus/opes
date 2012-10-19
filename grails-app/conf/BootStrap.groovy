import opes.login.Permiso
import opes.login.UsuarioSistema
import opes.login.UsuarioSistemaPermiso

class BootStrap {

    def init = { servletContext ->
        def rolAdmin = new Permiso(authority: 'ROLE_ADMIN').save(failOnError: true)
        def rolDocente = new Permiso(authority: 'ROLE_DOCENTE').save(failOnError: true)
        def rolAlumno = new Permiso(authority: 'ROLE_ALUMNO').save(failOnError: true)

        if (!UsuarioSistema.count()) {
            def testUser = new UsuarioSistema(
                    nombre: "Jorge",
                    segundoNombre: "Omar",
                    apellidoPaterno: "Bautista",
                    apellidoMaterno: "Valenzuela",
                    password: "admin",
                    noControlEmpleado: '000000',
                    tipoUsuario: "ADMINISTRADOR",
                    username: "jbautista@sintelti.com.mx",
                    telefono: "4411036796",
                    observaciones: "Administrador",
                    enabled: true,
                    usuarioAlta: 0,
                    fechaAlta: new Date(),
                    accountExpired: false,
                    accountLocked: false,
                    passwordExpired: false,
                    captcha: "")
            testUser.save(failOnError: true)
            UsuarioSistemaPermiso.create testUser, rolAdmin, true
        }
    }
    def destroy = {
    }
}

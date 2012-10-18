package opes.login

class UsuarioSistema {

    transient springSecurityService
	transient String captcha

	String username
	String password
	Boolean enabled
	Boolean accountExpired
	Boolean accountLocked
	Boolean passwordExpired

    String tipoUsuario
    String noControlEmpleado

	String nombre
	String segundoNombre
	String apellidoPaterno
	String apellidoMaterno

	String telefono
	String observaciones
	Integer usuarioAlta
	Integer usuarioModifica
	Integer estadoLogico
	Date fechaAlta
	Date fechaModifica

	static constraints = {
		username (blank:false,unique:true,nullable:false,maxSize:60,email:true)
		password (blank:false,nullable:false,maxSize:50,unique:true)
		nombre(blank:false,nullable:false,maxSize:150)
		segundoNombre(maxSize:50)
		apellidoPaterno(blank:false,nullable:false,maxSize:50)
		apellidoMaterno(blank:false,nullable:false,maxSize:50)
        tipoUsuario inList:['DOCENTE','ALUMNO','ADMINISTRADOR']
		telefono(blank:false,nullable:false,maxSize:25,matches:'[\\d]+')
		observaciones(nullable:false,maxSize:250)
		enabled(nullable:false)
		usuarioAlta(nullable:false)
		usuarioModifica(nullable:true)
		fechaAlta(nullable:false)
		fechaModifica(nullable:true)
		estadoLogico(nullable :true)
	}


	Set<Permiso> getAuthorities() {
		UsuarioSistemaPermiso.findAllByUsuarioSistema(this).collect { it.permiso } as Set
	}

	def beforeInsert() {
		encodePassword()
		estadoLogico = 1
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService.encodePassword(password)
	}

    String toString(){
        "$nombre ${segundoNombre?:''} ${apellidoPaterno?:''} ${apellidoMaterno?:''}"
    }
}

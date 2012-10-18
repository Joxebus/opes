package opes.login

class SolicitudCuentaService {

    static transactional = false

	def getPaginaUsuarios(inicioPagina, tamanioPagina) {
		def max = Math.min(inicioPagina ? Integer.valueOf(inicioPagina): 10, 10)
		def offset = Math.min(tamanioPagina ? Integer.valueOf(tamanioPagina) : 0,10000)
		def usuariosList = UsuarioSistema.findAll(max:max, offset:offset)
		[usuariosList:usuariosList, usuariosTotal:usuariosList.size()]
	}

	def getPaginaUsuariosPorNombre(inicioPagina, tamanioPagina, nombre) {
		def max = Math.min(inicioPagina ? Integer.valueOf(inicioPagina): 10, 10)
		def offset = Math.min(tamanioPagina ? Integer.valueOf(tamanioPagina) : 0,10000)
		def usuariosList = UsuarioSistema.findAllByNombre(nombre, [max, offset])
		[usuariosList:usuariosList, usuariosTotal:usuariosList.size()]
	}

	def getPaginaUsuariosPorSegundoNombre(inicioPagina, tamanioPagina, segundoNombre) {
		def max = Math.min(inicioPagina ? Integer.valueOf(inicioPagina): 10, 10)
		def offset = Math.min(tamanioPagina ? Integer.valueOf(tamanioPagina) : 0,10000)
		def usuariosList = UsuarioSistema.findAllBySegundoNombre(segundoNombre, [max, offset])
		[usuariosList:usuariosList, usuariosTotal:usuariosList.size()]
	}

	def getPaginaUsuariosPorApellidoPaterno(inicioPagina, tamanioPagina, apellidoPaterno) {
		def max = Math.min(inicioPagina ? Integer.valueOf(inicioPagina): 10, 10)
		def offset = Math.min(tamanioPagina ? Integer.valueOf(tamanioPagina) : 0,10000)
		def usuariosList = UsuarioSistema.findAllByApellidoPaterno(apellidoPaterno, [max, offset])
		[usuariosList:usuariosList, usuariosTotal:usuariosList.size()]
	}

	def getPaginaUsuariosPorPuesto(inicioPagina, tamanioPagina, puesto) {
		def max = Math.min(inicioPagina ? Integer.valueOf(inicioPagina): 10, 10)
		def offset = Math.min(tamanioPagina ? Integer.valueOf(tamanioPagina) : 0,10000)
		def usuariosList = UsuarioSistema.findAllByPuesto(puesto, [max, offset])
		[usuariosList:usuariosList, usuariosTotal:usuariosList.size()]
	}

	def getPaginaUsuariosPorUsername(inicioPagina, tamanioPagina, username) {
		def max = Math.min(inicioPagina ? Integer.valueOf(inicioPagina): 10, 10)
		def offset = Math.min(tamanioPagina ? Integer.valueOf(tamanioPagina) : 0,10000)
		def usuariosList = UsuarioSistema.findAllByUsername(username, [max, offset])
		[usuariosList:usuariosList, usuariosTotal:usuariosList.size()]
	}

	def getPaginaUsuariosPorTelefono(inicioPagina, tamanioPagina, telefono) {
		def max = Math.min(inicioPagina ? Integer.valueOf(inicioPagina): 10, 10)
		def offset = Math.min(tamanioPagina ? Integer.valueOf(tamanioPagina) : 0,10000)
		def usuariosList = UsuarioSistema.findAllByTelefono(telefono, [max, offset])
		[usuariosList:usuariosList, usuariosTotal:usuariosList.size()]
	}
}

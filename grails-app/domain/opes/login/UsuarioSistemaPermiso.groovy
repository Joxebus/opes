package opes.login

import org.apache.commons.lang.builder.HashCodeBuilder

class UsuarioSistemaPermiso implements Serializable {

    UsuarioSistema usuarioSistema
	Permiso permiso

	boolean equals(other) {
		if (!(other instanceof UsuarioSistemaPermiso)) {
			return false
		}

		other?.id == usuarioSistema?.id
	}

	int hashCode() {
		def builder = new HashCodeBuilder()
		if (usuarioSistema) builder.append(usuarioSistema.id)
		builder.toHashCode()
	}

	static UsuarioSistemaPermiso get(long usuarioSistemaId, long permisoId) {
		find ('from UsuarioSistemaPermiso where usuarioSistema.id=:usuarioSistemaId and permiso.id=:permisoId',
			[usuarioSistemaId: usuarioSistemaId, permisoId: permisoId])
	}

	static UsuarioSistemaPermiso getByID(long usuarioSistemaId) {
		find ('from UsuarioSistemaPermiso where usuarioSistema.id=:usuarioSistemaId',
			[usuarioSistemaId: usuarioSistemaId])
	}

	static List<UsuarioSistemaPermiso> findAllByEstadoLog(int max, int offset, boolean estadoLog) {
			findAll("from UsuarioSistemaPermiso where usuarioSistema.enabled=?",
				[estadoLog],[max:max, offset:offset])
	}

	static UsuarioSistemaPermiso create(UsuarioSistema usuarioSistema, Permiso permiso, boolean flush = false) {
		new UsuarioSistemaPermiso(usuarioSistema: usuarioSistema, permiso: permiso).save(flush: flush, insert: true)
	}

	static boolean remove(UsuarioSistema usuarioSistema, Permiso permiso, boolean flush = false) {
		UsuarioSistemaPermiso instance = UsuarioSistemaPermiso.findByUsuarioSistemaAndPermiso(usuarioSistema, permiso)
		if (!instance) {
			return false
		}

		instance.delete(flush: flush)
		true
	}

	static void removeAll(UsuarioSistema usuarioSistema) {
		executeUpdate 'DELETE FROM UsuarioSistemaPermiso WHERE usuarioSistema=:usuarioSistema', [usuarioSistema: usuarioSistema]
	}

	static void removeAll(Permiso permiso) {
		executeUpdate 'DELETE FROM UsuarioSistemaPermiso WHERE permiso=:permiso', [permiso: permiso]
	}

	static mapping = {
		id composite: ['permiso', 'usuarioSistema']
		version false
	}
}

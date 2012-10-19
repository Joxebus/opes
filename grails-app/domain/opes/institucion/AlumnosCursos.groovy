package opes.institucion

class AlumnosCursos {

    Alumno alumno
    Curso curso

    static void unlink(alumno, curso) {
        def alumnosCursos = AlumnosCursos.findByAlumnoAndCurso(alumno, curso)
        if (alumnosCursos) {
            alumnosCursos.delete()
        }
    }
}

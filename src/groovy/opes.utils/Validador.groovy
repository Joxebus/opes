package opes.utils

import java.util.regex.Matcher
import java.util.regex.Pattern

class Validador {

	String isValidaContrasenia(String contrasenia) {
		String mensajeError = null
		if (contrasenia.size() >= 8) {
			Pattern patron = Pattern.compile("(.*\\d){2}");
			Matcher encaja = patron.matcher(contrasenia);
			if (encaja.find()) {
				patron = Pattern.compile("(.*[A-Z]){1}");
				encaja = patron.matcher(contrasenia);
				boolean isMatch = encaja.find()
				if (!isMatch) {
					mensajeError = "La contrase�a debe incluir al menos 1 letra may�scula"
				}
			} else {
				mensajeError = "La contrase�a debe incluir al menos 2 n�meros"
			}
		} else {
			mensajeError = "La contrase�a debe tener un m�nimo de 8 caracteres"
		}
		return mensajeError
	}

}

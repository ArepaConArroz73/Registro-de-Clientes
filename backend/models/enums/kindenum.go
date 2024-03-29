/*
 * Generado por gqlgenerate.
 *
 * Este archivo puede contener errores, de ser asi, coloca el issue en el repositorio de github
 * https://github.com/pjmd89/gogql
 *
 * Estos arvhivos corren riesgo de sobreescritura, por ese motivo gqlgnerate crea una carpeta llamada generate, asi que,
 * copia todas las carpetas que estan dentro de la carpeta generate y pegalas en la carpeta raiz de tu proyecto.
 *
 * gqlgenerate no creara archivos en la carpeta raiz de tu modulo porque puedes sufrir perdida de informacion.
 */
package enums

type KindEnum string

const (
	KINDENUM_STRING   KindEnum = "String"
	KINDENUM_INT               = "Int"
	KINDENUM_FLOAT             = "Float"
	KINDENUM_BOOLEAN           = "Boolean"
	KINDENUM_ID                = "ID"
	KINDENUM_DATE              = "Date"
	KINDENUM_DATETIME          = "DateTime"
	KINDENUM_AGE               = "Age"
)

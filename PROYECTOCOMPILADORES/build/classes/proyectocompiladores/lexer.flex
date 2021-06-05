package proyectocompiladores;
import static proyectocompiladores.Tokens.*;
%%
%class Lexer
%type Tokens
Num = [0-9]+
Letras = ([a-zA-Z]+|[a-zA-Z]+[?|&]+[a-zA-Z]+)([ ]+[a-zA-Z]+[?|&]?|[ ]+[a-zA-Z]+[?|&|<|>]+[a-zA-Z]+)*
Correo = [_a-z0-9-]+(.[_a-z0-9-]+)*@[a-z0-9-]+(.[a-z0-9-]+)*(.[a-z]{2,4})

espacio=[ ,\t,\r,\n]+



%{
    public String lexeme;
    Info_code c = new Info_code();
%}
%%
{espacio} {/*Ignore*/}
( "//"(.)* ) {/*Ignore*/}

<YYINITIAL>  "INI_HTML"  {c.linea=yyline;lexeme=yytext(); return Apertura_Documento;}
<YYINITIAL>  "FIN_HTML" {c.linea=yyline;lexeme=yytext(); return Cierre_Documento;}
<YYINITIAL> "ENCABEZADO_INI" {c.linea=yyline;lexeme=yytext(); return Apertura_Encabezado;}
<YYINITIAL> "ENCABEZADO_FIN"  {c.linea=yyline;lexeme=yytext(); return Cierre_Encabezado;}
<YYINITIAL> "CUERPO_INI" {c.linea=yyline;lexeme=yytext(); return Apertura_Cuerpo;}
<YYINITIAL> "CUERPO_FIN" {c.linea=yyline;lexeme=yytext(); return Fin_Cuerpo;}
<YYINITIAL> "TIT" {c.linea=yyline;lexeme=yytext(); return Titulo;}
<YYINITIAL> {Letras} {c.linea=yyline;lexeme=yytext(); return Cadena;}
<YYINITIAL> {Correo} {c.linea=yyline;lexeme=yytext(); return Email;}
<YYINITIAL> "=" {c.linea=yyline;lexeme=yytext(); return Igual;}
<YYINITIAL> "+" {c.linea=yyline;lexeme=yytext(); return Suma;}
<YYINITIAL> "-" {c.linea=yyline;lexeme=yytext(); return Resta;}
<YYINITIAL> "TABLA_IN BORDE = 1" {c.linea=yyline;lexeme=yytext(); return Apertura_Tabla;}
<YYINITIAL> "FILA" {c.linea=yyline;lexeme=yytext(); return Apertura_Fila;}
<YYINITIAL> "COLUMNA =" {c.linea=yyline;lexeme=yytext(); return Apertura_Columna;}
<YYINITIAL> "TABLA_FIN" {c.linea=yyline;lexeme=yytext(); return Cierre_Tabla;}
<YYINITIAL> "IMAGEN_IN" {c.linea=yyline;lexeme=yytext(); return Apertura_Imagen;}
<YYINITIAL> "IMAGEN_FIN" {c.linea=yyline;lexeme=yytext(); return Cierre_Imagen;}
<YYINITIAL> "(" {c.linea=yyline;lexeme=yytext(); return Parentesis_Apertura;}
<YYINITIAL> ")" {c.linea=yyline;lexeme=yytext(); return Parentesis_Cierre;}
<YYINITIAL> "*" {c.linea=yyline;lexeme=yytext(); return Multiplicar;}
<YYINITIAL> "." {c.linea=yyline;lexeme=yytext(); return Punto;}
<YYINITIAL> {Num} {c.linea=yyline;lexeme=yytext(); return Numero;}
<YYINITIAL> "LISTA_IN" {c.linea=yyline;lexeme=yytext(); return Lista_Entrada;}
<YYINITIAL> "LISTA_FIN" {c.linea=yyline;lexeme=yytext(); return Lista_Fin;}
<YYINITIAL> "IMPRIMIR =" {c.linea=yyline;lexeme=yytext(); return Imprimir;}
<YYINITIAL> ";" {c.linea=yyline;lexeme=yytext(); return Punto_y_Coma;}
<YYINITIAL> "ENLACE =" {c.linea=yyline;lexeme=yytext(); return Link;}
<YYINITIAL> "/" {c.linea=yyline;lexeme=yytext(); return Diagonal;}
<YYINITIAL> "\." ("jpg"|"png") {c.linea=yyline;lexeme=yytext(); return Formato_Imagen;}
<YYINITIAL> "\"" {c.linea=yyline;lexeme=yytext(); return Comillas;}
<YYINITIAL> ":" {c.linea=yyline;lexeme=yytext(); return Dos_Puntos;}
<YYINITIAL> "FILA_FIN" {c.linea=yyline;lexeme=yytext(); return Fin_Fila;}
<YYINITIAL> "NEGRITA =" {c.linea=yyline;lexeme=yytext(); return Negrilla;}
<YYINITIAL> "PRUEBA =" {c.linea=yyline;lexeme=yytext(); return Parrafo;}
<YYINITIAL> "A =" {c.linea=yyline;lexeme=yytext(); return Variable;}
<YYINITIAL> " , " {c.linea=yyline;lexeme=yytext(); return Seperador;}
<YYINITIAL> " NOMBRE = " {c.linea=yyline;lexeme=yytext(); return Nombre;}



/* Error de analisis */
 . {c.linea=yyline; return ERROR;}

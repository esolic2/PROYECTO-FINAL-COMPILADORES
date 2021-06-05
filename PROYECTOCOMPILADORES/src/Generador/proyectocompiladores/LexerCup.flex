package proyectocompiladores;
import java_cup.runtime.Symbol;
%%
%class LexerCup
%type java_cup.runtime.Symbol
%cup
%full
%line
%char
Num = [0-9]+
Letras = ([a-zA-Z]+|[a-zA-Z]+[?|&]+[a-zA-Z]+)([ ]+[a-zA-Z]+[?|&]?|[ ]+[a-zA-Z]+[?|&|<|>]+[a-zA-Z]+)*
Correo = [_a-z0-9-]+(.[_a-z0-9-]+)*@[a-z0-9-]+(.[a-z0-9-]+)*(.[a-z]{2,4})
espacio=[ ,\t,\r,\n]+


%{
   
 private Symbol Symbol(int type, Object value){
        return new Symbol(type, yyline, yycolumn, value);
    }
         private Symbol symbol(int type){
         return new Symbol(type, yyline, yycolumn);
    }
    Info_code c = new Info_code();
%}
%%
{espacio} {/*Ignore*/}
( "//"(.)* ) {/*Ignore*/}

<YYINITIAL> "INI_HTML"  {return new Symbol(Simbolo.Apertura_Documento, yychar, yyline, yytext());}
<YYINITIAL> "FIN_HTML" {return new Symbol(Simbolo.Cierre_Documento, yychar, yyline, yytext());} 
<YYINITIAL> "ENCABEZADO_INI" {return new Symbol(Simbolo.Apertura_Encabezado, yychar, yyline, yytext());} 
<YYINITIAL> "ENCABEZADO_FIN"  {return new Symbol(Simbolo.Cierre_Encabezado, yychar, yyline,yytext());}
<YYINITIAL> "CUERPO_INI" { return new Symbol(Simbolo.Apertura_Cuerpo,yychar, yyline,yytext());}
<YYINITIAL> "CUERPO_FIN" {return new Symbol (Simbolo.Fin_Cuerpo,yychar, yyline,yytext());}
<YYINITIAL> "TIT" {return new Symbol(Simbolo.Titulo,yychar, yyline,yytext());}
<YYINITIAL> {Letras} {return new Symbol(Simbolo.Cadena,yychar, yyline,yytext());}
<YYINITIAL> {Correo} {return new Symbol(Simbolo.Email,yychar, yyline,yytext());}
<YYINITIAL> "=" {return new Symbol(Simbolo.Igual,yychar, yyline,yytext());}
<YYINITIAL> "+" {return new Symbol(Simbolo.Suma,yychar, yyline,yytext());}
<YYINITIAL> "-" {return new Symbol(Simbolo.Resta,yychar, yyline,yytext());}
<YYINITIAL> "TABLA_IN BORDE = 1" {return new Symbol(Simbolo.Apertura_Tabla,yychar, yyline,yytext());}
<YYINITIAL> "FILA" {return new Symbol(Simbolo.Apertura_Fila,yychar, yyline,yytext());}
<YYINITIAL> "COLUMNA =" {return new Symbol(Simbolo.Apertura_Columna,yychar, yyline,yytext());}
<YYINITIAL> "TABLA_FIN" {return new Symbol(Simbolo.Cierre_Tabla,yychar, yyline,yytext());}
<YYINITIAL> "IMAGEN_IN" {return new Symbol(Simbolo.Apertura_Imagen,yychar, yyline,yytext());}
<YYINITIAL> "IMAGEN_FIN" {return new Symbol(Simbolo.Cierre_Imagen,yychar, yyline,yytext());}
<YYINITIAL> "(" {return new Symbol(Simbolo.Parentesis_Apertura,yychar, yyline,yytext());}
<YYINITIAL> ")" {return new Symbol(Simbolo.Parentesis_Cierre,yychar, yyline,yytext());}
<YYINITIAL> "*" {return new Symbol(Simbolo.Multiplicar,yychar, yyline,yytext());}
<YYINITIAL> "." {return new Symbol(Simbolo.Punto,yychar, yyline,yytext());}
<YYINITIAL> {Num} {return new Symbol(Simbolo.Numero,yychar, yyline,yytext());}
<YYINITIAL> "LISTA_IN" {return new Symbol(Simbolo.Lista_Entrada,yychar, yyline,yytext());}
<YYINITIAL> "LISTA_FIN" {return new Symbol(Simbolo.Lista_Fin,yychar, yyline,yytext());}
<YYINITIAL> "IMPRIMIR =" {return new Symbol(Simbolo.Imprimir,yychar, yyline,yytext());}
<YYINITIAL> ";" {return new Symbol(Simbolo.Punto_y_Coma,yychar, yyline,yytext());}
<YYINITIAL> "ENLACE =" {return new Symbol(Simbolo.Link,yychar, yyline,yytext());}
<YYINITIAL> "/" {return new Symbol(Simbolo.Diagonal,yychar, yyline,yytext());}
<YYINITIAL> "\." ("jpg"|"png") {return new Symbol(Simbolo.Formato_Imagen,yychar, yyline,yytext());}
<YYINITIAL> "\"" {return new Symbol(Simbolo.Comillas,yychar, yyline,yytext());}
<YYINITIAL> ":" {return new Symbol(Simbolo.Dos_Puntos,yychar, yyline,yytext());}
<YYINITIAL> "FILA_FIN" {return new Symbol(Simbolo.Fin_Fila,yychar, yyline,yytext());}
<YYINITIAL> "NEGRITA =" {return new Symbol(Simbolo.Negrilla,yychar, yyline,yytext());}
<YYINITIAL> "PRUEBA =" {return new Symbol(Simbolo.Parrafo,yychar, yyline,yytext());}
<YYINITIAL> "A =" {return new Symbol(Simbolo.Variable,yychar, yyline,yytext());}
<YYINITIAL> " , " {return new Symbol(Simbolo.Separador,yychar, yyline,yytext());}
<YYINITIAL> "NOMBRE =" {return new Symbol(Simbolo.Nombre,yychar, yyline,yytext());}

/* Error de analisis */
 . {return new Symbol(Simbolo.ERROR, yychar, yyline, yytext());}



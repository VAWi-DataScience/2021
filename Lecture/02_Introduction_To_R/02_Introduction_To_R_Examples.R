## Working directory, Pfade und Projekte in Rstudio
# R speichert Daten relativ zum aktuellen working directory, d.h. dem Ordner in dem gearbeitet wird
# In welchem Ordner befinden wir uns gerade?
getwd()

# Um das working directory zu ändern: setwd == set working directory
# Dabei \\ oder / in Windows und / bei Mac/Linux nutzen
# Dabei bietet R tab completion und tilde expansion für filepaths an
setwd("Pfad hier einfügen")

# Arbeiten Sie strukturiert!
# /R -- alle R-Skripte
# /data -- die Daten auf denen gerechnet wird
# /doc -- Dokumentation
# /man -- Dokumentation im R Markdown Format
# /output -- plots, exportierte Daten, Modelle, etc.

## Einfache Berechnungen in R
# Tipp: Per strg + enter führen Sie die Zeile Code aus in der sich der Cursor befindet. Funkioniert auch mit mehreren Zeilen.
# Tipp: Per strg + d können Sie die aktuelle Zeile Code löschen

# Arithmetische Operationen: +,-,*,/,^,	%%, ...
1 + 2
3 - 5
18 * 9
165 / 10

# Logische Operationen: ==,!=,<,>,<=,>=,&,|,!,%in%, ...
1 == 1
TRUE & TRUE
TRUE & FALSE
TRUE | FALSE
FALSE | FALSE
6 <= 17

# Mathematische Funktionen: sum, mean, var, sd, log, ...
sum(c(1,2))
mean(c(1,2,3,4,5))
var(c(1,2,3,4,5))
log(5)



## Objekte
# Alles was in R gespeichert wird ist ein Objekt. Es gibt verschiedene Arten an Objekten.

# Grundlegende Datentypen: numeric, character, factor, logical, NA
is.numeric(3)
is.character(3)

# Vektoren und Matrizen: eine, zwei oder mehrdimensionale Sammlungen der grundlegenden Datentypen
# Objekte erstellen: In R können Sie entweder "<-" oder "=" als Zuweisungsoperator nutzen, wobei "<-" typisch für R ist
# R ist case sensitive, d.h. objectName und ObjectName sind zwei verschiedene Objekte
# Vektoren erstellen durch:
# Die Kombination einzelner Werte
test_vector_1 <- c(1,2,3,4,5,6)

# Mithilfe der seq(<from>,<to>,<step>) Funktion
seq(1,20,1)

# Abkürzbar durch
1:20

# Mithilfe er rep(<object>,<number>) Funktion
test_string <- "test"
rep(test_string, 10)

# Vektoren: werden mithilfe der c() Funktion erstellt.
# Tipp: mithilfe von '?"Funktionsname"' (oder '??"Funktionsname"' für help files) in der Konsole wird Ihnen ein Hilfstext angezeigt. Bspw. ?c
# In R können Sie entweder "<-" oder "=" als Zuweisungsoperator nutzen
test_vector_2 <- c(7,8,9,10,11,12)
test_vector_2
is.vector(test_vector_2)

# Vektorarithmetik
# Alle mathemtischen Operatoren und viele Funktionen funktionieren mit Vektoren
# Vektor/ Matrixkalkulationen sind viel schneller, als über Vektoren/Matrizen per foor loops zu iterieren
# Mithilfe von length() erhalten Sie die Länge, d.h. die Anzahl der Elemente, eines Vektors
length(test_vector_1)

# Elementweise Berechnungen
test_vector_1 * 2
test_vector_1 + 2
test_vector_1 * 2 + 2
log(test_vector_1)

# Matrizen: werden mithilfe von matrix(data, nrow=<number of rows>, ncol= <number of columns>) erstellt
test_matrix <- matrix(c(1,3,5,2,4,6), nrow=3, ncol=2)
test_matrix


## Vektor -, und Matrixsubsetting/slicing mit []
test_vector_3 <- rep(5:1, times = 5)

# Mithilfe der [] kann auf einzelne Elemente innerhalb des Vektors direkt zugegriffen werden
test_vector_3

# 5. Element auswählen
test_vector_3[5]

# Element 6:10 auswählen
test_vector_3[6:10]

# Alle Element ausser 6:10 auswählen
test_vector_3[-(6:10)]
length(test_vector_3[-(6:10)])

# Alle Elemente die den Wert 5 haben auswählen
# Dabei ist test_vector_3==5 ein boolscher vector der TRUE ist, wenn der Wert 5 ist
test_vector_3[test_vector_3==5]

# Matrixsubsetting
test_matrix <- matrix(c(1,3,5,2,4,6), nrow=3, ncol=2)
test_matrix

# Zeile 1, Spalte 1
test_matrix[1,1]

# Zeile 3, alle Spalten
test_matrix[3,]



## Listen
# Vektoren und Matrizen können nur Elemente eines Typs enthalten (numeric, character, ...)
# Listen können verschiedene Typen enthalten
# Indexing auf Listen funktioniert mit [[...]]
test_list <- list("VAWI","Data Science", 1.0)
test_list

# 1. Element auswählen
test_list[[1]]



## DataFrames
# Ein DataFrame ist eine Liste von Vektoren derselben Länge
string_vector <- c("this", "is", "a", "test","string","vector")
test_data_frame <- data.frame(test_vector_1, string_vector) 
test_data_frame

# Einzelne Werte können genauso wie bei einer Matrix mit ["Zeile","Spalte"] erreicht werden
test_data_frame[2,]
test_data_frame[,2]
test_data_frame[2,2]

# Spalten bzw. Attribute können zusätzlich mit dem "$" Operator addressiert werden
test_data_frame$string_vector



## Daten laden
# Daten können je nach vorliegendem Format in R geladen werden

# Comma separated files
iris_data <- read.csv("https://raw.githubusercontent.com/VAWi-DataScience/2021/main/Lecture/02_Introduction_To_R/iris.csv")

# Semicolon separated files
# read.csv2()

# Falls man sehr viel selbst parametrisieren will
# read.table()
# Tipp: ?read.table()
# Tipp: Daten grundsätzlich ins UTF-8 Format einlesen, bzw. nach UTF-8 konvertieren



## Datentypen bei DataFrames
# Daten haben nach dem Import meist den Datentyp "character", d.h. string
# Um den Datentyp eines Datensatzes zu überprüfen, kann man die str(<data>) Funktion nutzen
str(iris_data)

# Zusätzlich kann man auch den $-Operator nutzen, wenn man an nur einem Attribut interessiert ist
str(iris_data$SepalLengthCm)

# Die wichtigsten Datentypen und Funktionen zur Typkonversion:
# Boolsche Werte: logical(), is.logical(), as.logical(), Example: TRUE, FALSE
# Integers und Floats: numeric(), is.numeric(), as.numeric(), Example: 5, 5.3
# Strings und Buchstaben: character(), is.character(), as.character(), Example: "Data", "Science", "1.0"
# Kategorien: factor(), is.factor(), as.factor(), Example: (A,B,C,D)



## Packages/Libraries
# R enthält von Haus aus zwar schon viele Funktionen in seinem "base" package, aber über die Jahre haben sich einige packages zum quasi-Standard entwickelt
# Beispiel: dplyr, ggplot2
# Packages werden in R grundsätzlich mit install.packages("package name") installiert
# Das Installieren der packages ist natürlich nur 1x notwendig
# install.packages("dplyr")
# install.packages("ggplot2")

# Nach dem Herunterladen eines packages, muss es noch in die aktive R session geladen werden
library(dplyr)
library(ggplot2)



## For, while und if
# Wie in den meisten Programmiersprachen, kann man auch in R Schleifen und Kontrollstrukturen nutzen
# Vorsicht: R ist eine eher funktionale Programmiersprache. Die meisten Standardprobleme im data science Bereich können mithilfe von Standardfunktionen gelöst werden, die bereits existieren und bug frei sind.
# Beispiel: wie oft kommt SepalLengthCm == 5 im iris Datensatz vor?
# Lösung per for loop
count_5 = 0
for(i in iris_data$SepalLengthCm) {
  if(i == 5) {
    count_5 = count_5 + 1
  }
}
count_5

# Stattdessen empfiehlt es sich die which() Funktion in Verbindung mit length() zu nutzen
# Tipp: ?which
index_count_5 = which(iris_data$SepalLengthCm == 5)
count_5 = length(index_count_5)
count_5

# Oder in einer Zeile
length(which(iris_data$SepalLengthCm==5))

# Recherchieren Sie deshalb stets zuerst Ihr Problem auf Ihrer Lieblingssuchmaschine, bevor Sie anfangen selbst Code zu schreiben!



## Data Science Basics
# Im Folgenden werden die grundlegenden Funktionen vorgestellt, die fast immer in der Praxis genutzt werden, um sich einen ersten Eindruck über einen Datensatz zu verschaffen.
# class(): Gibt die Klasse eines Objekts aus
class(test_vector_3)
class(iris_data)

# names(): Gibt die Namen der Spalten/Attribute des Datensatzes als Vektor zurück.
names(iris_data)

# Kann auch genutzt werden um Spalten umzubennen.
iris2 = iris_data
names(iris2) = c(1,2,3,4,5,6)
str(iris2)

# str(): Zeigt neben den Datentypen der Attribute eines Datensatzes auch die Anzahl der observations, d.h. Zeilen und variables, d.h. Attribute.
str(iris_data)

# glimpse(): Im Prinzip eine etwas leichter lesbare Variante des str()-Befehls. Nur nutzbar wenn man das "dplyr" package geladen hat.
glimpse(iris_data)

# nrow(): Gibt die Anzahl der Zeilen/observations/instances eines Datensatzes zurück
nrow(iris_data)

# ncol(): Gibt die Anzahl der Spalten/Attribute/variables eines Datensatzes zurück
ncol(iris_data)

# dim(): Gibt die Dimension einer Matrix bzw. eines DataFrames, d.h. die Anzahl der Zeilen und Spalten, zurück.
dim(iris_data)

# head(): Gibt die ersten n Zeilen eines Datensatzes zurück. Per default werden die ersten 6 Zeilen zurückgegeben.
# head() wird sehr häufig benutzt um zu überprüfen, ob die Daten richtig geladen wurden, da dies oft schon anhand der ersten paar Zeilen erkennbar ist.
head(iris_data)
head(iris_data, 10)

# tail(): Gibt analog zu head() die letzten n Zeilen eines Datensatzes zurück.
tail(iris_data)
tail(iris_data, 10)

# summary(): Gibt je nach Datentyp einen detaillierten Überblick über die Verteilung eines Attributes zurück.
summary(iris_data)




















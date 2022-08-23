#!/bin/bash


#0 START

#6N oznacza ze chcemy dokaldnosc mikrosekundowa
#startTime=$(date +'%S.%6N')

if [ $# == 0 ]
then
echo "brak argumentow, sprobuj: $0 <KAT_BAZOWY> <nazwa_pliku_danych1> <nazwa_pliku_danych2> <nazwa_pliku_danychN>" 1>&2
exit 1
elif [ $# == 1 ]
then
echo "podano tylko jeden argument, sprobuj: $0 <KAT_BAZOWY> <nazwa_pliku_danych1> <nazwa_pliku_danych2> <nazwa_pliku_danychN>" 1>&2
exit 2

fi

#1 START

#sprawdzenie czy istnieje katalog o nazwie podanje jako pierwszy argument
# jezeli nie, program utworyz taki katalog
if [ ! -d $1 ]
then
mkdir "./$1"
fi

#iterujemy po wszystkich argumetach
for plik in "$@"
do
echo $plik

#sprawdzamy czy aktyalny argument jest plikiem
if [[ -f $plik ]]
then


fi



done


#1 STOP


#2 START

#trzeba przeiterowac po wszystkich argimentach zaczynajac od 2, zamiiast < "$2" po done trzeba przekazac te wszyskie argumnty
for i in "${@:2}"
do

while read line
do
echo $line | cut -d "," -f 1
mkdir "./$(echo $line | cut -d "," -f 1)"

done < "$i"

done

#2 STOP

#3 START

#trzeba przemelsec jak ogarnac rok i miesiac

#utworzenie roboczego pliku csv
touch "ROK.MIESIAC.csv"

while read doError
do

smdb=$(echo $doErorr | cut -d "," -f 7)

echo $smdb
#if [ $((echo $doError | cut -d "," -f 7)) -eq 8 ]
#then
#echo $doError
 
#fi

done < "$2"




#stopTime=$(date +'%S.%6N')
#czas=$(echo "scale=0; ($stopTime-$startTime)*1000000/1" | bc)

#miktosekunda ma dokalosc 6 miejsc po przecinku
#-n po echo sprawia ze nie ma znaku konca lini, i nastepne echo bedzie w tej samej linijce
#najpierw wyciagamy sam pid procesu o nazwie poprawka2.sh, pozniej wyciagamy wszystkie pidy i ppidy i grepujemy to z pidem ktorego szukamy

#do pliku trzeba zapisac: PID,PPID,CZAS,WIERSZ_POLECENIA
pid=$(ps -a -o pid | grep $(ps -a | grep poprawka2.sh | cut -d " " -f 1 | head -n 1) | head -n 1)

#ta zmienna przechowuje pid i ppid
pidIppid=$(ps -a -o pid,ppid | grep $(ps -a | grep poprawka2.sh | cut -d " " -f 1 | head -n 1) | head -n 1)

# z powyzszej zmienne wyciagam druga kolumne ktora jest ppid
ppid=$(echo $pidIppid | cut -d " " -f 2)


echo -n "$pid,"  >> out.log
echo -n "$ppid," >> out.log

#trzeba jeszcze dodac czas ktory u mnie na kompie niestety nie dziala
#echo -n "$czas," >> out.log
# $@ to komenda wpisana do wiersza polecen podczas odpalana skryptu
echo $@ >> out.log

#0 STOP






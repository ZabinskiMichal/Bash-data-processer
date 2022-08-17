#!/bin/bash

#0 START

#tutaj trzeba zamiast %s dac %N ale niestety u mnie na kompie to nie działa
startTime=`date +%s`

if [ $# == 0 ]
then
echo "brak argumentow, sprobuj: $0 <KAT_BAZOWY> <nazwa_pliku_danych1> <nazwa_pliku_danych2> <nazwa_pliku_danychN>" 1>&2
exit 1
elif [ $# == 1 ]
then
echo "podano tylko jeden argument, sprobuj: $0 <KAT_BAZOWY> <nazwa_pliku_danych1> <nazwa_pliku_danych2> <nazwa_pliku_danychN>" 1>&2
exit 2
else

fi

echo $()


stopTime=`date +%s`
#miktosekunda ma dokalosc 6 miejsc po przecinku
#-n po echo sprawia ze nie ma znaku konca lini, i nastepne echo bedzie w tej samej linijce
#najpierw wyciagamy sam pid procesu o nazwie poprawka2.sh, pozniej wyciagamy wszystkie pidy i ppidy i grepujemy to z pidem ktorego szukamy
echo -n $(ps -a -o pid,ppid | grep $(ps -a | grep poprawka2.sh | cut -d " " -f 1 | head -n 1) | head -n 1) >> out.log
echo -n " " >> out.log
#bc to basic kalkulator, pozwala na wykonywanie obliczen z przecinkiem
echo "scale=2;$stopTime-$startTime" | bc >> out.log

#trzeba jeszcze dodac czwart elemtn czyli wiersz poeleenia uruchumienia ale nwm o co z tym chodzi




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

#sprawdzamy czy aktyalny argument jest plikiem
if [[ -f $plik ]]
then

while read line
do


#polecenie tr z przelacznikie -d pozwala pozbyc sie znaku cudzyslowia
rok=$(echo $line | cut -d "," -f 3 | tr -d '"')
miesiac=$(echo $line | cut -d "," -f 4 | tr -d '"')

if [ ! -d "$1/$rok/$miesiac" ]
then

mkdir -p "$1/$rok/$miesiac"

fi



done < "$plik"


#-m  uprawniena do pliku
#mkdir -m 750 -p "$1/$rok/$miesiac"
#fi

fi

done

#1 STOP

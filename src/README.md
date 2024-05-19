# Coitu Sebastian-Teodor 314CA

Pentru această temă am implementat task-urile 1, 3 și 4.

- Task-ul 1:
        Pentru verificarea permisiunilor pe care le are o furnică, am retinut în registrul
    "ecx" cei mai semnificativi 8 biți, reprezentând id-ul furnicii. Apoi, in registrul "eax"
    am reținut cei mai puțin semnificativi 24 biți, reprezentând camerele pe care vrea să le
    acceseze furnica. În registrul "edx" am reținut permisiunile furnicii, apoi am realizat o
    comparație între "eax" și "edx" pentru a verifica dacă furnica are permisiunea de a accesa
    camerele dorite. Dacă furnica are permisiunea, se va seta registrul "ebx" pe 1, altfel pe 0.

- Task-ul 3:
        Atât pentru criptare, cât și pentru decriptare, am inițializat la început registrul "eax",
    care reține numărul de runde și registrul "ebx", care reține indexul byte-ului curent (în
    cazul criptarii indexul pornește de la 0, iar în cazul decriptării de la 7). În continuare am 
    adunat byte-ul curent din cuvânt ("cl") cu cel din cheie, apoi am realizat transformarea 
    S-box. În registrul "edx" am reținut indexul byte-ului următor (am folosit modulo 7 deoarece
    am ales indexarea de la 0 la 7). Partea următoare este diferită, la criptare adunând byte-ul 
    următor la cel curent și rotind spre stânga cu 1, iar la decriptare am rotit spre dreapta 
    byte-ul următor cu 1 din care am scăzut byte-ul curent. La final, am actualizat byte-ul 
    următor din cuvant cu rezultatul obținut, apoi am incrementat/decrementat indexul byte-ului 
    curent și am decrementat numărul de runde.

- Task-ul 4:
        Am început prin a decrementa registrele "ecx" și "edx" pentru a putea folosi indexarea
    de la 0 pentru liniile și coloanele matricei și am salvat rezultatele în "no_lines" și
    "no_columns". Înainte de prima parcurgere a loop-ului, am inițializat linia și coloana curentă 
    cu 0 și am adaugat registrul "eax" în stack pentru a pastra valoarea inițială a acestuia pana 
    la final. În loop, verificăm daca am ajuns la o margine a matricei și daca da, trecem la 
    "found_exit", unde îl scoatem pe "eax" din stack și atribuim valorile aferente liniei și 
    coloanei curente. În cazul în care nu am ajuns la o margine, setăm valoarea 1 pe poziția 
    curentă din matrice, apoi verificăm pozițiile vecine pentru a vedea în ce direcție putem 
    continua (unde se află 0). Verificările sunt puse în ordinea jos, dreapta, stânga, sus pentru 
    că începând din colțul stânga sus, singurele poziții disponibile sunt doar jos și dreapta. 
    Ordinea a fost aleasă astfel pentru a nu mai adăuga verificări suplimentare pentru marginea 
    matricei. În momentul în care pe o poziție vecină gasim 0, ne întoarcem la începutul loop-ului 
    și realizăm oprațiile descrise mai sus.

Feedback:
        Overall, tema a fost interesantă și m-a ajutat să înțeleg mai bine cum funcționează 
    lucrurile făcute până în acest moment la laboratoare, chiar dacă nu am reușit să implementez 
    task-ul 2. Enunțul a fost destul de clar, însă fiind prima temă în assembly cred că toată
    lumea a avut un început mai dificil.
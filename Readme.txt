Studenti:

Basso Matteo, matricola 807628
Ferri Marco, matricola 807130


-----------------------------------------------

Struttura file e cartelle:

- MPD-BassoFerri-Report.pdf: relazione del progetto
- MPD-BassoFerri-Slides.pdf: presentazione del progetto

- dataset
    - MATCH_JOIN.csv:
        dataset risultante dal join delle tabelle Match e PlayerAttributes del database d'origine, come spiegato nella relazione

- R-scripts: codici R
    - 01_analyze.R: analisi esplorativa del dataset
    - 02_transform.R: manipolazione dei Match, discretizzazione e creazione del dataset per la rete Bayesiana
    - 03_predict.R: creazione rete Bayesiana e valutazione delle performance
    - dataset.csv: dataset utilizzato per la creazione della rete, generato a seguito dell'esecuzione di 02_transform.R
    - bayesian_network.rds: rete bayesiana generata da 03_predict.R e salvata su file, utile per essere utilizzata dalla demo
    - ui_inference.R: script utilizzato dalla demo per eseguire le inferenze richieste dall'utente
    - ui_predict.R: script utilizzato dalla demo per predire il risultato di un Match dati i giocatori, scelti dall'utente
    - mapRow.R: helper per la creazione del dataset, utilizzato da diversi altri script

- app:      contenente il front-end per eseguire una demo delle funzionalità
- server:   contenente il back-end per esporre al front-end le REST API che si interfacciano con R per l'utilizzo della rete Bayesiana

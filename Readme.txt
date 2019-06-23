Studenti:

Basso Matteo, matricola 807628
Ferri Marco, matricola 807130

Struttura file e cartelle:

- report.pdf: relazione del progetto
- dataset
    - database.sqlite: database relazione fornito unitamente al progetto
    - MATCH_JOIN.csv: tabella dei match con tutti gli attributi dei giocatori a seguito del join
- R-scripts: codici R
    - 01_analyze.R: analisi esplorativa del dataset
    - 02_transform.R: manipolazione dei match, discretizzazione, creazione dataset rete bayesiana
    - 03_predict.R: creazione rete bayesiana e valutazione performance
    - dataset.csv: dataset creato a seguito dello step 2
    - bayesian_network.rds: rete bayesiana salvata su file, utile per essere utilizzata dal server
    - ui_inference.R: script utilizzato dal server per fare inferenza date le evidenze
    - ui_predict.R: script utilizzato per predire il risultato di un match dati i giocatori
    - mapRow.R: helper per la creazione del dataset, utilizzato da diversi altri script
- app: frontend utile per la presentazione e demo
- server: web server che si interfaccia con R ed espone le REST API al frontend
    - server.js: server seguibile tramite Node.js

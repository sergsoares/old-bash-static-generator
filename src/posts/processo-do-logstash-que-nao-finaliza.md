---
title: "Processo do Logstash que não finaliza"
slug: "processo-do-logstash-que-nao-finaliza"
date: "2019-03-10"
---

Temos um processo que de tempos em tempos executa o Logstash, algumas vezes o processo pode ficar preso. Para nos auxiliar a finalizar o processo podemos efetuar o seguinte comando.

```
$ jps
1618 Logstash
2974 Jps
```

Com isso teremos qual o processo que está preso e podemos finalizá-lo da seguinte forma.

```
kill 1618
```

Em casos mais extremos:

```
kill -9 1618
```

Afim de facilitar o uso podemos utilizar o seguinte snippet que finaliza o processo Java chamado Logstash:

```
kill $(jps | grep Logstash | awk '{print $1}')
```

Referências:

https://askubuntu.com/questions/227890/kill-java-processes

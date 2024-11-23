# linuxtips-descomplicando-k8s

### giropops-senhas usando imagens chainguard

#### Build e Execução

Primeiramente é necessário um container com redis rodando, para isto, basta executar o seguinte comando:

```
docker run -d --name redis -p 6379:6379 redis
```

Para buildar basta executar o comando:

```bash
docker image build -t giropops-senhas-minimal:1.0 .
```

Depois executar passando os parâmetros:

```bash
docker run -d --name giropops-senhas -p 5000:5000 -e REDIS_HOST=<ip-do-seu-computador> giropops-senhas-minimal:1.0
``` 

Usando seu navegador de preferência basta acessar:

>localhost:5000
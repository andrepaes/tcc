# O presente repositorio é dividido em 3 projetos:
## HttpBenchmark
### Aplicação que executa as requisições em paralelo e mede os resultados
## node_app
### Api desenvolida em node.js que implementa os endpoints de gerar lista de numeros primos e recuperar lista de usuarios
## elixir_app
### Api desenvolida em elixir que implementa os endpoints de gerar lista de numeros primos e recuperar lista de usuarios


# Preparando o ambiente para executar os testes
## Caso queira executar os testes na aplicação elixir, fazer o seguinte:
```
cd elixir_app
docker-compose up
```

## Caso queira executar os testes na aplicação node.js, fazer o seguinte:
```
cd node_app
docker-compose up
```

## Executando os testes:
```
cd http_benchmark
iex -s mix
```
```elixir
> HttpBenchmark.run_benchmark("http://localhost:4000/api/primes?quantity=1000", n, c)
```

```elixir
> HttpBenchmark.run_benchmark("http://localhost:4000/api/users", n, c)
```

n e c são quantidade de vezes que o teste será repetido e quantidade de usuários simultaneos respectivamente.

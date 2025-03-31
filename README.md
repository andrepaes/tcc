# O presente repositorio é dividido em 3 projetos:
## HttpBenchmark
### Aplicação que executa as requisições em paralelo e mede os resultados
## node_app
### Api desenvolida em node.js que implementa os endpoints de gerar lista de numeros primos e recuperar lista de usuarios
## elixir_app
### Api desenvolida em elixir que implementa os endpoints de gerar lista de numeros primos e recuperar lista de usuarios


# Como executar
```
cd http_benchmark
iex -s mix
```
```elixir
> HttpBenchmark.run_benchmark("http://localhost:4000/api/primes?quantity=1000")
```

```elixir
> HttpBenchmark.run_benchmark("http://localhost:4000/api/users")
```

```
```
```
```
```
```



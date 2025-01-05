defmodule HttpBenchmark do
  def run_benchmark(url, quantity_reqs, concurrency) do
    {spent_time, {total_success, total_fail, total_time, all_reqs}} =
      :timer.tc(fn ->
        Enum.reduce(1..quantity_reqs, {0, 0, 0, []}, fn
          _, acc ->
            Task.async_stream(
              1..concurrency,
              fn _ ->
                send_request(:get, url)
              end,
              max_concurrency: concurrency,
              timeout: :infinity
            )
            |> Enum.reduce(acc, fn
              {:ok, {req_time, 200}}, {success, fail, time, all_reqs} ->
                {success + 1, fail, time + req_time, [req_time | all_reqs]}

              {:ok, {req_time, _}}, {success, fail, time, all_reqs} ->
                {success, fail + 1, time + req_time, [req_time | all_reqs]}
            end)
        end)
      end)

    samples = quantity_reqs * concurrency

    mean_time = total_time / samples
    success_rate = total_success / samples
    fail_rate = total_fail / samples

    variance = (Enum.map(all_reqs, &:math.pow(&1 - mean_time, 2)) |> Enum.sum()) / quantity_reqs

    {spent_time, mean_time, success_rate, fail_rate, :math.sqrt(variance)}
  end

  def send_request(:get, url) do
    :timer.tc(fn ->
      %{status: status} =
        Req.get!(url,
          connect_options: [timeout: :infinity],
          pool_timeout: :infinity,
          receive_timeout: :infinity
        )

      status
    end)
  end
end

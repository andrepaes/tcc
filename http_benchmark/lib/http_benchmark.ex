defmodule HttpBenchmark do
  def run_benchmark(url, quantity_reqs, concurrency) do
    {total_success, total_fail, total_time, all_reqs} =
      Task.async_stream(
        1..quantity_reqs,
        fn _ ->
          send_request(:get, url)
        end,
        max_concurrency: concurrency,
        timeout: :infinity
      )
      |> Enum.reduce({0, 0, 0, []}, fn
        {:ok, {req_time, 200}}, {success, fail, time, all_reqs} ->
          {success + 1, fail, time + req_time, [req_time | all_reqs]}

        {:ok, {req_time, _}}, {success, fail, time, all_reqs} ->
          {success, fail + 1, time + req_time, [req_time | all_reqs]}
      end)

    mean_time = total_time / quantity_reqs
    success_rate = total_success / quantity_reqs
    fail_rate = total_fail / quantity_reqs

    variance = Enum.reduce(all_reqs, 0, &(:math.pow(&1 - mean_time, 2) + &2)) / quantity_reqs

    {mean_time, success_rate, fail_rate, :math.sqrt(variance)}
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

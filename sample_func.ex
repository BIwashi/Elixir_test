defmodule SampleFunc do
  def hello(person) do
    IO.puts("Hello, #{person}. My pid is #{inspect(self())}.")

    receive do
      message -> IO.puts("Message is #{message}.")
    end
  end

  def hello2(person) do
    IO.puts("Hello, #{person}. My pid is #{inspect(self())}.")

    receive do
      message ->
        IO.puts("Message is #{message}.")
        # メッセージを受信し、処理が完了したら自分自身を呼び出す
        hello2(person)
    end
  end
end

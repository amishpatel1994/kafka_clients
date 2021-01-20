defmodule ExperimentKafkaEx.GenConsumer do
  use KafkaEx.GenConsumer

  alias KafkaEx.Protocol.Fetch.Message

  require Logger

  def init(topic, partition) do
    Logger.info(~s[#{__MODULE__}.init("#{topic}", #{partition})])
    {:ok, partition}
  end

  # note - messages are delivered in batches
  def handle_message_set(message_set, state) do
    for %Message{value: message} <- message_set do
      Logger.info("[state: #{inspect(state)}] message: " <> inspect(message))
    end
    {:async_commit, state}
  end
end

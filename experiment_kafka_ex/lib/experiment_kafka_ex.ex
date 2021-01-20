defmodule ExperimentKafkaEx do
  @moduledoc """
  Documentation for `ExperimentKafkaEx`.
  """

  alias KafkaEx.Protocol.Produce.{Message, Request}

  require Logger

  def publish(topic, key, value) do
    message = %Message{
      key: key,
      value: value
    }

    request = %Request{
      topic: topic,
      partition: 0,
      required_acks: 1,
      messages: [message]
    }

    Logger.info("KafkaEx.produce(#{inspect(request)})")

    result = KafkaEx.produce(request)

    Logger.info("KafkaEx.produce result=#{inspect(result)}")
  end
end

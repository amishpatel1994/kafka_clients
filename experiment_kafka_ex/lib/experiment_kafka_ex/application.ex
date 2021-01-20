defmodule ExperimentKafkaEx.Application do
  @moduledoc false

  use Application
  alias ExperimentKafkaEx.DepositConsumer
  import Supervisor.Spec

  def start(_type, _args) do
    consumer_group_opts = [
      # setting for the ConsumerGroup
      heartbeat_interval: 500,
      # this setting will be forwarded to the GenConsumer
      commit_interval: 500
    ]

    consumer_group_name = "payments"
    topic_names = ["deposits"]

    children = [
      supervisor(
        KafkaEx.ConsumerGroup,
        [DepositConsumer, consumer_group_name, topic_names, consumer_group_opts]
      )
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ExperimentKafkaEx.Supervisor]
    Supervisor.start_link(children, opts)
  end
end

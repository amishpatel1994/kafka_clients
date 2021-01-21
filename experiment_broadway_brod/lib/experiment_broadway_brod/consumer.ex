defmodule ExperimentBroadwayBrod.Consumer do
  use Broadway

  alias Amishpatel1994.Protos.KafkaClients.UserEvents.V1.UserRegistration

  def start(_, _) do
    Broadway.start_link(__MODULE__,
      name: __MODULE__,
      producer: [
        module:
          {BroadwayKafka.Producer,
           [
             hosts: Application.get_env(:kafka, :hosts),
             group_id: "group_1",
             topics: ["test", "user_events"]
           ]},
        concurrency: 10
      ],
      processors: [
        default: [
          concurrency: 10
        ]
      ]
    )
  end

  def handle_message(_, message, _) do
    decoded_data = UserRegistration.decode(message.data)
    IO.inspect(decoded_data, label: "#{__MODULE__}")
    message
  end
end

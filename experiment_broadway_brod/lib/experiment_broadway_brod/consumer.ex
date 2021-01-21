defmodule ExperimentBroadwayBrod.Consumer do
  use Broadway

  def start(_, _) do
    Broadway.start_link(__MODULE__,
      name: __MODULE__,
      producer: [
        module:
          {BroadwayKafka.Producer,
           [
             hosts: Application.get_env(:kafka, :hosts),
             group_id: "group_1",
             topics: ["test"]
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
    IO.inspect(message, label: "#{__MODULE__}")
    message
  end
end

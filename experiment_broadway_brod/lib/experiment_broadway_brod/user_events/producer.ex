defmodule ExperimentBroadway.UserEvents.Producer do
  alias Amishpatel1994.Protos.KafkaClients.UserEvents.V1.UserRegistration
  alias ExperimentBroadwayBrod.Producer

  @topic "user_events"

  def publish_registration_event(event) do
    encoded_event = encode_registration_event(event)
    Producer.publish(@topic, event.id, encoded_event)
  end

  defp encode_registration_event(user) do
    [
      id: user.id,
      first_name: user.first_name,
      last_name: user.last_name,
      email: user.email
    ]
    |> UserRegistration.new()
    |> UserRegistration.encode()
  end
end

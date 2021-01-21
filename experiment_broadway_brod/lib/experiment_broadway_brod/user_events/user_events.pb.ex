defmodule Amishpatel1994.Protos.KafkaClients.UserEvents.V1.UserRegistration do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          id: String.t(),
          first_name: String.t(),
          last_name: String.t(),
          email: String.t(),
          inserted_at: Google.Protobuf.Timestamp.t() | nil
        }

  defstruct [:id, :first_name, :last_name, :email, :inserted_at]

  field :id, 1, type: :string
  field :first_name, 2, type: :string
  field :last_name, 3, type: :string
  field :email, 4, type: :string
end

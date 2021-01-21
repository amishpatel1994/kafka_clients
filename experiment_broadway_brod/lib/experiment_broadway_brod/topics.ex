defmodule ExperimentBroadwayBrod.Topics do
  @moduledoc false

  def create(name) do
    topic_config = %{
      config_entries: [],
      num_partitions: 6,
      replica_assignment: [],
      replication_factor: 1,
      topic: name
    }

    :brod.create_topics(kafka_hosts(), [topic_config], %{timeout: 1_000})
  end

  def delete(name) do
    :brod.delete_topics(kafka_hosts(), [name], 10_000)
  end

  defp kafka_hosts do
    Application.get_env(:kafka, :hosts)
  end
end

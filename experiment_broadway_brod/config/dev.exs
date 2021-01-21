import Config

config :kafka,
  hosts: [
    {"localhost", 9092}
  ]

config :brod,
  clients: [
    kafka_client: [
      endpoints: [localhost: 9092],
      auto_start_producers: true
    ]
  ]

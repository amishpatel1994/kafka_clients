defmodule ExperimentBroadwayBrod.MixProject do
  use Mix.Project

  def project do
    [
      app: :experiment_broadway_brod,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {ExperimentBroadwayBrod.Consumer, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:brod, "~> 3.10.0"},
      {:broadway, "~> 0.6.1"},
      {:broadway_kafka, "~> 0.1.4"}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end

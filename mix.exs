defmodule NebulexLocalDistributedAdapter.MixProject do
  use Mix.Project

  @source_url "https://github.com/slab/nebulex_local_distributed_adapter"
  @nbx_vsn "2.4.2"
  @version "0.1.0"

  def project do
    [
      app: :nebulex_local_distributed_adapter,
      version: @version,
      elixir: "~> 1.13",
      elixirc_paths: elixirc_paths(Mix.env()),
      aliases: aliases(),
      deps: deps(),

      # Docs
      name: "NebulexLocalDistributedAdapter",
      docs: docs()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      nebulex_dep(),
      {:telemetry, "~> 0.4 or ~> 1.0", optional: true},

      # Docs
      {:ex_doc, "~> 0.29", only: [:dev, :test], runtime: false}
    ]
  end

  defp nebulex_dep do
    if path = System.get_env("NEBULEX_PATH") do
      {:nebulex, "~> #{@nbx_vsn}", path: path}
    else
      {:nebulex, "~> #{@nbx_vsn}"}
    end
  end

  defp docs do
    [
      main: "NebulexLocalDistributedAdapter",
      source_ref: "v#{@version}",
      canonical: "http://hexdocs.pm/nebulex_local_distributed_adapter",
      source_url: @source_url,
      extras: [
        "README.md"
      ]
    ]
  end

  defp aliases do
    [
      "nbx.setup": [
        "cmd rm -rf nebulex",
        "cmd git clone --depth 1 --branch v#{@nbx_vsn} https://github.com/cabol/nebulex"
      ]
    ]
  end
end

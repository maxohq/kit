defmodule Kit.MixProject do
  use Mix.Project

  @github_url "https://github.com/maxohq/kit"
  @version "0.1.0"
  @description "Kit - A package with useful functions for Elixir"

  def project do
    [
      app: :kit,
      version: @version,
      source_url: @github_url,
      description: @description,
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      test_paths: ["lib"],
      deps: deps(),
      package: package(),
      docs: [extras: ["README.md"]]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp package do
    [
      files: ~w(lib mix.exs README* CHANGELOG* LICENCE*),
      exclude_patterns: [~r/.*_test.exs/, ~r/test_helper.exs/],
      licenses: ["MIT"],
      links: %{
        "Github" => @github_url,
        "Changelog" => "#{@github_url}/blob/main/CHANGELOG.md"
      }
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, "~> 0.29", only: :dev, runtime: false}
    ]
  end
end

defmodule Instream.Mixfile do
  use Mix.Project

  @url_docs "http://hexdocs.pm/instream"
  @url_github "https://github.com/mneudert/instream"

  def project do
    [ app:           :instream,
      name:          "Instream",
      description:   "InfluxDB driver for Elixir",
      package:       package,
      version:       "0.4.0",
      elixir:        "~> 1.0",
      deps:          deps(Mix.env),
      docs:          docs,
      test_coverage: [ tool: ExCoveralls ]]
  end

  def application do
    [ applications: [ :hackney ]]
  end

  def deps(:docs) do
    deps(:prod) ++
      [ { :earmark, "~> 0.1", optional: true },
        { :ex_doc,  "~> 0.7", optional: true } ]
  end

  def deps(:test) do
    deps(:prod) ++
      [ { :dialyze,     "~> 0.2", optional: true },
        { :excoveralls, "~> 0.3", optional: true } ]
  end

  def deps(_) do
    [ { :hackney, "~> 1.1" },
      { :poison,  "~> 1.4" },
      { :poolboy, "~> 1.5" } ]
  end

  def docs do
    [ main:       "README",
      readme:     "README.md",
      source_ref: "v0.4.0",
      source_url: @url_github ]
  end

  def package do
    %{ contributors: [ "Marc Neudert" ],
       files:        [ "CHANGELOG.md", "LICENSE", "mix.exs", "README.md", "lib" ],
       licenses:     [ "Apache 2.0" ],
       links:        %{ "Docs" => @url_docs, "Github" => @url_github }}
  end
end

defmodule JetI18n.MixProject do
  use Mix.Project

  def project do
    [
      app: :jet_i18n,
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      compilers: [:gettext] ++ Mix.compilers(),
      aliases: aliases()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:i18next_to_gettext,
       git: "https://github.com/Byzanteam-Labs/i18next_to_gettext.git", branch: "master"},
      {:gettext, ">= 0.0.0"},
      {:jason, "~> 1.2"},
      {:deep_merge, "~> 1.0"}
    ]
  end

  defp aliases() do
    [
      "i18n.convert": [
        "i18next_to_gettext.convert assets/locale/lang/zh_CN.json priv/gettext/zh_CN/LC_MESSAGES/zh_CN.po"
      ]
    ]
  end
end

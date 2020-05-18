defmodule JetShare.MixProject do
  use Mix.Project

  def project do
    [
      app: :jet_share,
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
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
      {:i18next_to_gettext,
       git: "git@github.com:ZhengQingchen/i18next-to-gettext.git",
       branch: "zhengjie/feature/json-to-po"},
      {:gettext, ">= 0.0.0"}
    ]
  end

  defp aliases() do
    [
      "i18n.converte": [
        "i18next_to_gettext.converte assets/locale/lang/zh_CN.json priv/gettext/zh_CN/LC_MESSAGES/default.po"
      ]
    ]
  end
end

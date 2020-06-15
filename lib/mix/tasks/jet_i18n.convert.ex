defmodule Mix.Tasks.JetI18n.Convert do
  use Mix.Task

  @shortdoc "Convert the i18nxet file to the po file"

  @lang_dir "assets/locale/lang"
  @lang "zh_CN"
  @category "LC_MESSAGES"
  @domains ~w[gxzh-supervision]

  @impl Mix.Task
  def run(_args) do
    default_file = Path.join([@lang_dir, "#{@lang}.json"])
    default_map = file_to_map(default_file)

    :ok =
      I18nextToGettext.to_po_file(
        {:map, default_map},
        Path.join(["priv/gettext", @lang, @category, "default.po"])
      )

    Enum.each(@domains, fn domain ->
      domain_map = deep_merge({:map, default_map}, domain)

      :ok =
        {:map, domain_map}
        |> I18nextToGettext.to_po_file(
          Path.join(["priv/gettext", @lang, @category, "#{domain}.po"])
        )
    end)
  end

  defp deep_merge({:map, default_map}, domain) do
    DeepMerge.deep_merge(
      default_map,
      file_to_map(Path.join([@lang_dir, "#{@lang}.#{domain}.json"]))
    )
  end

  defp file_to_map(file_path) do
    file_path
    |> Path.absname()
    |> File.read!()
    |> Jason.decode!()
  end
end

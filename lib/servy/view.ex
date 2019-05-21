defmodule Servy.View do
  @templates_path Path.expand("../../templates", __DIR__)

  # \\ default params
  def render(conv, template, binding \\ []) do
    content =
      @templates_path
      |> Path.join(template)
      |> EEx.eval_file(binding)

    %{conv | status: 200, resp_body: content}
  end
end

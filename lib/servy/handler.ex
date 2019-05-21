defmodule Servy.Handler do
  @moduledoc "Handles http request"

  @pages_path Path.expand("../../pages", __DIR__)

  import Servy.Plugins, only: [rewrite_path: 1, log: 1, track: 1]
  import Servy.Parser, only: [parse: 1]
  import Servy.FileHandler, only: [handle_file: 2]
  import Servy.View, only: [render: 3]

  alias Servy.Conv
  alias Servy.BearController
  alias Servy.VideoCam

  @doc "Trasforms the request into a response"
  def handle(request) do
    request
    |> parse
    |> rewrite_path
    # |> log
    |> route
    |> track
    |> format_response
  end

  # DEFINED IN A NEW MODULE, IMPORT IT
  # def track(%{status: 404, path: path} = conv) do
  #   IO.puts "Warning #{path} is on the loose"
  #   conv
  # end
  #
  # def track(conv), do: conv
  #
  # def rewrite_path(%{path: "/wildlife"} = conv) do
  #   %{ conv | path: "/wildthings"}
  # end
  #
  # def rewrite_path(conv), do: conv
  #
  # def log(conv), do: IO.inspect conv

  # DEFINED IN A NEW MODULE
  # def parse(request) do
  #   # parse the request string into a map
  #   [method, path, _] =
  #     request
  #     |> String.split("\n")
  #     |> List.first
  #     |> String.split(" ")
  #
  #     %{ method: method,
  #       path: path,
  #       resp_body: "" ,
  #       status: nil
  #      }
  #
  # end

  # def route(conv) do
  #     #create a new map that also has the response body
  #     #no if/else, just a function who takes methods.
  #     route(conv,conv.method,conv.path)
  #
  # end

  def route(%Conv{method: "POST", path: "/pledges"} = conv) do
    Servy.PledgeController.create(conv, conv.params)
  end

  def route(%Conv{method: "GET", path: "/pledges"} = conv) do
    Servy.PledgeController.index(conv)
  end

  def route(%Conv{method: "GET", path: "/sensors"} = conv) do
    sensor_data = Servy.SensorServer.get_sensor_data()

    %{conv | status: 200, resp_body: inspect(sensor_data)}
  end

  def route(%Conv{method: "GET", path: "/hibernate/" <> time} = conv) do
    time |> String.to_integer() |> :timer.sleep()

    %{conv | status: 200, resp_body: "Awake!"}
  end

  def route(%Conv{method: "GET", path: "/kaboom"} = conv) do
    raise "Kaboom!"
  end

  def route(%Conv{method: "GET", path: "/wildthings"} = conv) do
    %{conv | status: 200, resp_body: "Bears, Lions, Tigers"}
  end

  def route(%Conv{method: "GET", path: "/api/bears"} = conv) do
    Servy.Api.BearController.index(conv)
  end

  def route(%Conv{method: "POST", path: "/api/bears"} = conv) do
    Servy.Api.BearController.create(conv, conv.params)
  end

  def route(%Conv{method: "GET", path: "/bears"} = conv) do
    BearController.index(conv)
  end

  def route(%Conv{method: "GET", path: "/bears/" <> id} = conv) do
    params = Map.put(conv.params, "id", id)

    BearController.show(conv, params)
  end

  # name=Baloo&type=Brown
  def route(%Conv{method: "POST", path: "/bears"} = conv) do
    BearController.create(conv, conv.params)
  end

  def route(%Conv{method: "DELETE", path: "/bears" <> _id} = conv) do
    BearController.delete(conv, conv.params)
  end

  def route(%Conv{method: "GET", path: "/about"} = conv) do
    # Path.expand("../../pages", __DIR__)
    @pages_path
    |> Path.join("about.html")
    |> File.read()
    |> handle_file(conv)

    # case File.read(file) do
    #   {:ok, content} ->
    #     %{ conv | status: 200, resp_body: content}
    #
    #   {:error, :enoent} ->
    #     %{ conv | status: 404, resp_body: "File not found"}
    #
    #   {:error, reason}->
    #     %{ conv | status: 500, resp_body: "File error #{reason}"}
    # end
  end

  def route(%Conv{path: path} = conv) do
    %{conv | status: 404, resp_body: "No #{path} here!"}
  end

  # DEFINED IN A NEW MODULE
  # def handle_file({:ok , content}, conv) do
  #   %{ conv | status: 200, resp_body: content}
  # end
  #
  # def handle_file({:error, :enoent}, conv) do
  #   %{ conv | status: 404, resp_body: "File not found"}
  # end
  #
  # def handle_file({:error, reason}, conv) do
  #    %{ conv | status: 500, resp_body: "File error #{reason}"}
  # end

  # defp status_reason(code) do
  #   %{
  #     200 => "OK",
  #     201 => "Created",
  #     401 => "Unauthorized",
  #     403 => "Forbidden",
  #     404 => "Not Found",
  #     500 => "Internal Server Error"
  #   }[code]
  # end

  def format_response(%Conv{} = conv) do
    # use values in the map to create an HTTP response string
    """
    HTTP/1.1 #{Conv.full_status(conv)}\r
    Content-Type: #{conv.resp_headers["Content-Type"]}\r
    Content-Length: #{String.length(conv.resp_body)}\r
    \r
    #{conv.resp_body}
    """
  end
end

defmodule HandlerTest do
  use ExUnit.Case, async: true

  import Servy.Handler, only: [handle: 1]

  # test "GET /wildthings" do
  #   request = """
  #   GET /wildthings HTTP/1.1\r
  #   Host: example.com\r
  #   User-Agent: ExampleBrowser/1.0\r
  #   Accept: */*\r
  #   \r
  #   """
  #
  #   response = handle(request)
  #
  #   assert response == """
  #   HTTP/1.1 200 OK\r
  #   Content-Type: text/html\r
  #   Content-Length: 20\r
  #   \r
  #   Bears, Lions, Tigers
  #   """
  # end
  #
  # test "GET /bears" do
  #   request = """
  #   GET /bears HTTP/1.1\r
  #   Host: example.com\r
  #   User-Agent: ExampleBrowser/1.0\r
  #   Accept: */*\r
  #   \r
  #   """
  #
  #   response = handle(request)
  #
  #   expected_response = """
  #   HTTP/1.1 200 OK\r
  #   Content-Type: text/html\r
  #   Content-Length: 356\r
  #   \r
  #   <h1>All the Bears!</h1>
  #
  #   <ul>
  #     <li>Brutus - Grizzly</li>
  #     <li>Iceman - Polar</li>
  #     <li>Kenai - Grizzly</li>
  #     <li>Paddington - Brown</li>
  #     <li>Roscoe - Panda</li>
  #     <li>Rosie - Black</li>
  #     <li>Scarface - Grizzly</li>
  #     <li>Smokey - Black</li>
  #     <li>Snow - Polar</li>
  #     <li>Teddy - Brown</li>
  #   </ul>
  #   """
  #
  #   assert remove_whitespace(response) == remove_whitespace(expected_response)
  # end
  #
  #
  # test "GET /bears/1" do
  #   request = """
  #   GET /bears/1 HTTP/1.1\r
  #   Host: example.com\r
  #   User-Agent: ExampleBrowser/1.0\r
  #   Accept: */*\r
  #   \r
  #   """
  #
  #   response = handle(request)
  #
  #   expected_response = """
  #   HTTP/1.1 200 OK\r
  #   Content-Type: text/html\r
  #   Content-Length: 72\r
  #   \r
  #   <h1>Show Bear</h1>
  #   <p>
  #   Is Teddy hibernating? <strong>true</strong>
  #   </p>
  #   """
  #
  #   assert remove_whitespace(response) == remove_whitespace(expected_response)
  # end
  #
  #
  # test "POST /bears" do
  #   request = """
  #   POST /bears HTTP/1.1\r
  #   Host: example.com\r
  #   User-Agent: ExampleBrowser/1.0\r
  #   Accept: */*\r
  #   Content-Type: application/x-www-form-urlencoded\r
  #   Content-Length: 21\r
  #   \r
  #   name=Baloo&type=Brown
  #   """
  #
  #   response = handle(request)
  #
  #   assert response == """
  #   HTTP/1.1 201 Created\r
  #   Content-Type: text/html\r
  #   Content-Length: 33\r
  #   \r
  #   Created a Brown bear named Baloo!
  #   """
  # end
  #
  # test "GET /api/bears" do
  #   request = """
  #   GET /api/bears HTTP/1.1\r
  #   Host: example.com\r
  #   User-Agent: ExampleBrowser/1.0\r
  #   Accept: */*\r
  #   \r
  #   """
  #
  #   response = handle(request)

  # test "GET /api/bears" do
  # request = """
  # GET /api/bears HTTP/1.1\r
  # Host: example.com\r
  # User-Agent: ExampleBrowser/1.0\r
  # Accept: */*\r
  # \r
  # """
  #
  # response = handle(request)
  #
  # expected_response = """
  # HTTP/1.1 200 OK\r
  # Content-Type: application/json\r
  # Content-Length: 605\r
  # \r
  # [{"type":"Brown","name":"Teddy","id":1,"hibernating":true},
  #  {"type":"Black","name":"Smokey","id":2,"hibernating":false},
  #  {"type":"Brown","name":"Paddington","id":3,"hibernating":false},
  #  {"type":"Grizzly","name":"Scarface","id":4,"hibernating":true},
  #  {"type":"Polar","name":"Snow","id":5,"hibernating":false},
  #  {"type":"Grizzly","name":"Brutus","id":6,"hibernating":false},
  #  {"type":"Black","name":"Rosie","id":7,"hibernating":true},
  #  {"type":"Panda","name":"Roscoe","id":8,"hibernating":false},
  #  {"type":"Polar","name":"Iceman","id":9,"hibernating":true},
  #  {"type":"Grizzly","name":"Kenai","id":10,"hibernating":false}]
  # """
  #
  # assert remove_whitespace(response) == remove_whitespace(expected_response)
  # end
  #
  #
  # test "POST /api/bears" do
  # request = """
  # POST /api/bears HTTP/1.1\r
  # Host: example.com\r
  # User-Agent: ExampleBrowser/1.0\r
  # Accept: */*\r
  # Content-Type: application/json\r
  # Content-Length: 21\r
  # \r
  # {"name": "Breezly", "type": "Polar"}
  # """
  #
  # response = handle(request)
  #
  # assert response == """
  # HTTP/1.1 201 Created\r
  # Content-Type: text/html\r
  # Content-Length: 35\r
  # \r
  # Created a Polar bear named Breezly!
  # """
  # end

  # test "client" do
  # request = """
  # GET /bears HTTP/1.1\r
  # Host: example.com\r
  # User-Agent: ExampleBrowser/1.0\r
  # Accept: */*\r
  # \r
  # """
  #
  # response = Servy.HttpClient.send_request(request)
  # IO.puts response
  # end

  # defp remove_whitespace(text) do
  #   String.replace(text, ~r{\s}, "")
  # end
end

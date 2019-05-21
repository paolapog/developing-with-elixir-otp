# defmodule Servy.HttpClient do
#   def send_request(request) do
#
#     some_host_in_net = 'localhost'
#     {:ok, sock} =
#       :gen_tcp.connect(some_host_in_net, 5678,
#                                  [:binary, packet: :raw, active: false])
#     :ok = :gen_tcp.send(sock, request)
#     {:ok, response} = :gen_tcp.recv(sock, 0)
#     :ok = :gen_tcp.close(sock)
#      response
#   end
# end

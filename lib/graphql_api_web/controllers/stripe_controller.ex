defmodule GraphqlApiWeb.Controllers.StripeController do
  use GraphqlApiWeb, :controller
  alias Plug.Conn

  def hook(conn, params) do
    IO.inspect conn
    IO.inspect params

    case params["event"] do
      "addition" -> "addition"
      _ -> conn |> send_resp(200, Jason.encode!(%{ message: "event not recognized" }))
    end
  end 
end

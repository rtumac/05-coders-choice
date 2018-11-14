defmodule BacongraphWeb.PageController do
  use BacongraphWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end

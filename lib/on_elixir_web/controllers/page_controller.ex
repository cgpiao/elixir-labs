defmodule OnElixirWeb.PageController do
  use OnElixirWeb, :controller

  alias OnElixir.Posts
  def index(conn, _params) do
    posts = Posts.list_posts()
    render(conn, "index.html", posts: posts)
  end

  def api(conn, _params) do
    render(conn, "api.html")
  end
end

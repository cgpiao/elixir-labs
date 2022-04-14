defmodule OnElixirWeb.Admin.TagController do
   use OnElixirWeb, :controller

   def index(conn, _params) do
      render(conn, "index.html")
   end

end

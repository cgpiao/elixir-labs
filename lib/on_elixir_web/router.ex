require Logger

defmodule OnElixirWeb.Router do
   use OnElixirWeb, :router

   import OnElixirWeb.UserAuth

   def check_admin(conn, _opts) do
      unless conn.assigns[:current_user].is_admin do
         conn
            |> redirect(to: "/")
      else
         conn |> put_layout({OnElixirWeb.LayoutView, :admin})
      end
   end

   pipeline :browser do
      plug :accepts, ["html"]
      plug :fetch_session
      plug :fetch_live_flash
      plug :put_root_layout, {OnElixirWeb.LayoutView, :root}
      plug :protect_from_forgery
      plug :put_secure_browser_headers
      plug :fetch_current_user
   end

   pipeline :api do
      plug :accepts, ["json"]
   end

   scope "/", OnElixirWeb do
      pipe_through :browser

      get "/", PageController, :index
      get "/api", PageController, :api
      if Mix.env === "prod" do
         resources "/posts", PostController, only: [:index, :show]
      end
      if Mix.env !== "prod" do
         resources "/posts", PostController
      end

   end

   # Other scopes may use custom stacks.
   # scope "/api", OnElixirWeb do
   #   pipe_through :api
   # end

   # Enables LiveDashboard only for development
   #
   # If you want to use the LiveDashboard in production, you should put
   # it behind authentication and allow only admins to access it.
   # If your application does not have an admins-only section yet,
   # you can use Plug.BasicAuth to set up some basic authentication
   # as long as you are also using SSL (which you should anyway).
   if Mix.env() in [:dev, :test] do
      import Phoenix.LiveDashboard.Router

      scope "/" do
         pipe_through :browser

         live_dashboard "/dashboard", metrics: OnElixirWeb.Telemetry
      end
   end

   # Enables the Swoosh mailbox preview in development.
   #
   # Note that preview only shows emails that were sent by the same
   # node running the Phoenix server.
   if Mix.env() == :dev do
      scope "/dev" do
         pipe_through :browser

         forward "/mailbox", Plug.Swoosh.MailboxPreview
      end
   end

   ## Authentication routes

   scope "/", OnElixirWeb do
      pipe_through [:browser, :redirect_if_user_is_authenticated]

      get "/users/register", UserRegistrationController, :new
      post "/users/register", UserRegistrationController, :create
      get "/users/log_in", UserSessionController, :new
      post "/users/log_in", UserSessionController, :create
      get "/users/reset_password", UserResetPasswordController, :new
      post "/users/reset_password", UserResetPasswordController, :create
      get "/users/reset_password/:token", UserResetPasswordController, :edit
      put "/users/reset_password/:token", UserResetPasswordController, :update
   end

   scope "/", OnElixirWeb do
      pipe_through [:browser, :require_authenticated_user]

      get "/users/settings", UserSettingsController, :edit
      put "/users/settings", UserSettingsController, :update
      get "/users/settings/confirm_email/:token", UserSettingsController, :confirm_email
   end

   scope "/admin", OnElixirWeb.Admin, as: :admin do
      pipe_through [:browser, :require_authenticated_user, :check_admin]
      get "/", AdminController, :index, as: :console
      resources "/posts", PostController
      resources "/categories", CategoryController
      resources "/tags", TagController
   end

   scope "/", OnElixirWeb do
      pipe_through [:browser]

      delete "/users/log_out", UserSessionController, :delete
      get "/users/confirm", UserConfirmationController, :new
      post "/users/confirm", UserConfirmationController, :create
      get "/users/confirm/:token", UserConfirmationController, :edit
      post "/users/confirm/:token", UserConfirmationController, :update
   end
end

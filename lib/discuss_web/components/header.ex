defmodule DiscussWeb.Header do
  use Phoenix.Component
  import DiscussWeb.Button

  def header(assigns) do
    ~H"""
    <header class="bg-blue-600 text-white p-4">
      <nav class="container mx-auto flex justify-between items-center">
        <h1>
          <a href="/" class="text-xl font-bold text-white hover:text-gray-200">
            Discuss
          </a>
        </h1>
        <div class="flex space-x-3">
          <a href="/">
            <.button text="Home" color="gray" size="sm" class="text-sm" />
          </a>
          <a href="/about">
            <.button text="About" color="green" size="sm" class="text-sm" />
          </a>
          <a href="/topics">
            <.button text="Topics" color="blue" size="sm" class="text-sm" />
          </a>
        </div>
      </nav>
    </header>
    """
  end
end

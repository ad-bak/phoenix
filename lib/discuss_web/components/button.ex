defmodule DiscussWeb.Button do
  use Phoenix.Component

  @doc """
  A reusable button component with customizable color, size, and text.
  
  ## Examples
  
      <.button text="Click me" color="blue" size="md" />
      <.button text="Submit" color="green" size="lg" />
  """
  def button(assigns) do
    # Set default values if not provided
    assigns = assign_new(assigns, :color, fn -> "blue" end)
    assigns = assign_new(assigns, :size, fn -> "md" end)
    assigns = assign_new(assigns, :class, fn -> "" end)

    ~H"""
    <button class={[
      "font-medium rounded-lg transition-colors duration-200 focus:outline-none focus:ring-2 focus:ring-offset-2",
      color_class(@color),
      size_class(@size),
      @class
    ]}>
      {@text}
    </button>
    """
  end

  # Private functions to generate CSS classes based on props
  defp color_class("blue"), do: "bg-blue-600 hover:bg-blue-700 text-white focus:ring-blue-500"
  defp color_class("green"), do: "bg-green-600 hover:bg-green-700 text-white focus:ring-green-500"
  defp color_class("red"), do: "bg-red-600 hover:bg-red-700 text-white focus:ring-red-500"
  defp color_class("gray"), do: "bg-gray-600 hover:bg-gray-700 text-white focus:ring-gray-500"
  defp color_class(_), do: "bg-blue-600 hover:bg-blue-700 text-white focus:ring-blue-500"

  defp size_class("sm"), do: "px-3 py-1.5 text-sm"
  defp size_class("md"), do: "px-4 py-2 text-base"
  defp size_class("lg"), do: "px-6 py-3 text-lg"
  defp size_class(_), do: "px-4 py-2 text-base"
end
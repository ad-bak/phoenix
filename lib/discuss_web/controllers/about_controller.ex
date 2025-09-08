defmodule DiscussWeb.AboutController do
  use DiscussWeb, :controller

  def index(conn, _params) do
    # This is like your React component logic
    # Here you can fetch data, process it, etc.
    
    fish_facts = [
      "Fish have been on Earth for more than 450 million years!",
      "There are over 30,000 species of fish in the world.",
      "Fish don't have vocal cords, but they can still make sounds!",
      "Some fish can live for over 100 years.",
      "Fish can see colors that humans cannot see."
    ]
    
    page_data = %{
      title: "About Our Fish Community",
      description: "Learn amazing facts about fish and our community!",
      facts: fish_facts,
      member_count: 1247  # Example data
    }
    
    # Pass data to template (like passing props to React component)
    render(conn, :index, page_data)
  end
end
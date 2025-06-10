class EventIndex < Chewy::Index
  index_scope Event.includes(:location) do
    field :title, type: "text"
    field :description, type: "text"
  end
end

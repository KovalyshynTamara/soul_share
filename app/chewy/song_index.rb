class SongIndex < Chewy::Index
  index_scope Song do
    field :title, type: "text"
    field :author, type: "text"
    field :genre, type: "text"
    field :lyrics, type: "text"
  end
end

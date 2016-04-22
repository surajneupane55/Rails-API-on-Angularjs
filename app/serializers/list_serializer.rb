class ListSerializer < ActiveModel::Serializer
  attributes :id, :due_date, :description, :status
end

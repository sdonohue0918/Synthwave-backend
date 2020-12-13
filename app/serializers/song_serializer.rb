class SongSerializer < ActiveModel::Serializer
  attributes :id, :name, :author, :file

  def file
    object.file.service_url if object.file.attached?
  end
end

class Song < ApplicationRecord
    has_one_attached :file

    def get_blob_url
        if self.file.attached?
        Rails.application.routes.url_helpers.rails_blob_path(self.file, only_path: true)
        else
            nil
        end
    end

    def save_file
        song_file = self.file
        song_path = Rails.root.join("app", "songs", song_file.filename.to_s)
        File.open(song_path, 'wb') do |file|
            file.write(self.file.download)
        end
    end

    def delete_file
        song_file = self.file
        song_path = Rails.root.join("app", "songs", song_file.filename.to_s)
        File.delete(song_path) if File.exist?(song_path)
    end

end

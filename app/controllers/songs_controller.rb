class SongsController < ApplicationController
    def index
        @songs = Song.all
        render :json songs
    
    end

    def show
        @song = Song.find_by(id: params[:id])
        render :json song

    end

    def new
        @song = Song.new

    
    end

    def create
        @song = Song.create(song_params)

    
    end

    def edit
        @song = Song.find_by(id: params[:id])
    end

    def update
        @song = Song.update(song_params)
    end

    def delete
        @song = Song.find_by(id: params[:id])
        @song.destroy!

    end
        
    private

    def song_params
        params.require(:song).permit(:name, :author, :file)
    end
    
end

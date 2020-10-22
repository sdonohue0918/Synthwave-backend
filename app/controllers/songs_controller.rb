class SongsController < ApplicationController
    def index
        @songs = Song.all
        render json: @songs
    end

    def show
        @song = Song.find_by(id: params[:id])
        # if @song.file.attached?
        
        #     render json: @song.file.service_url
        # elsif @song
        #     render json: @song
        # end

    end

    def new
        @song = Song.new
    end

    def create
        @song = Song.create(name: params[:name], author: params[:author])
        @song.file.purge
        @song.file.attach(params[:file])
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

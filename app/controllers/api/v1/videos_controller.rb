class Api::V1::VideosController < Api::V1::ApiController
 
 before_action :set_video, only: [:show, :update, :destroy]
 
 before_action :require_authorization!, only: [:show, :update, :destroy]
 
 # GET /api/v1/videos
 
 def index
 
   @videos = current_user.videos
 
   render json: @videos
 
 end
 
 # GET /api/v1/videos/1
 
 def show
 
   render json: @video
 
 end
 
 # POST /api/v1/videos
 
 def create
 
   @video = Video.new(video_params.merge(user: current_user))
 
   if @video.save
 
     render json: @video, status: :created
 
   else
 
     render json: @video.errors, status: :unprocessable_entity
 
   end
 
 end
 
 # PATCH/PUT /api/v1/videos/1
 
 def update
 
   if @video.update(video_params)
 
     render json: @video
 
   else
 
     render json: @video.errors, status: :unprocessable_entity
 
   end
 
 end
 
 # DELETE /api/v1/videos/1
 
 def destroy
 
   @video.destroy
 
 end
 
 private
 
   # Use callbacks to share common setup or constraints between actions.
 
   def set_video
 
     @video = Video.find(params[:id])
 
   end
 
   # Only allow a trusted parameter "white list" through.
 
   def video_params
 
     params.require(:video).permit(:name, :email, :phone, :description)
 
   end
 
   def require_authorization!
 
     unless current_user == @video.user
 
       render json: {}, status: :forbidden
 
     end
 
   end
 
end
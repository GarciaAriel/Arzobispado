class PostAttatchmentsController < ApplicationController
	def new
    @post_attatchment = PostAttatchment.new
    @post=Post.find(params[:id])
    end

    def create
    @post = PostAttatchment.new(post_attatchment_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post.post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end
  def download
    post_attatchment = PostAttatchment.find(params[:id])
    send_file post_attatchment.image.path
  end
    private
    def post_attatchment_params
      params.require(:post_attatchment).permit(:post_id,:image,:content)
    end
end

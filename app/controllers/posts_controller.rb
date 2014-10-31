class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    search=params[:search]
       if (user_signed_in? && (current_user.rol == "admin" || current_user.rol == "super") && params[:myposts]!=nil && params[:myposts]=="true" )
          
          @posts = Post.where(:evento_id=>params[:id],:user_id=>current_user.id).where('title LIKE ?', "%#{search}%").page(params[:page]).per(5)
      else

    @posts = (Post.where(:evento_id=>params[:id]).where('title LIKE ?', "%#{search}%")).page(params[:page]).per(5)
  end
    @evento_id=params[:id]
    @evento=Evento.find(@evento_id)
    
  end
  # GET /posts/1
  # GET /posts/1.json
  def show
    @evento=@post.evento
    @comment=Comment.new
    @editcomment=Comment.new
    @comments=@post.comments.page(params[:page]).per(5)
  end

  # GET /posts/new
  def new
    if (user_signed_in? && (current_user.rol == "admin" || current_user.rol == "super"))
      @evento=Evento.find(params[:id])
      @post = Post.new
    else
      redirect_to root_path
    end
    
  end

  # GET /posts/1/edit
  def edit
    if (user_signed_in? && (current_user.rol == "admin" || (current_user.rol == "super" && current_user.id==@post.id)))
      @evento=@post.evento
    else
      redirect_to root_path
    end
    
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.user=current_user
        respond_to do |format|
      if @post.save
        log("Usuario: "+current_user.email+" creo el post: "+@post.title+", fecha/hora: "+current_user.last_sign_in_at.to_s+" desde: "+current_user.last_sign_in_ip)
        format.html { redirect_to @post, notice: 'Post creado!' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    @nombre=@post.title
    respond_to do |format|
      if @post.update(post_params)
               log("Usuario: "+current_user.email+" Actualizo el post: "+@nombre+" a "+@post.title+", fecha/hora: "+current_user.last_sign_in_at.to_s+" desde: "+current_user.last_sign_in_ip)
        format.html { redirect_to @post, notice: 'Post actualizado!' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
       log("Usuario: "+current_user.email+" elimino el post: "+@post.title+", fecha/hora: "+current_user.last_sign_in_at.to_s+" desde: "+current_user.last_sign_in_ip)
     @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_index_path(@post.evento.id), notice: 'Post Eliminado' }
      format.json { head :no_content }
    end
  end

  private
  def log(event)
    @l=Log.new
    @l.description=event
    @l.user_id=current_user.id
    @l.save
  end  
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :content,:image,:active,:evento_id)
    end
end

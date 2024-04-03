class CommentsController < ApplicationController
    before_action :film, only: :create
    before_action :find_comment, except: :create
    def create
        @comment = Comment.new(comment_params)

        if @comment.save
            redirect_to film_path(@film)
        else

        end
    end

    def edit
      authorize @comment
      @comment = Comment.find(params[:id])
    end

    def destroy
      authorize @comment
        @comment.destroy!
    
        # respond_to do |format|
        #   format.html { redirect_to films_url, notice: "Comment was successfully destroyed." }
        #   format.json { head :no_content }
        # end
    end

    def update
        # @comment = Comment.find(params[:id])
        
        @comment.assign_attributes(comment_params)

        if @comment.save
            redirect_to @comment.commentable, notice: 'Comment updated'
          else
            flash[:error] = @comment.errors.full_messages.join(", ")
            render :edit
        end
        
    end

    private
    def comment_params
        params.require(:comment).permit(:body)
        .merge!(commentable: film, user: current_user)
    end

    def film
        @film = Film.find(params[:film_id])
    end

    def find_comment
      @comment = Comment.find(params[:id])
    end
end

class CommentsController < ApplicationController
    before_filter :set_post

    def create
        @comment = @post.comments.create(comment_params)
        redirect_to post_path(@post)
    end

    def destroy
        @comment = @post.comments.find(params[:id])
        @comment.destroy
        flash[notice] = "Comentario eliminado"
        redirect_to post_path(@post)
    end

    private
        def comment_params
            params.require(:comment).permit(:name, :body)
        end

        def set_post
            @post = Post.find(params[:post_id])
        end
end

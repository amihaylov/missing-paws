class ForumCommentsController < ApplicationController
	before_action :logged_in_user, only: [:new, :show, :edit, :update, :destroy]
	before_filter :disable_aside

	def create
		@forum = Forum.find(params[:forum_id])
		@comment = @forum.forum_comments.create(params[:forum_comment].permit(:comment))
		@comment.user_id = current_user.id if current_user
		@comment.save

		if @comment.save
			redirect_to forum_path(@forum)
		else
			render 'new'
		end
	end

	def edit
		@forum = Forum.find(params[:forum_id])
		@comment = @forum.forum_comments.find(params[:id])
	end

	def update
		@forum = Forum.find(params[:forum_id])
		@comment = @forum.forum_comments.find(params[:id])

		if @comment.update(params[:forum_comment].permit(:comment))
			redirect_to forum_path(@forum)
		else
			render 'edit'
		end
	end

	def destroy
		@forum = Forum.find(params[:forum_id])
		@comment = @forum.forum_comments.find(params[:id])
		@comment.destroy
		redirect_to forum_path(@forum)
	end	

	private

		def disable_aside
			@disable_aside = true 
		end	
end 


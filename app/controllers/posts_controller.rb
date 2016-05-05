class PostsController < ApplicationController
	before_action :authenticate_user!
	before_action :find_group

	def new
		@post = @group.posts.new
	end

	def create
		@post = @group.posts.build(posts_params)

		if @post.save
			flash[:notice] = "新增一篇文章"
			redirect_to group_path(@group)
		else
			render :new
		end
	end

	def edit
		@post = @group.posts.find(params[:id])
	end

	def update
		@post = @group.posts.find(params[:id])

		if @post.update(posts_params)
			flash[:notice] = "文章已經更新"
			redirect_to group_path(@group)
		else
			render :edit
		end
	end

	def destroy
		@post = @group.posts.find(params[:id])
		@post.destroy
		flash[:notice] = "刪除一篇文章"
		redirect_to group_path(@group)
	end




	private

	def find_group
		@group = Group.find(params[:group_id])
	end

	def posts_params
		params.require(:post).permit(:content)
	end
end

class GroupsController < ApplicationController
	def index
		@groups = Group.all
	end

	def new
		@group = Group.new
	end

	def create
		@group = Group.new(group_params)
		if @group.save
			flash[:notice] = "討論區建立成功"
			redirect_to groups_path
		else
			render :new
		end

	end

	def edit
		@group = Group.find(params[:id])
	end


	def update
		@group= Group.find(params[:id])
		if @group.update(group_params)
			flash[:notice] = "討論區更新成功"
			redirect_to groups_path
		else
			render :edit
		end
	end

	def destroy
		@group = Group.find(params[:id])
		@group.destroy
		flash[:notice] = "刪除討論區"
		redirect_to groups_path
	end



	def show
		@group = Group.find(params[:id])
	end

	private

	def group_params
		params.require(:group).permit(:title, :description)
	end


end
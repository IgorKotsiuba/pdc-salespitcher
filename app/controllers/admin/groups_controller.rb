class Admin::GroupsController < Admin::ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  def index
    @groups = ::Group.all
  end

  def show
  end

  def new
    @group = ::Group.new
  end

  def edit
  end

  def create
    @group = ::Group.new(permitted_params)

    respond_to do |format|
      if @group.save
        format.html { redirect_to admin_group_path(@group), notice: 'Group was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @group.update(permitted_params)
        format.html { redirect_to admin_group_path(@group), notice: 'Group was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to admin_groups_url, notice: 'Group was successfully destroyed.' }
    end
  end

  private

  def set_group
    @group = ::Group.find(params[:id])
  end

  def permitted_params
    params.require(:group).permit(:name, user_ids: [])
  end
end

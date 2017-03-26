class GroupController < ApplicationController
  before_action :set_category
  before_action :set_group, only: [:show, :edit, :update, :destroy, :join_group]

  # GET /posts
  # GET /posts.json
  def index
    @group = @category.groups
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @groups = Group.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @groups = Group.new(group_params)
    @groups.category = @category

    respond_to do |format|
      if @groups.save
        format.html { redirect_to @groups, notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @groups }
      else
        format.html { render :new }
        format.json { render json: @groups.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @groups.update(group_params)
        format.html { redirect_to @groups, notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @groups }
      else
        format.html { render :edit }
        format.json { render json: @groups.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @groups.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_category
      @category = Category.find(params[:category_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @groups = Group.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params.require(:group).permit(:name, :description)
    end

end

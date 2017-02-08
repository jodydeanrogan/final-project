class ActivitiesController < ApplicationController

  before_action :set_activity, only: [:show, :edit, :update, :destroy]

  def check_photo_tags
    @image_url = params[:image_url]
    @token = Clarifai.get_token
    @token = @token[:access_token]
    @response = Clarifai.get_tags(@token, @image_url)
    @tags = @response[:tags]
    @task = Activity.check_tasks(@tags, params[:activity_id])
    respond_to do |format|
      format.js {}
    end
  end

  def index
    @activities = Activity.all
  end

  def show
    @activity_user = ActivityUser.first_or_create(user_id: current_user.id, activity_id: @activity.id)
    @photo = Photo.new
    @photo.activity_user_id = @activity_user.id
  end

  def new
    @activity = Activity.new
    9.times do
      @activity.tasks.new(tag: "undefined")
    end
  end

  def edit
  end

  def create
    @activity = Activity.new(activity_params)
    @activity.activity_creator_id = current_user.id
    respond_to do |format|
      if @activity.save
        format.html { redirect_to @activity, notice: 'Activity has been successfully created.' }
        format.json { render :show, status: :created, location: @activity }
      else
        format.html { render :new }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @activity.update(activity_params)
        format.html { redirect_to @activity, notice: 'Activity has been successfully updated.' }
        format.json { render :show, status: :ok, location: @activity }
      else
        format.html { render :edit }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @activity.tasks.destroy_all
    @activity.activity_users.destroy_all
    @activity.activity_creator.destroy
    @activity.destroy
    respond_to do |format|
      format.html { redirect_to activities_url, notice: 'Activity has been successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_activity
    @activity = Activity.find(params[:id])
  end

  def activity_params
    params.require(:activity).permit(:image, :title, :description, :activity_creator_id, tasks_attributes: [:id, :activity_id, :image, :learning_objectives, :instructions, :hints, :tag, :_destroy])
  end

end

class AppSettingsController < ApplicationController
  before_action :set_app_setting, only: [:show, :update, :destroy]

  # GET /app_settings
  def index
    @app_settings = AppSetting.all

    render json: @app_settings
  end

  # GET /app_settings/1
  def show
    render json: @app_setting
  end

  # POST /app_settings
  def create
    @app_setting = AppSetting.new(app_setting_params)

    if @app_setting.save
      render json: @app_setting, status: :created, location: @app_setting
    else
      render json: @app_setting.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /app_settings/1
  def update
    if @app_setting.update(app_setting_params)
      render json: @app_setting
    else
      render json: @app_setting.errors, status: :unprocessable_entity
    end
  end

  # DELETE /app_settings/1
  def destroy
    @app_setting.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_app_setting
      @app_setting = AppSetting.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def app_setting_params
      params.require(:app_setting).permit(:max_reward_per_user, :min_reward_per_user, :min_user_limit_per_survey, :max_user_limit_per_survey, :min_reward_per_question, :max_reward_per_question, :/home/ubuntu/earnswer$, :rails, :g, :model, :AppSettings, :max_reward_per_user, :min_reward_per_user, :min_user_limit_per_survey, :max_user_limit_per_survey, :min_reward_per_question, :max_reward_per_question, :max_onair_day, :min_onair_day, :withdraw_limit, :shop_limit)
    end
end

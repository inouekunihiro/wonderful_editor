class Api::V1::BaseApiController < ApplicationController
  def current_user
    # if @current_user.nil?
    #   @current_user = User.first
    # else
    #   @current_user # 空じゃない場合
    # end

    # @current_user = @current_user || User.first
    @current_user ||= User.first
  end
end

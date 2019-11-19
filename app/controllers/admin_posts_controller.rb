class AdminPostsController < ApplicationController
  def index
    posts = AdminPost.all
    render json:{status: 'SUCCESS', data: posts}

  end

  def filter_by_station
    station = Station.find_by(name: params[:station_name])
    posts = AdminPost.where(station_id: station.id)
    render json:{status: 'SUCCESS', data: posts}
  end

  def filter_by_data
    station = Station.find_by(name: params[:station_name])
    posts = AdminPost.where(station_id: station.id).where(data: params[:data])
    render json:{status: 'SUCCESS', data: posts}
  end

  def create
    post = AdminPost.new(post_params)
    if post.save
      render json:{status: 'SUCCESS', data: post}
    else
      render json:{status: 'ERROR', data: post.errors}
    end
  end

  def update
    post = AdminPost.find(params[:id])
    if post.update(post_params)
      render json:{status: 'SUCCESS', data: post}
    else
      render json:{status: 'ERROR', data: post.errors}
    end
  end

  private
  def post_params
    params.require(:admin_posts).permit(:data,:location, :lng, :lat)
  end
end

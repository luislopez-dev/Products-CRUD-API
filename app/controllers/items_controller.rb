class ItemsController < ApplicationController
  before_action :authorized

  def index
    @items = Item.all
    render json: @items
  end

  def show
    @item = Item.find(params[:id])
    render json: @item
  end

  def create
    @item = Item.create(
      name: params[:name],
      price: params[:price],
      qty: params[:qty],
      descr: params[:descr],
      user_id: decoded_token[0]['user_id']
    )
    NotificationMailer.new_notification_email.deliver_later
    render json: @item
  end

  def update
    @item = Item.find(params[:id])
    @item.update(
      name: params[:name],
      price: params[:price],
      qty: params[:qty],
      descr: params[:descr]
    )
    render json: @item
  end

  def destroy
    @items = Item.all
    @item = Item.find(params[:id])
    @item.destroy
    render json: @items
  end
end

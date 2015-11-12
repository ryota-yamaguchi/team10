class RoomController < ApplicationController
  unloadable

  before_filter :find_project, :only => [ :index, :new, :edit, :show, :create, :update, :destroy ]
  before_action :set_room, :only => [ :show, :edit, :update  ]
  before_action :room_params, :only => [ :create, :update ]
  before_action :col_select, :only => [ :new, :edit ]

  def index

    # 開催中の会議室を取得
    @rooms = Room.where( open: true ).where( use: true )

  end

  def new

    @room = Room.new

  end

  def edit


  end

  def show


  end

  def create


  end

  def update

    # 更新処理
    respond_to do |format|

      timenow = Time.now

      @room.update_on = timenow
      @room.closed_on = if params[:room][:use] == 'true' then nil  else timenow end

      if @room.update(room_params)
        format.html { redirect_to_referer_or project_team10_room_path( :id=>@room.id ), notice: 'Room was successfully update' }
        format.json { redirect_to_referer_or project_team10_room_path( :id=>@room.id ), notice: 'Room was successfully update' }
      else
        @updateresult = 'false'
        format.html { render redirect_to_referer_or project_team10_room_path( :id=>@room.id ), notice: 'Room was failed update'}
        format.json { render json: @room.errors }
      end
    end

  end

  def destroy
  end

  def find_project

    # Projectの取得 ( Project Menuの維持 )
    @project = Project.find(params[:project_id])

  end

  def set_room

    #指定された会議室を取得
    @room = Room.find( params[:id] )

  end

  def room_params

    params.require( :room ).permit( :name, :description, :author_id, :owner_id, :open, :use )

  end

  def col_select

    @users = User.all

  end
end

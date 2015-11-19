class RoomController < ApplicationController
  unloadable

  before_filter :find_project, :only => [ :index, :new, :edit, :show, :create, :update, :destroy ]
  before_action :set_room, :only => [ :show, :edit, :update, :destroy  ]
  before_action :room_params, :only => [ :create, :update ]
  before_action :col_select, :only => [ :new, :edit, :show ]

  def index

    # 開催中の会議室を取得
    @rooms = Room.where( use: true ).where( project_id: @project.id )

  end

  def new

    # Roomの作成
    @room = Room.new

    # 初期値のセット
    @room.project_id = @project.id
    @room.author_user = User.current
    @room.owner_user = User.current
    @room.open = true
    @room.use = true

  end

  def edit


  end

  def show


  end

  def create

    # Roomの作成
    @room = Room.new( room_params )

    # 初期値セット
    @room.use = true

    # 作成、更新時間の取得
    timenow = Time.now
    @room.create_on = timenow
    @room.update_on = timenow
    @room.closed_on = if params[:room][:use] == 'true' then nil  else timenow end

    # 作成処理
    respond_to do |format|

      if @room.save then
        format.html { redirect_to project_team10_rooms_path, notice: l(:msg_room_create_success) }
        format.json { render action: 'show', status: :created, location: @room,  notice: l(:msg_room_create_success) }
      else
        @updateresult = 'false'
        flash[:error] = l(:msg_room_create_failed) + @room.errors.full_messages.to_s
        format.html { redirect_to :back   }
        format.json { render json: @room.errors }
      end

    end

  end

  def update


    # 更新時間の取得
    timenow = Time.now
    @room.update_on = timenow
    @room.closed_on = if params[:room][:use] == 'true' then nil  else timenow end

    # 更新処理
    respond_to do |format|

      if @room.update(room_params)
        format.html { redirect_to project_team10_room_path( :id=>@room.id, :action=>:show ), notice: l(:msg_room_update_success) }
        format.json { render action: 'show', status: :created, location: @room,  notice: l(:msg_room_update_success) + @room.errors.full_messages.to_s }
      else
        @updateresult = 'false'
        flash[:error] = l(:msg_room_update_failed) + @room.errors.full_messages.to_s
        format.html { redirect_to :back }
        format.json { render json: @room.errors }
      end
    end

  end

  def destroy

    timenow = Time.now

    # 更新処理
    respond_to do |format|

      if @room.update( :use => false, :update_on => timenow, :closed_on => timenow )
        format.html { redirect_to project_team10_rooms_path, notice: l(:msg_room_destroy_success) }
        format.json { render action: 'show', status: :created, location: @room,  notice: l(:msg_room_destroy_success) + @room.errors.full_messages.to_s }
      else
        @updateresult = 'false'
        flash[:error] = l(:msg_room_destroy_failed) + @room.errors.full_messages.to_s
        format.html { redirect_to :back }
        format.json { render json: @room.errors }
      end
    end


  end

  def find_project

    # Projectの取得 ( Project Menuの維持 )
    @project = Project.find_by(name: params[:project_id])

  end

  def set_room

    #指定された会議室を取得
    @room = Room.find( params[:id] )

  end

  def room_params

    params.require( :room ).permit( :project_id, :name, :description, :author_id, :owner_id, :open, :use )

  end

  def col_select

    @users = User.all

  end

end

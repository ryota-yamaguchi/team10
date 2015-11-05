class Team10Controller < ApplicationController
  unloadable


  def index

    # Projectの取得 ( Project Menuの維持 )
    @project = Project.find(params[:project_id])

    # 開催中の会議室を取得
    @rooms = Room.all

  end
end

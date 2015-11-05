class CreateRoomStatuses < ActiveRecord::Migration
  def change
    create_table :room_statuses do |t|
      t.string :name
      t.integer :sort
      t.boolean :closed
      t.boolean :deleted
    end

    # 初期データ投入
    RoomStatus.create( :name => 'OPEN', :sort => 1, :closed => FALSE, :deleted => FALSE )
    RoomStatus.create( :name => 'CLOSED', :sort => 99, :closed => TRUE, :deleted => FALSE )
    RoomStatus.create( :name => 'DELETED', :sort => 999, :closed => FALSE, :deleted => TRUE )

  end
end

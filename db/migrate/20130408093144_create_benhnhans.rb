class CreateBenhnhans < ActiveRecord::Migration
  def change
    create_table :benhnhans do |t|
    t.string :ten_benh_nhan
    t.string :dia_chi
    t.string :so_dien_thoai
    t.string :benh_an
    t.timestamps
    end
  end
end

  class Benhnhan < ActiveRecord::Base
    attr_accessible :ten_benh_nhan, :so_dien_thoai, :dia_chi, :benh_an
    paginates_per 10
    def self.search(search)
      if search
        find(:all,:conditions => ["#{'ten_benh_nhan'} LIKE ?", "%#{search}%"])
      else
        find(:all)
      end
    end
    
  end

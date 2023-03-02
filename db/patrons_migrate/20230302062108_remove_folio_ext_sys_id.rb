class RemoveFolioExtSysId < ActiveRecord::Migration[7.0]
  def change
    remove_index :users, :folio_ext_sys_id

    remove_column :users, :folio_ext_sys_id
  end
end

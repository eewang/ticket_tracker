class RenameAncesterGenreIdsInSports < ActiveRecord::Migration
  def up
    rename_column :sports, :ancesterGenreIds, :ancestorGenreIds
  end

  def down
    rename_column :sports, :ancestorGenreIds, :ancesterGenreIds
  end
end

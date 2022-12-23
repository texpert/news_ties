class CreateFeeds::V20221223225952 < Avram::Migrator::Migration::V1
  def migrate
    # Learn about migrations at: https://luckyframework.org/guides/database/migrations
    create table_for(Feed) do
      primary_key id : Int64
      add_timestamps
      add title : String, index: true, unique: true, case_sensitive: false
      add url : String, unique: true, case_sensitive: false
    end
  end

  def rollback
    drop table_for(Feed)
  end
end

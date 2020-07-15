# frozen_string_literal: true
class UserTaggings < Struct.new(:limit, :start_date)
  # SELECT USERS.*, TEMP_U.TASK_COUNT FROM USERS
  # JOIN (
  #   SELECT U.ID,
  #      (SELECT COUNT(1) FROM TASKS T
  #         START_DATE >= '2020-06-25'
  #     ) AS TASK_COUNT FROM USERS U
  # ) TEMP_U
  # ON USERS.ID = TEMP_U.ID
  # ORDER BY USERS.ID

  def fetch
    User.joins(join_clause)
      .select('users.*, total_taggings.taggings_count')
      .order('total_taggings.taggings_count DESC')
      .take(limit)
  end

  private

  def join_clause
    @join_clause ||= begin
      users = User.arel_table
      users.join(total_taggings).on(users[:id].eq(total_taggings[:user_id])).join_sources
    end
  end

  def total_taggings
    @total_taggings ||= begin
      tasks = Task.arel_table
      taggings = Tagging.arel_table
      tasks.join(taggings).on(tasks[:id].eq(taggings[:task_id])
                              .and(tasks[:start_date].gteq(Date.parse(start_date))))
            .project(tasks[:user_id], taggings[:tag_id].count.as('taggings_count'))
            .group(tasks[:user_id])
            .as('total_taggings')
    end
  end
end


Rails.configuration.to_prepare do
  # Helper
  require 'redmine_rate/helpers/rate_helper'
  # Hooks
  require 'redmine_rate/hooks/project_hook'
  require 'redmine_rate/hooks/memberships_hook'
  require 'redmine_rate/hooks/timesheet_hook_helper'
  require 'redmine_rate/hooks/plugin_timesheet_views_timesheets_time_entry_row_class_hook'
  require 'redmine_rate/hooks/plugin_timesheet_views_timesheet_group_header_hook'
  require 'redmine_rate/hooks/plugin_timesheet_views_timesheet_time_entry_hook'
  require 'redmine_rate/hooks/plugin_timesheet_views_timesheet_time_entry_sum_hook'
  require 'redmine_rate/hooks/plugin_timesheet_view_timesheets_report_header_tags_hook'
  require 'redmine_rate/hooks/view_layouts_base_html_head_hook'
  require 'redmine_rate/hooks/view_timelog_edit_form_bottom_hook'

  # Patches
  require 'redmine_rate/patches/time_entry_patch'
  require 'redmine_rate/patches/time_entry_query_patch'
  require 'redmine_rate/patches/time_report_patch'
  require 'redmine_rate/patches/users_helper_patch'
end

# global Redmine Reporting constants and settings
module RedmineRate
  def self.settings
    Setting[:plugin_redmine_rate].blank? ? {} : Setting[:plugin_redmine_rate]
  end
end

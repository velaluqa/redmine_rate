module RedmineRate
  module Hooks
    class ViewsTimelogHook < Redmine::Hook::ViewListener
      def view_timelog_edit_form_bottom(context = {})
        content_tag :p, context[:form].check_box(:billable, required: true)
      end
      def view_issues_timelog_form_bottom(context = {})
        content_tag :p, context[:form].check_box(:billable, required: true)
      end
    end
  end
end

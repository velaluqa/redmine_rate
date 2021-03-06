module RedmineRate
  module Hooks
    module TimesheetHookHelper
      # Returns the cost of a time entry, checking user permissions
      def cost_item(time_entry)
        time_entry.cost if User.current.logged? && (User.current.allowed_to?(:view_rate, time_entry.project) || User.current.admin?)
      end

      def td_cell(html)
        content_tag(:td, html, align: 'right', class: 'cost')
      end
    end
  end
end

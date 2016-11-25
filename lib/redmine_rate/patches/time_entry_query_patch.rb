require_dependency 'time_entry'

module RedmineRate
  module Patches
    module TimeEntryQueryPatch
      def self.included(base)
        base.extend(ClassMethods)
        base.send(:include, InstanceMethods)
        base.class_eval do
          alias_method_chain :initialize_available_filters, :cost
          alias_method_chain :default_columns_names, :cost
          alias_method_chain :default_totalable_names, :cost

          TimeEntryQuery.available_columns.push(
            QueryColumn.new(:cost, sortable: "#{TimeEntry.table_name}.cost", totalable: true),
            QueryColumn.new(:billable, sortable: "#{TimeEntry.table_name}.billable"),
          )

          def total_for_cost(scope)
            map_total(scope.sum(:cost)) { |t| t.to_f.round(2) }
          end
        end
      end

      module ClassMethods
      end

      module InstanceMethods
        def initialize_available_filters_with_cost
          initialize_available_filters_without_cost
          add_available_filter('cost', type: :float)
          add_available_filter('billable', type: :list, values: [[l(:general_text_yes), '1'], [l(:general_text_no), '0']])
        end

        def default_columns_names_with_cost
          @default_columns_names ||=
            default_columns_names_without_cost + [:cost, :billable]
        end

        def default_totalable_names_with_cost
          default_totalable_names_without_cost + [:cost]
        end
      end
    end
  end
end

unless TimeEntryQuery.included_modules.include?(RedmineRate::Patches::TimeEntryQueryPatch)
  TimeEntryQuery.send(:include, RedmineRate::Patches::TimeEntryQueryPatch)
end

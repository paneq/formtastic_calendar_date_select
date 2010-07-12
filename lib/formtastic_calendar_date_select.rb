module DavidOshiro
  module Formtastic
    module CalendarDateSelect

      class Railtie < ::Rails::Railtie
        initializer 'formtastic.calendardateselect.initialize', :after => ['calendardateselect.initialize', 'formtastic.initialize'] do      

          Formtastic::SemanticFormBuilder.module_eval do

            include DavidOshiro::Formtastic::CalendarDateSelect
            
            def default_input_type_with_calendar(method, options = {})
              return :calendar if column = self.column_for(method) && column.respond_to?(:type) && column.type == :date
              default_input_type_without_calendar(method, options)
            end

            alias_method_chain :default_input_type, :calendar

          end # module_eval
        end # initializer
      end # Railtie

      protected
		
      def calendar_input(method, options = {})
        self.label(method, options_for_label(options)) +
          self.calendar_date_select(method, strip_formtastic_options(options))
      end

    end # CalendarDateSelect
  end # Formtastic
end # DavidOshiro

module DavidOshiro
  module Formtastic
    module CalendarDateSelect

      class Railtie < ::Rails::Railtie
        initializer 'formtastic.calendardateselect.initialize', :after => ['calendardateselect.initialize', 'formtastic.initialize'] do      
          Formtastic::SemanticFormBuilder.send(:include, DavidOshiro::Formtastic::CalendarDateSelect)
        end
      end

      protected
		
      def calendar_input(method, options = {})
        self.label(method, options_for_label(options)) +
          self.calendar_date_select(method, strip_formtastic_options(options))
      end

    end
  end
end

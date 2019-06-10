module Nexmo
  module OAS
    module Renderer
      module Filters
        class Audio < Banzai::Filter
          def call(input)
            input.gsub(/[u{🔈}]\[(.+?)\]/) do
              audio = <<~HEREDOC
                <audio controls>
                  <source src="#{$1}" type="audio/mpeg">
                </audio>
              HEREDOC

              "FREEZESTART#{Base64.urlsafe_encode64(audio)}FREEZEEND"
            end
          end
        end
      end
    end
  end
end
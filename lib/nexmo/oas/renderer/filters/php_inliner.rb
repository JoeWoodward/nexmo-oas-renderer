module Nexmo
  module OAS
    module Renderer
      module Filters
        class PHPInliner < Banzai::Filter
          def call(input)
            input.gsub(/(```php)\n/) do
              "#{$1}?start_inline=1\n"
            end
          end
        end
      end
    end
  end
end

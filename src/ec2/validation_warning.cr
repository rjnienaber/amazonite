private alias Core = Amazonite::Core

module Amazonite::EC2
  # The error codes and error messages that are returned for the parameters or parameter
  # combinations that are not valid when a new launch template or new version of a launch template
  # is created.
  class ValidationWarning
    # The error codes and error messages.
    property errors : Array(ValidationError) | Nil

    def initialize(
      @errors : Array(ValidationError) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@errors || [] of ValidationError).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ErrorSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        errors: node.xpath_nodes("*[local-name()='errorSet']/*[local-name()='item']").map { |n| ValidationError.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @errors
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@errors)
  end
end

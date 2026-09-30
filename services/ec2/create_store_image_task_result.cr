private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateStoreImageTaskResult
    # The name of the stored AMI object in the S3 bucket.
    property object_key : String | Nil

    def initialize(
      @object_key : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @object_key
        params << {"#{prefix}ObjectKey", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        object_key: Core::XMLValue.string(node.xpath_node("*[local-name()='objectKey']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@object_key)
  end
end

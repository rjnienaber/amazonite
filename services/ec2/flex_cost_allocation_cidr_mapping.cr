private alias Core = Amazonite::Core

module Amazonite::EC2
  # Maps a CIDR range to a label for cost allocation reporting.
  class FlexCostAllocationCidrMapping
    # The CIDR range. This parameter is required.
    property cidr_range : String

    # The label to assign to the CIDR range. The label can be up to 64 characters long. It can contain
    # letters, numbers, hyphens (`-`), and underscores (`_`), and must start with a letter or a
    # number. This parameter is required.
    property cidr_label : String

    def initialize(
      @cidr_range : String,
      @cidr_label : String,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}CidrRange", @cidr_range}

      params << {"#{prefix}CidrLabel", @cidr_label}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        cidr_range: Core::XMLValue.string(node.xpath_node("*[local-name()='CidrRange']")).not_nil!,
        cidr_label: Core::XMLValue.string(node.xpath_node("*[local-name()='CidrLabel']")).not_nil!,
      )
    end

    def validate! : Nil
      if value = @cidr_range
        raise Core::ValidationError.new("CidrRange length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("CidrRange length must be <= 43") if value.size > 43
      end

      if value = @cidr_label
        raise Core::ValidationError.new("CidrLabel length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("CidrLabel length must be <= 64") if value.size > 64
        raise Core::ValidationError.new("CidrLabel does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9][a-zA-Z0-9_\\-]{0,63}$"))
      end
    end

    def_equals_and_hash(@cidr_range, @cidr_label)
  end
end
